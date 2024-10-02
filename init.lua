require("maduka.init")

-- HTML Macro for HTML5
vim.api.nvim_set_var('q', 'i<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n    <meta name="viewport" content="width=device-width, initial-scale=1.0">\n    <title>Document</title>\n</head>\n<body>\n\n</body>\n</html>')

vim.opt.rtp:remove('/squashfs-root/usr/lib/nvim')
