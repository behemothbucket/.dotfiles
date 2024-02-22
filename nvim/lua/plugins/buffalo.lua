return {
  'Pheon-Dev/buffalo-nvim',
  config = function()
    require("buffalo").setup({
      buffer_commands = { -- use default neovim commands for buffers e.g `bd`, `edit`
        edit = {
          key = "<CR>",
          command = "edit"
        },
        vsplit = {
          key = "v",
          command = "vsplit"
        },
        split = {
          key = "h",
          command = "split"
        },
        buffer_delete = {
          key = "dd",
          command = "bd"
        },
      },
      general_commands = {
        cycle = true,    -- cycle through the list
        exit_menu = "x", -- similar to 'q' and '<esc>'
      },
      ui = {
        width = 60,
        height = 10,
        row = 2,
        col = 2,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      }
    })
  end
}
