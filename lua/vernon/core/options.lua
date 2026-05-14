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

-- Fully optimized right-click handler for Nvim-tree and standard files
_G.open_right_clicked_node_in_tab = function()
  -- Grab exact mouse coordinate details right away
  local mouse_pos = vim.fn.getmousepos()
  if mouse_pos.winid <= 0 then return end

  -- Safely move context to the window and line under the mouse cursor
  vim.api.nvim_set_current_win(mouse_pos.winid)
  vim.api.nvim_win_set_cursor(mouse_pos.winid, { mouse_pos.line, mouse_pos.column - 1 })

  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype

  -- SPECIAL CASE: If right-clicking inside Nvim-tree
  if ft == "NvimTree" then
    local success, api = pcall(require, "nvim-tree.api")
    if success then
      local node = api.tree.get_node_under_cursor()
      -- Ensure we have a valid file node and it's not a directory/folder
      if node and node.name ~= ".." and node.type == "file" then
        local target_path = node.absolute_path

        -- Create a completely empty new tab layout
        vim.cmd("tabnew")
        
        -- Open the exact target file path in this new clean window
        vim.cmd("edit " .. vim.fn.fnameescape(target_path))

        -- Force Nvim-tree to close its auto-spawned clone ONLY inside this tab
        pcall(function()
          api.tree.close()
        end)
        return
      end
    end
  end

  -- STANDARD CASE: If right-clicking inside a normal open file editor buffer
  if ft ~= "NvimTree" and ft ~= "" then
    vim.cmd("tabedit %")
  end
end

-- Unregister old right-click hooks to avoid execution loops
pcall(vim.cmd, "unmenu PopUp.Open\\ in\\ New\\ Tab")

-- Register the clean entry point to the PopUp menu
-- Move the popup open right click option to the top with a seperator component configured
vim.cmd([[
  amenu 10.10 PopUp.-Sep- :
  anoremenu 10.12 PopUp.Open\ in\ New\ Tab :lua _G.open_right_clicked_node_in_tab()<CR>
]])
