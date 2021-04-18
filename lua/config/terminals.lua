nmap { '<c-s>v', [[<cmd>vsplit <bar> e term://pwsh <cr>]]}
nmap { '<c-s>s', [[<cmd>split <bar> e term://pwsh <cr>]]}
tmap { '<Esc>', '<C-\\><C-n>' }

autocmd {
    { 'TermOpen' },
    { '*' },
    function()
        vim.wo.nu = false
        vim.wo.rnu = false
    end
}
