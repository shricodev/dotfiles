return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  opts = function(_, opts)
    local ls = require 'luasnip'

    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node

    local function clipboard()
      return vim.fn.getreg '+'
    end

    -- Custom snippets
    -- the "all" after ls.add_snippets("all" is the filetype, you can know a
    -- file filetype with :set ft
    -- Custom snippets

    -- #####################################################################
    --                            Markdown
    -- #####################################################################

    -- Helper function to create code block snippets
    local function create_code_block_snippet(lang)
      return s({
        trig = lang,
        name = 'Codeblock',
        desc = lang .. ' codeblock',
      }, {
        t { '```' .. lang, '' },
        i(1),
        t { '', '```' },
      })
    end

    -- Define languages for code blocks
    local languages = {
      'txt',
      'lua',
      'sql',
      'go',
      'regex',
      'bash',
      'markdown',
      'markdown_inline',
      'yaml',
      'json',
      'jsonc',
      'cpp',
      'csv',
      'java',
      'javascript',
      'python',
      'dockerfile',
      'html',
      'css',
      'templ',
      'php',
    }

    -- Generate snippets for all languages
    local snippets = {}

    for _, lang in ipairs(languages) do
      table.insert(snippets, create_code_block_snippet(lang))
    end

    table.insert(
      snippets,
      s({
        trig = 'prettierignore',
        name = 'Add prettier ignore start and end headings',
        desc = 'Add prettier ignore start and end headings',
      }, {
        t {
          ' ',
          '<!-- prettier-ignore-start -->',
          ' ',
          '> ',
        },
        i(1),
        t {
          ' ',
          ' ',
          '<!-- prettier-ignore-end -->',
        },
      })
    )

    table.insert(
      snippets,
      s({
        trig = 'linkt',
        name = 'Add this -> [](){:target="_blank"}',
        desc = 'Add this -> [](){:target="_blank"}',
      }, {
        t '[',
        i(1),
        t '](',
        i(2),
        t '){:target="_blank"}',
      })
    )

    table.insert(
      snippets,
      s({
        trig = 'todo',
        name = 'Add TODO: item',
        desc = 'Add TODO: item',
      }, {
        t '<!-- TODO: ',
        i(1),
        t ' -->',
      })
    )

    -- Paste clipboard contents in link section, move cursor to ()
    table.insert(
      snippets,
      s({
        trig = 'linkclip',
        name = 'Paste clipboard as .md link',
        desc = 'Paste clipboard as .md link',
      }, {
        t '[',
        i(1),
        t '](',
        f(clipboard, {}),
        t ')',
      })
    )

    ls.add_snippets('markdown', snippets)
    return opts
  end,
}
