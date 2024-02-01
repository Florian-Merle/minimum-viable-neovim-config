local function buffer_dir()
    return vim.fn.expand("%:p:h")
end

local function get_visual_selection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg('v')
    vim.fn.setreg('v', {})

    text = string.gsub(text, "\n", "")

    if #text > 0 then
        return text
    else
        return ''
    end
end

local get_target_dir = function(prompt_bufnr)
    local finder = require("telescope.actions.state").get_current_picker(prompt_bufnr).finder
    local entry_path
    if finder.files == false then
        local entry = require("telescope.actions.state").get_selected_entry()
        entry_path = entry and entry.value
    end
    return finder.files and finder.path or entry_path
end

local function live_grep(prompt_bufnr, opts)
    local options = opts or {}

    local rg_args = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
    }

    if options.unrestricted or false == true then
        rg_args[#rg_args+1] = "-uu"
    end

    local live_grep_opts = {
        string.format("vimgrep_arguments=%s", table.concat(rg_args, ','))
    }

    if prompt_bufnr ~= nil then
        live_grep_opts[#live_grep_opts+1] = string.format("cwd=%s", get_target_dir(prompt_bufnr))
    end

    vim.cmd(string.format(
    "Telescope live_grep %s",
    table.concat(live_grep_opts, ' ')
    ))
end

return {
    buffer_dir = buffer_dir,
    get_visual_selection = get_visual_selection,
    live_grep = live_grep,
}
