{  pkgs, ... }:

let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nil
      clang-tools

      #clipboard
      wl-clipboard
      xclip
      
      #telescope
      ripgrep
      fd
      

    ];

    plugins = with pkgs.vimPlugins; [

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./lua/lsp.lua;
      }

      neodev-nvim

      nvim-cmp
      {
        plugin = nvim-cmp;
        config = toLuaFile ./lua/cmp.lua;
      }

      cmp-nvim-lsp
      cmp_luasnip
      luasnip
      friendly-snippets

      {
        plugin = telescope-nvim;
        config = toLuaFile ./lua/telescope.lua;
      }

      telescope-fzf-native-nvim

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-lua
          p.tree-sitter-nix
        ]));
        config = toLuaFile ./lua/treesitter.lua;
      }

      {
        plugin = harpoon2;
      }

      {
        plugin = vim-fugitive;
      }

      {
        plugin = undotree;
      }

      {
        plugin = toggleterm-nvim;
      }

      {
        plugin = gitsigns-nvim;
      }

      {
        plugin = which-key-nvim;
      }

      nvim-web-devicons
      mini-nvim
    
      {
        plugin = comment-nvim;
      }

      # {
      #   plugin = oil-nvim;
      # }

      {
        plugin = bufferline-nvim;
      }

      {
        plugin = nvim-tree-lua;
      }

      {
        plugin = lualine-nvim;
      }

    ];

    extraLuaConfig = ''
      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./lua/harpoon.lua}
      ${builtins.readFile ./lua/undotree.lua}
      ${builtins.readFile ./lua/toggleterm.lua}
      ${builtins.readFile ./lua/gitsigns.lua}
      ${builtins.readFile ./lua/whichkey.lua}
      ${builtins.readFile ./lua/comment.lua}
      ${builtins.readFile ./lua/bufferline.lua}
      ${builtins.readFile ./lua/nvim-tree.lua}
      ${builtins.readFile ./lua/lualine.lua}
    '';
      
    # ${builtins.readFile ./lua/oil.lua}
  };
}

