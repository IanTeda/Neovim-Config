return {
    -- PLUGIN TO LAZY LOAD
    -- Lazy.vim will look for lua files in the ~/.config/nvim/lua/plugins folder
    'akinsho/toggleterm.nvim',
    
    -- VERSIONING
    -- If you want to install a specific revision of a plugin, you can use 
    -- `commit`,`tag`, `branch`, `version`.
    version = "*",
   
    -- OPTIONALS
    -- opts should be a table (will be merged with parent specs), return a 
    -- table (replaces parent specs) or should change a table. The table will 
    -- be passed to the Plugin.config() function. Setting this value will imply
    -- Plugin.config()
    -- opts = { }

    -- CONFIG 
    -- Config is executed when the plugin loads. The default implementation 
    -- will automatically run require(MAIN).setup(opts). Lazy uses several
    -- heuristics to determine the plugin’s MAIN module automatically based 
    -- on the plugin’s name. See also opts. To use the default implementation 
    -- without opts set config to true.
    config = function ()
        
        ---@class TOGGLETERM_SETTINGS
        local TOGGLETERM_SETTINGS {
        	size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        }

        require("toggleterm").setup(TOGGLETERM_SETTINGS)

        -- Terminal Window Mapping
        -- Add mappings to make moving in and out of a terminal easier once 
        -- toggled, whilst still keeping it open
        function _G.set_terminal_keymaps()
            local opts = {noremap = true}
            vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        -- Add Terminal Shortcuts to specific programs
        local Terminal = require("toggleterm.terminal").Terminal
        
        -- Lazy Git
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
        function _LAZYGIT_TOGGLE()
            lazygit:toggle()
        end

        -- Node
        local node = Terminal:new({ cmd = "node", hidden = true })
        function _NODE_TOGGLE()
            node:toggle()
        end

        -- NCDU
        local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
        function _NCDU_TOGGLE()
            ncdu:toggle()
        end

        -- HTOP
        local htop = Terminal:new({ cmd = "htop", hidden = true })
        function _HTOP_TOGGLE()
            htop:toggle()
        end

        -- Python
        local python = Terminal:new({ cmd = "python", hidden = true })
        function _PYTHON_TOGGLE()
            python:toggle()
        end
    end,
}
