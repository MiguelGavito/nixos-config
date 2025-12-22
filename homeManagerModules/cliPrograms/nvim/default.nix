{ config, pkgs, ... }:

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
    ];

    extraLuaConfig = ''
      vim.g.mapleader = ' '
      vim.g.maplocalleader = ' '
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./lua/harpoon.lua}
    '';
  };
}

