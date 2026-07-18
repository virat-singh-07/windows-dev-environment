return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys={
	    {
            "<leader>ff",
	    function()
		    require("telescope.builtin").find_files()
	    end,
            desc = "Find files",
        },
    }
}
