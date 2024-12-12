-- Define the statusline configuration
local M = {}

-- Map filetypes to emojis
local ft_emoji = {
    c = "🐤",
    clojure = "🍭",
    coffee = "☕",
    cpp = "🐔",
    css = "🎨",
    scss = "👛",
    eruby = "💍",
    gitcommit = "🔜",
    haml = "🔨",
    help = "😇",
    lua = "🌙",
    html = "🌿",
    php = "🐘",
    xml = "📄",
    java = "👴",
    javascript = "🐒",
    make = "🌱",
    markdown = "📖",
    perl = "🐪",
    python = "🐍",
    ruby = "💎",
    scala = "💈",
    sh = "🐚",
    slim = "💃",
    text = "📚",
    vim = "💩",
    ["vim-plug"] = "🔌",
    yaml = "😋",
    ["yaml.jinja"] = "😋",
    fish = "🐟",
}

-- Helper functions
local function filetype()
    local ft = vim.bo.filetype
    if ft == "" then
        return "❓"
    else
        return ft_emoji[ft] or "[" .. ft .. "]"
    end
end

local function modified()
    if vim.bo.modified then
        return "😘 "
    elseif not vim.bo.modifiable then
        return "🚧 "
    else
        return ""
    end
end

local function git_branch()
    local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
    if vim.v.shell_error ~= 0 then
        return "" -- Not a Git repository
    end
    return branch == "master" and "👑" or "🍡=" .. branch
end

local braille_chars = { "⠉", "⠒", "⠤", "⣀" }
local function braille()
    local len = #braille_chars
    local cur = vim.fn.line(".")
    local max = vim.fn.line("$")
    local pos = math.min(math.floor(len * (cur - 1) / math.max(1, max - 1)), len - 1)
    return braille_chars[pos + 1]
end

-- Cherry blossom separator
local cherry = "🌸"

-- Statusline function
function M.statusline()
    local cwd = vim.api.nvim_call_function("fnamemodify", { vim.loop.cwd(), ':t'})
    local mod = modified()
    local ro = vim.bo.readonly and "🔒 " or ""
    local ft = filetype()
    local branch = git_branch()
    local pos = "%l,%c%V"
    local pct = "%P"

    return string.format(
        "%s %s> %s %s%s %s %%= %s %s%s %s %s",
        cherry,
        -- vim.fn.bufnr("%"),
        cwd,
        vim.fn.pathshorten(vim.fn.expand("%:f")),
        mod,
        ro,
        ft,
        branch,
        pos,
        braille(),
        pct,
        cherry
    )
end

-- Set the statusline
vim.o.statusline = "%!v:lua.require'kozie.statusline'.statusline()"

return M
