const shellQuote = require("shell-quote").quote

module.exports = {
  "*.{ts,tsx,js,json,css}": (filenames) => [
    ...filenames.map((filename) => `prettier --check "${shellQuote([filename])}"`),
    ...filenames.map((filename) => `git add "${filename}"`)
  ],
  "*.{ts,tsx,js,jsx}": ["eslint"],
  "*.{ts,tsx,css}": ["stylelint"]
}
