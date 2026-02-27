return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ts = require 'nvim-treesitter'

      ts.setup {
        install_dir = vim.fn.stdpath 'data' .. '/site',
      }

      local wanted = {
        'bash',
        'css',
        'diff',
        'dockerfile',
        'git_rebase',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'html',
        'javascript',
        'json',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'regex',
        'sql',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
        'make',
        'proto',
      }

      -- Install only missing parsers
      local ok_cfg, cfg = pcall(require, 'nvim-treesitter.config')
      if ok_cfg and cfg and cfg.get_installed then
        local installed = cfg.get_installed()
        local missing = {}
        for _, lang in ipairs(wanted) do
          if not vim.tbl_contains(installed, lang) then
            table.insert(missing, lang)
          end
        end
        if #missing > 0 then
          ts.install(missing)
        end
      else
        -- Fallback, still works fine
        ts.install(wanted)
      end

      local group = vim.api.nvim_create_augroup('TreeSitterMain', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang then
            return
          end

          if vim.list_contains(ts.get_installed(), lang) then
            vim.treesitter.start(args.buf)
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
