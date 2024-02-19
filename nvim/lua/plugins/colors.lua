return {
    'rockerBOO/boo-colorscheme-nvim',
    config = function()
        require("boo-colorscheme").use({
            italic = false, -- toggle italics
            theme = "boo"
        })    
	    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}