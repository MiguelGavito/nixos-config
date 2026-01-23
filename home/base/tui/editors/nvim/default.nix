{pkgs, lib, ...}: let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nil
      clang-tools
      
      #clipboard - Linux only (macOS uses native pbcopy/pbpaste)
      ripgrep
      fd
    ]
    ++ (lib.optionals pkgs.stdenv.isLinux [
      wl-clipboard  # Wayland
      xclip         # X11
    ]);

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugins/lsp.lua;
      }

      neodev-nvim

      nvim-cmp
      {
        plugin = nvim-cmp;
        config = toLuaFile ./plugins/cmp.lua;
      }

      cmp-nvim-lsp
      cmp_luasnip
      luasnip
      friendly-snippets

      {
        plugin = telescope-nvim;
        # config = toLuaFile ./plugins/telescope.lua;
      }

      telescope-fzf-native-nvim

      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-lua
          p.tree-sitter-nix
          p.tree-sitter-c
          p.tree-sitter-cpp
        ]);
        config = toLuaFile ./plugins/treesitter.lua;
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
        plugin = gruvbox-nvim;
        config = toLua ''vim.cmd.colorscheme "catppuccin"'';   #gruvbox
      }

      {
        plugin = nvim-autopairs;
        config = toLua ''require("nvim-autopairs").setup()'';
      }

      {
        plugin = comment-nvim;
      }

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
      ${builtins.readFile ./plugins/harpoon.lua}
      ${builtins.readFile ./plugins/telescope.lua}
      ${builtins.readFile ./plugins/fugitive.lua}
      ${builtins.readFile ./plugins/undotree.lua}
      ${builtins.readFile ./plugins/toggleterm.lua}
      ${builtins.readFile ./plugins/gitsigns.lua}
      ${builtins.readFile ./plugins/whichkey.lua}
      ${builtins.readFile ./plugins/comment.lua}
      ${builtins.readFile ./plugins/bufferline.lua}
      ${builtins.readFile ./plugins/nvim-tree.lua}
      ${builtins.readFile ./plugins/lualine.lua}
    '';
  };
}