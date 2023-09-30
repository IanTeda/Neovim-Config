# Neovim-Config
Configuration  files for Neovim



### Installation

> **NOTE** 
> [Backup] your previous configuration (if any exists)

Requirements:
* Make sure to review the readmes of the plugins if you are experiencing errors. In particular:
  * [ripgrep](https://github.com/BurntSushi/ripgrep#installation) is required for multiple [telescope](https://github.com/nvim-telescope/telescope.nvim#suggested-dependencies) pickers.
* See [Windows Installation](#Windows-Installation) if you have trouble with `telescope-fzf-native`

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| MacOS | `$XDG_CONFIG_HOME/nvim`, '~/.config/nvim` |
| Windows | `%userprofile%\AppData\Local\nvim\` |

Clone config:

```sh
# on Linux and Mac
git clone https://github.com/IanTeda/Neovim-Config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
# on Windows
git clone https://github.com/IanTeda/Neovim-Config.git %userprofile%\AppData\Local\nvim\ 
```

## Post Installation

Run the following command and then you are ready to go!

```sh
nvim --headless "+Lazy! sync" +qa
```

#### References

- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvimhttps://github.com/nvim-lua/kickstart.nvim)
- [Neovim from Sratch - Github Repo](https://github.com/LunarVim/Neovim-from-scratch/tree/master)
- [Neovim from Sratch - Youtub Series](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
