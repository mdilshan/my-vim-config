require("rose-pine").setup({
    styles = {
        transparency = true,
    }
})

function Color(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

end

Color()
