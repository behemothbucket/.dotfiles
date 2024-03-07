local status_ok, refactoring = pcall(require, 'refactoring')
if not status_ok then
    return
end

refactoring.setup({
    prompt_func_return_type = {
        go     = false,
        java   = false,
        python = false,

        cpp    = false,
        c      = false,
        h      = false,
        hpp    = false,
        cxx    = false,
        lua    = false,
    },
    prompt_func_param_type = {
        go = true,
        java = false,
        python = false,

        lua = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
})
