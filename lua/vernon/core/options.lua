vim.cmd("let g:netrw_liststyle = 3") 

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = true -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- Required for markdown symbols and images to render properly
vim.opt.conceallevel = 2

-- Enable mouse support in all modes
vim.opt.mouse = "a" 

-- Add "Open in New Tab" to the right-click context menu
-- 2. Create a smart global function to resolve the file path under the mouse
_G.open_right_clicked_node_in_tab = function()
  -- Force Neovim to register the mouse position and click the sidebar node first
  vim.api.nvim_input("<LeftMouse>")
  
  -- Give Neovim a tiny microsecond to update its internal cursor position
  vim.schedule(function()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.bo[bufnr].filetype

    -- IF WE ARE IN NEO-TREE: Extract the actual file path from the hovered node
    if ft == "neo-tree" then
      local success, state = pcall(require, "neo-tree.sources.manager")
      if success then
        -- Get the current state of the filesystem source
        local fs_state = state.get_state("filesystem")
        if fs_state and fs_state.tree then
          local node = fs_state.tree:get_node()
          if node and node.type ~= "directory" then
            -- Safely open the real file path in a new tab
            vim.cmd("tabedit " .. vim.fn.fnameescape(node.path))
            return
          end
        end
      end
    end

    -- IF WE ARE IN A NORMAL FILE: Just open the file normally
    if ft ~= "neo-tree" and ft ~= "" then
      vim.cmd("tabedit %")
    end
  end)
end

-- 3. Map the right-click menu item to our smart Lua function
-- We use a silent call so it doesn't flash commands on your screen
vim.cmd([[
  anoremenu PopUp.Open\ in\ New\ Tab :lua _G.open_right_clicked_node_in_tab()<CR>
]])
