-- Highlight the yanked area.
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_group,
  pattern = "*",
  desc = "Highlight selection on yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open the help window to the right
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
  pattern = "help",
  callback = function()
    vim.bo.bufhidden = "unload"
    vim.cmd.wincmd("L")
    vim.cmd.wincmd("=")
  end,
})

-- Enable spell checking and text wrapping for gitcommit, markdown and txt files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("edit_text", { clear = true }),
  pattern = { "gitcommit", "markdown", "txt" },
  desc = "Enable spell checking and text wrapping for certain filetypes",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true

    -- This ignores spell check on camel words that are actually valid like HelloWorld.
    vim.opt_local.spelloptions:append("camel")
  end,
})

-- Toggle LSP Diagnostics
vim.api.nvim_create_user_command("ToggleDiagnostics", function()
  if vim.g.diagnostics_enabled == nil then
    vim.g.diagnostics_enabled = false
    vim.diagnostic.disable()
  elseif vim.g.diagnostics_enabled then
    vim.g.diagnostics_enabled = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_enabled = true
    vim.diagnostic.enable()
  end
end, {})

-- Set "CmpItemKind" highlight group
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
