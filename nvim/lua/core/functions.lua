vim.api.nvim_create_user_command('Swenv', function()
    require('swenv.api').pick_venv()
end, {})

