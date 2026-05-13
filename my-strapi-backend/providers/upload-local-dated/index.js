'use strict';

/**
 * Same behavior as `@strapi/provider-upload-local`, but files are stored as
 *   public/uploads/YYYY/MM/DD/<hash><ext>
 * Deletes work from `file.url` (supports legacy flat `/uploads/<hash><ext>`).
 */

const fs = require('fs');
const path = require('path');
const nodeStream = require('stream');

const fse = require('fs-extra');
const utils = require('@strapi/utils');

const { PayloadTooLargeError } = utils.errors;
const { kbytesToBytes, bytesToHumanReadable } = utils.file;
const UPLOADS_FOLDER_NAME = 'uploads';

function dateSegment(d = new Date()) {
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return `${y}/${m}/${day}`;
}

module.exports = {
  init({ sizeLimit: providerOptionsSizeLimit } = {}) {
    if (providerOptionsSizeLimit) {
      process.emitWarning(
        '[deprecated] In future versions, "sizeLimit" argument will be ignored from upload.config.providerOptions. Move it to upload.config'
      );
    }

    const uploadRoot = path.resolve(strapi.dirs.static.public, UPLOADS_FOLDER_NAME);

    function nestedPathParts(file) {
      const segment = dateSegment();
      const name = `${file.hash}${file.ext}`;
      const filePath = path.join(uploadRoot, segment, name);
      return { segment, name, filePath };
    }

    /** Physical path from DB URL or legacy flat name */
    function physicalPath(file) {
      if (typeof file.url === 'string' && file.url.startsWith(`/${UPLOADS_FOLDER_NAME}/`)) {
        const rel = file.url.replace(/^\/+/u, '').replace(/^uploads[/\\]/iu, '').replace(/\\/g, '/');
        return path.join(uploadRoot, rel);
      }
      return path.join(uploadRoot, `${file.hash}${file.ext}`);
    }

    return {
      checkFileSize(file, options) {
        const { sizeLimit } = options ?? {};
        if (providerOptionsSizeLimit) {
          if (kbytesToBytes(file.size) > providerOptionsSizeLimit)
            throw new PayloadTooLargeError(
              `${file.name} exceeds size limit of ${bytesToHumanReadable(providerOptionsSizeLimit)}.`
            );
        } else if (sizeLimit) {
          if (kbytesToBytes(file.size) > sizeLimit)
            throw new PayloadTooLargeError(`${file.name} exceeds size limit of ${bytesToHumanReadable(sizeLimit)}.`);
        }
      },

      uploadStream(file) {
        if (!file.stream) return Promise.reject(new Error('Missing file stream'));

        const { stream: readable } = file;
        const { segment, filePath } = nestedPathParts(file);

        return (async () => {
          const existsRoot = await fse.pathExists(uploadRoot);
          if (!existsRoot) {
            throw new Error(`The upload folder (${uploadRoot}) doesn't exist or is not accessible. Please make sure it exists.`);
          }
          await fse.mkdir(path.dirname(filePath), { recursive: true });
          await new Promise((resolve, reject) => {
            nodeStream.pipeline(readable, fs.createWriteStream(filePath), (err) =>
              err ? reject(err) : resolve()
            );
          });
          const relWeb = `${segment}/${file.hash}${file.ext}`.replace(/\\/g, '/');
          file.url = `/${UPLOADS_FOLDER_NAME}/${relWeb}`;
        })();
      },

      upload(file) {
        if (!file.buffer) return Promise.reject(new Error('Missing file buffer'));

        const { buffer } = file;
        const { segment, filePath } = nestedPathParts(file);

        return (async () => {
          const existsRoot = await fse.pathExists(uploadRoot);
          if (!existsRoot) {
            throw new Error(`The upload folder (${uploadRoot}) doesn't exist or is not accessible. Please make sure it exists.`);
          }
          await fse.mkdir(path.dirname(filePath), { recursive: true });
          await fse.writeFile(filePath, buffer);
          const relWeb = `${segment}/${file.hash}${file.ext}`.replace(/\\/g, '/');
          file.url = `/${UPLOADS_FOLDER_NAME}/${relWeb}`;
        })();
      },

      delete(file) {
        return new Promise((resolve, reject) => {
          const filePath = physicalPath(file);
          if (!fs.existsSync(filePath)) {
            resolve("File doesn't exist");
            return;
          }
          fs.unlink(filePath, (err) => (err ? reject(err) : resolve()));
        });
      },
    };
  },
};
