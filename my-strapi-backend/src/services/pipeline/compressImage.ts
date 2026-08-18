import sharp from 'sharp';

export const MAX_IMAGE_BYTES = 450 * 1024;

async function toJpeg(input: Buffer, width: number, quality: number): Promise<Buffer> {
  return sharp(input)
    .rotate()
    .resize({ width, withoutEnlargement: true })
    .jpeg({ quality, mozjpeg: true, chromaSubsampling: '4:2:0' })
    .toBuffer();
}

/** Always returns a JPEG no larger than 450KB. */
export async function compressImage(input: Buffer): Promise<Buffer> {
  let width = 1200;
  let quality = 78;
  let output = await toJpeg(input, width, quality);

  for (let step = 0; step < 14 && output.length > MAX_IMAGE_BYTES; step += 1) {
    if (quality > 48) {
      quality -= 10;
    } else if (width > 720) {
      width = Math.round(width * 0.8);
      quality = 56;
    } else if (quality > 32) {
      quality -= 6;
    } else {
      width = Math.max(480, Math.round(width * 0.75));
    }
    output = await toJpeg(input, width, quality);
  }

  if (output.length > MAX_IMAGE_BYTES) {
    throw new Error(
      `Could not compress image under 450KB (got ${Math.round(output.length / 1024)}KB)`
    );
  }

  return output;
}
