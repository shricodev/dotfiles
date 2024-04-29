return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true,
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['a='] = { query = '@assignment.outer', desc = '[TextObject]: Select outer part of an assignment' },
            ['i='] = { query = '@assignment.inner', desc = '[TextObject]: Select inner part of an assignment' },
            ['l='] = { query = '@assignment.lhs', desc = '[TextObject]: Select left hand side of an assignment' },
            ['r='] = { query = '@assignment.rhs', desc = '[TextObject]: Select right hand side of an assignment' },

            -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
            ['a:'] = { query = '@property.outer', desc = '[TextObject]: Select outer part of an object property' },
            ['i:'] = { query = '@property.inner', desc = '[TextObject]: Select inner part of an object property' },
            ['l:'] = { query = '@property.lhs', desc = '[TextObject]: Select left part of an object property' },
            ['r:'] = { query = '@property.rhs', desc = '[TextObject]: Select right part of an object property' },

            ['aa'] = { query = '@parameter.outer', desc = '[TextObject]: Select outer part of a parameter/argument' },
            ['ia'] = { query = '@parameter.inner', desc = '[TextObject]: Select inner part of a parameter/argument' },

            ['ai'] = { query = '@conditional.outer', desc = '[TextObject]: Select outer part of a conditional' },
            ['ii'] = { query = '@conditional.inner', desc = '[TextObject]: Select inner part of a conditional' },

            ['al'] = { query = '@loop.outer', desc = '[TextObject]: Select outer part of a loop' },
            ['il'] = { query = '@loop.inner', desc = '[TextObject]: Select inner part of a loop' },

            ['af'] = { query = '@call.outer', desc = '[TextObject]: Select outer part of a function call' },
            ['if'] = { query = '@call.inner', desc = '[TextObject]: Select inner part of a function call' },

            ['am'] = { query = '@function.outer', desc = '[TextObject]: Select outer part of a method/function definition' },
            ['im'] = { query = '@function.inner', desc = '[TextObject]: Select inner part of a method/function definition' },

            ['ac'] = { query = '@class.outer', desc = '[TextObject]: Select outer part of a class' },
            ['ic'] = { query = '@class.inner', desc = '[TextObject]: Select inner part of a class' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>na'] = '@parameter.inner', -- swap parameters/argument with next
            ['<leader>n:'] = '@property.outer', -- swap object property with next
            ['<leader>nm'] = '@function.outer', -- swap function with next
          },
          swap_previous = {
            ['<leader>pa'] = '@parameter.inner', -- swap parameters/argument with prev
            ['<leader>p:'] = '@property.outer', -- swap object property with prev
            ['<leader>pm'] = '@function.outer', -- swap function with previous
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']f'] = { query = '@call.outer', desc = '[TextObject]: Next function call start' },
            [']m'] = { query = '@function.outer', desc = '[TextObject]: Next method/function def start' },
            [']c'] = { query = '@class.outer', desc = '[TextObject]: Next class start' },
            [']i'] = { query = '@conditional.outer', desc = '[TextObject]: Next conditional start' },
            [']l'] = { query = '@loop.outer', desc = '[TextObject]: Next loop start' },

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            [']s'] = { query = '@scope', query_group = 'locals', desc = '[TextObject]: Next scope' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = '[TextObject]: Next fold' },
          },
          goto_next_end = {
            [']F'] = { query = '@call.outer', desc = '[TextObject]: Next function call end' },
            [']M'] = { query = '@function.outer', desc = '[TextObject]: Next method/function def end' },
            [']C'] = { query = '@class.outer', desc = '[TextObject]: Next class end' },
            [']I'] = { query = '@conditional.outer', desc = '[TextObject]: Next conditional end' },
            [']L'] = { query = '@loop.outer', desc = '[TextObject]: Next loop end' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@call.outer', desc = '[TextObject]: Prev function call start' },
            ['[m'] = { query = '@function.outer', desc = '[TextObject]: Prev method/function def start' },
            ['[c'] = { query = '@class.outer', desc = '[TextObject]: Prev class start' },
            ['[i'] = { query = '@conditional.outer', desc = '[TextObject]: Prev conditional start' },
            ['[l'] = { query = '@loop.outer', desc = '[TextObject]: Prev loop start' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@call.outer', desc = '[TextObject]: Prev function call end' },
            ['[M'] = { query = '@function.outer', desc = '[TextObject]: Prev method/function def end' },
            ['[C'] = { query = '@class.outer', desc = '[TextObject]: Prev class end' },
            ['[I'] = { query = '@conditional.outer', desc = '[TextObject]: Prev conditional end' },
            ['[L'] = { query = '@loop.outer', desc = '[TextObject]: Prev loop end' },
          },
        },
      },
    }

    local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    -- -- vim way: ; goes to the direction you were moving.
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move, { desc = '[TextObject]: Repeat last move' })
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite, { desc = '[TextObject]: Repeat last move in opposite direction' })

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f, { desc = '[TextObject]: Find a character' })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F, { desc = '[TextObject]: Find a character backwards' })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t, { desc = '[TextObject]: Go till the character' })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T, { desc = '[TextObject]: Go till the character backwards' })
  end,
}
