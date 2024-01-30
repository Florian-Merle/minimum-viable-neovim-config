local function buffer_dir()
    return vim.fn.expand("%:p:h")
end

return {
    buffer_dir = buffer_dir,
}
