-- Tiny plugin to quickly switch python virtual environments from within neovim without restarting.
return { "AckslD/swenv.nvim",
    config = function()
        require('swenv').setup({
            -- Path passed to `get_venvs`.
            venvs_path = vim.fn.expand('/usr/local/Caskroom/mambaforge/base/envs'),

        })
    end,
}
