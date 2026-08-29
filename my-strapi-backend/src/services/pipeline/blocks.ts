type HeadingLevel = 1 | 2 | 3 | 4 | 5 | 6;
type BlockText = { type: 'text'; text: string; bold?: boolean };
type Block =
  | { type: 'paragraph'; children: BlockText[] }
  | { type: 'heading'; level: HeadingLevel; children: BlockText[] };

const splitLongText = (text: string, max = 1200): string[] => {
  if (text.length <= max) return [text];
  const parts: string[] = [];
  let rest = text;
  while (rest.length > max) {
    const window = rest.slice(0, max);
    const cut = Math.max(window.lastIndexOf('. '), window.lastIndexOf('? '), window.lastIndexOf('! '));
    const at = cut >= 400 ? cut + 1 : max;
    parts.push(rest.slice(0, at).trim());
    rest = rest.slice(at).trim();
  }
  if (rest) parts.push(rest);
  return parts.filter(Boolean);
};

const stripMarkdown = (value: string): string =>
  value
    .replace(/\*\*(.*?)\*\*/g, '$1')
    .replace(/\*(.*?)\*/g, '$1')
    .replace(/`([^`]+)`/g, '$1')
    .replace(/\[(.*?)\]\((.*?)\)/g, '$1')
    .trim();

/**
 * Convert rewritten article text (markdown-ish or plain) into Strapi 5 blocks.
 */
export function textToBlocks(text: string): Block[] {
  const cleaned = (text || '').replace(/\r\n/g, '\n').trim();
  if (!cleaned) {
    return [{ type: 'paragraph', children: [{ type: 'text', text: '' }] }];
  }

  const chunks = cleaned.split(/\n{2,}/);
  const blocks: Block[] = [];

  for (const chunk of chunks) {
    const lines = chunk.split('\n').map((l) => l.trim()).filter(Boolean);
    if (!lines.length) continue;

    let i = 0;
    while (i < lines.length) {
      const heading = lines[i].match(/^(#{1,3})\s+(.+)$/);
      if (heading) {
        blocks.push({
          type: 'heading',
          level: Math.min(heading[1].length, 6) as HeadingLevel,
          children: [{ type: 'text', text: stripMarkdown(heading[2]) }],
        });
        i += 1;
        continue;
      }
      const para: string[] = [];
      while (i < lines.length && !/^(#{1,3})\s+/.test(lines[i])) {
        para.push(lines[i]);
        i += 1;
      }
      if (para.length) {
        const text = stripMarkdown(para.join(' '));
        for (const piece of splitLongText(text, 1200)) {
          blocks.push({
            type: 'paragraph',
            children: [{ type: 'text', text: piece }],
          });
        }
      }
    }
  }

  return blocks.length
    ? blocks
    : [{ type: 'paragraph', children: [{ type: 'text', text: cleaned }] }];
}

export function estimateReadTime(text: string): number {
  const words = (text || '').trim().split(/\s+/).filter(Boolean).length;
  return Math.max(1, Math.round(words / 200));
}
