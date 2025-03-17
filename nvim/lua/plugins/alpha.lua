return {
  'goolord/alpha-nvim',
  dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New file', ':ene<CR>'),
      dashboard.button('f', '󰈞  > Find file', ':Telescope find_files<CR>'),
      dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('s', '  > Settings', ':e ~/.config/nvim | :cd ~/.config/nvim | :Telescope find_files<CR>'),
      dashboard.button('q', '  > Quit NEOVIM', ':qa<CR>'),
    }

    local quotes = {
      { 'Talk is cheap. Show me the code.',                     '', '- Linus Torvalds' },
      {
        "I don't care if it works on your machine! We are not shipping your machine.",
        '',
        '- Vidiu Platon',
      },
      {
        'When in doubt, use brute force.',
        '',
        '- Ken Thompson',
      },
      {
        'Software comes from heaven when you have good hardware.',
        '',
        '- Ken Olsen',
      },
      {
        'If you optimize everything, you will always be unhappy.',
        '',
        '- Donald Knuth',
      },
      {
        'Small minds are concerned with the extraordinary, great minds with the ordinary.',
        '',
        '- Blaise Pascal',
      },
      {
        'Debugging becomes significantly easier if you first admit that you are the problem.',
        '',
        '- William Laeder',
      },
      { 'Computers are fast; developers keep them slow.',       '', '- Peter Coffee' },
      { "Don't comment bad code - rewrite it.",                 '', '- Brian Kernighan' },
      { 'Nothing is more permanent than a temporary solution.', '', '- Fyodor Dostoevsky' },
      {
        'Software is hard.',
        '',
        '- Donald Knuth',
      },
      {
        'They did not know it was impossible, so they did it!',
        '',
        '- Mark Twain',
      },
      {
        'To understand recursion, one must first understand recursion.',
        '',
        '- Stephen Hawking',
      },
      {
        'Fools ignore complexity. Pragmatists suffer it. Some can avoid it. Geniuses remove it.',
        '',
        '- Alan Perlis',
      },
      { "Code is like humor. When you have to explain it, it's bad.",           '', '- Cory House' },
      { 'Think twice, code once.',                                              '', '- Anonymous' },
      { 'The sooner you start to code, the longer the program will take.',      '', '- Roy Carlson' },
      { 'Computers are useless. They can only give you answers.',               '', '- Pablo Picasso' },
      { 'Almost every programming language is overrated by its practitioners.', '', '- Larry Wall' },
      {
        "If you don't make mistakes, you're not working on hard enough problems.",
        '',
        '- Frank Wilczek',
      },
      { 'Optimization hinders evolution.',                          '', '- Alan Perlis' },
      { 'Experience is the name everyone gives to their mistakes.', '', '- Oscar Wilde' },
      {
        'Controlling complexity is the essence of computer programming.',
        '',
        '- Brian Kernighan',
      },
      {
        'The function of good software is to make the complex appear to be simple.',
        '',
        '- Grady Booch',
      },
      {
        'First, solve the problem. Then, write the code.',
        '',
        '- John Johnson',
      },
      {
        'The question of whether computers can think is like the question of whether submarines can swim.',
        '',
        '- Edsger W. Dijkstra',
      },
      {
        'All problems in computer science can be solved with another level of indirection.',
        '',
        '- David Wheeler',
      },
      {
        'The best way to predict the future is to invent it.',
        '',
        '- Alan Kay',
      },
    }

    local list_extend = vim.list_extend

    --- @param line string
    --- @param max_width number
    --- @return table
    local format_line = function(line, max_width)
      if line == '' then
        return { ' ' }
      end

      local formatted_line = {}

      -- split line by spaces into list of words
      local words = {}
      local target = '%S+'
      for word in line:gmatch(target) do
        table.insert(words, word)
      end

      local bufstart = ' '
      local buffer = bufstart
      for i, word in ipairs(words) do
        if (#buffer + #word) <= max_width then
          buffer = buffer .. word .. ' '
          if i == #words then
            table.insert(formatted_line, buffer:sub(1, -2))
          end
        else
          table.insert(formatted_line, buffer:sub(1, -2))
          buffer = bufstart .. word .. ' '
          if i == #words then
            table.insert(formatted_line, buffer:sub(1, -2))
          end
        end
      end
      -- right-justify text if the line begins with -
      if line:sub(1, 1) == '-' then
        for i, val in ipairs(formatted_line) do
          local space = string.rep(' ', max_width - #val - 2)
          formatted_line[i] = space .. val:sub(2, -1)
        end
      end
      return formatted_line
    end

    --- @param fortune table
    --- @param max_width number
    --- @return table
    local format_fortune = function(fortune, max_width)
      -- Converts list of strings to one formatted string (with linebreaks)
      local formatted_fortune = { ' ' } -- adds spacing between alpha-menu and footer
      for _, line in ipairs(fortune) do
        local formatted_line = format_line(line, max_width)
        formatted_fortune = list_extend(formatted_fortune, formatted_line)
      end
      return formatted_fortune
    end

    local get_fortune = function(fortune_list)
      -- selects an entry from fortune_list randomly
      math.randomseed(os.time())
      local ind = math.random(1, #fortune_list)
      return fortune_list[ind]
    end

    --- @return table
    --- @param max_width number optional
    --- returns an array of strings
    local main = function(max_width)
      max_width = max_width or 54
      local fortune = get_fortune(quotes)
      local formatted_fortune = format_fortune(fortune, max_width)

      return formatted_fortune
    end

    dashboard.section.footer.val = main(54)

    dashboard.config = {
      layout = {
        dashboard.section.header,
        dashboard.section.buttons,
        dashboard.section.footer,
      },
      opts = {
        margin = 5,
      },
    }

    alpha.setup(dashboard.opts)
  end,
}
