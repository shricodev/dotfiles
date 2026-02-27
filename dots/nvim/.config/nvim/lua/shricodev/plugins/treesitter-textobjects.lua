local keymap_namer = require('shricodev.utils').keymap_namer

return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          enable = true,
          lookahead = true,
          selection_modes = {
            ['@function.outer'] = 'V',
          },
          include_surrounding_whitespace = true,
        },
        move = {
          enable = true,
          set_jumps = true,
        },
      }

      local sel = require 'nvim-treesitter-textobjects.select'
      local mv = require 'nvim-treesitter-textobjects.move'

      local function map(modes, lhs, rhs, desc)
        vim.keymap.set(modes, lhs, rhs, { silent = true, desc = desc })
      end

      map({ 'x', 'o' }, 'af', function()
        sel.select_textobject('@call.outer', 'textobjects')
      end, keymap_namer('textobject', 'select outer part of function call.'))

      map({ 'x', 'o' }, 'if', function()
        sel.select_textobject('@call.inner', 'textobjects')
      end, keymap_namer('textobject', 'select inner part of function call.'))

      map({ 'x', 'o' }, 'am', function()
        sel.select_textobject('@function.outer', 'textobjects')
      end, keymap_namer('textobject', 'select outer part of a method/function definition'))

      map({ 'x', 'o' }, 'im', function()
        sel.select_textobject('@function.inner', 'textobjects')
      end, keymap_namer('textobject', 'select inner part of a method/function definition'))

      map({ 'x', 'o' }, 'ai', function()
        sel.select_textobject('@conditional.outer', 'textobjects')
      end, keymap_namer('textobject', 'select outer part of a conditional'))

      map({ 'x', 'o' }, 'ii', function()
        sel.select_textobject('@conditional.inner', 'textobjects')
      end, keymap_namer('textobject', 'select inner part of a conditional'))

      map({ 'x', 'o' }, 'ac', function()
        sel.select_textobject('@class.outer', 'textobjects')
      end, keymap_namer('textobject', 'select outer part of class definition.'))

      map({ 'x', 'o' }, 'ic', function()
        sel.select_textobject('@class.inner', 'textobjects')
      end, keymap_namer('textobject', 'select inner part of class definition.'))

      -- Move textobjects (same keys as before)
      map({ 'n', 'x', 'o' }, ']f', function()
        mv.goto_next_start('@call.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to next function call start'))

      map({ 'n', 'x', 'o' }, ']m', function()
        mv.goto_next_start('@function.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to next method/function definition start'))

      map({ 'n', 'x', 'o' }, ']c', function()
        mv.goto_next_start('@class.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to next class start'))

      map({ 'n', 'x', 'o' }, ']i', function()
        mv.goto_next_start('@conditional.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to next condition start'))

      map({ 'n', 'x', 'o' }, ']F', function()
        mv.goto_next_end('@call.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous function call end'))

      map({ 'n', 'x', 'o' }, ']M', function()
        mv.goto_next_end('@function.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous method/function definition end'))

      map({ 'n', 'x', 'o' }, ']C', function()
        mv.goto_next_end('@class.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous class end'))

      map({ 'n', 'x', 'o' }, ']I', function()
        mv.goto_next_end('@conditional.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous conditional end'))

      map({ 'n', 'x', 'o' }, '[f', function()
        mv.goto_previous_start('@call.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous function call start'))

      map({ 'n', 'x', 'o' }, '[m', function()
        mv.goto_previous_start('@function.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous method/function definition start'))

      map({ 'n', 'x', 'o' }, '[c', function()
        mv.goto_previous_start('@class.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous class start'))

      map({ 'n', 'x', 'o' }, '[i', function()
        mv.goto_previous_start('@conditional.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous conditional start'))

      map({ 'n', 'x', 'o' }, '[F', function()
        mv.goto_previous_end('@call.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous function call end'))

      map({ 'n', 'x', 'o' }, '[M', function()
        mv.goto_previous_end('@function.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous method/function definition end'))

      map({ 'n', 'x', 'o' }, '[C', function()
        mv.goto_previous_end('@class.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous class end'))

      map({ 'n', 'x', 'o' }, '[I', function()
        mv.goto_previous_end('@conditional.outer', 'textobjects')
      end, keymap_namer('textobject', 'move to previous conditional end'))
    end,
  },
}
