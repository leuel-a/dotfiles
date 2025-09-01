local client_id = vim.lsp.start_client {
    name = "simplelsp",
    cmd = { "/home/leuel/projects/go/simple_lsp/main" }
}

if not client_id then
    vim.notify("hey, you didn't do the client thing good")
    return
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    group = vim.api.nvim_create_augroup("MySimpleLspAttach", { clear = true }),
    callback = function(args)
        vim.lsp.buf_attach_client(args.buf, client_id)
    end
})
