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
      # LSP Servers
      lua-language-server
      nil
      nixd
      pyright
      nodePackages.typescript-language-server
      nodePackages.bash-language-server
      
      # Formatters
      nixpkgs-fmt
      stylua
      nodePackages.prettier
      
      # Clipboard
      wl-clipboard
      xclip
      
      # Telescope dependencies
      ripgrep
      fd
    ];

    plugins = with pkgs.vimPlugins; [
      # Theme
      {
        plugin = catppuccin-nvim;
        config = toLua ''
          require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = false,
            integrations = {
              telescope = true,
              treesitter = true,
              cmp = true,
              gitsigns = true,
              nvimtree = true,
            },
          })
          vim.cmd.colorscheme "catppuccin"
        '';
      }

      # Status line
      {
        plugin = lualine-nvim;
        config = toLua ''
          require('lualine').setup {
            options = {
              theme = 'catppuccin',
              icons_enabled = true,
              component_separators = '|',
              section_separators = '',
            },
          }
        '';
      }
      nvim-web-devicons

      # File explorer
      {
        plugin = nvim-tree-lua;
        config = toLuaFile ./lua/nvim-tree.lua;
      }

      # LSP
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./lua/lsp.lua;
      }
      neodev-nvim

      # Autocompletion
      {
        plugin = nvim-cmp;
        config = toLuaFile ./lua/cmp.lua;
      }
      cmp-nvim-lsp
      cmp_luasnip
      cmp-buffer
      cmp-path
      luasnip
      friendly-snippets

      # Telescope
      {
        plugin = telescope-nvim;
        config = toLuaFile ./lua/telescope.lua;
      }
      telescope-fzf-native-nvim
      plenary-nvim

      # Treesitter
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-lua
          p.tree-sitter-nix
          p.tree-sitter-python
          p.tree-sitter-javascript
          p.tree-sitter-typescript
          p.tree-sitter-bash
          p.tree-sitter-json
          p.tree-sitter-yaml
          p.tree-sitter-markdown
          p.tree-sitter-html
          p.tree-sitter-css
        ]));
        config = toLuaFile ./lua/treesitter.lua;
      }

      # Git integration
      {
        plugin = gitsigns-nvim;
        config = toLua ''
          require('gitsigns').setup({
            signs = {
              add = { text = '+' },
              change = { text = '~' },
              delete = { text = '_' },
              topdelete = { text = '‾' },
              changedelete = { text = '~' },
            },
          })
        '';
      }

      # Auto pairs
      {
        plugin = nvim-autopairs;
        config = toLua ''
          require('nvim-autopairs').setup({})
          local cmp_autopairs = require('nvim-autopairs.completion.cmp')
          local cmp = require('cmp')
          cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        '';
      }

      # Comments
      {
        plugin = comment-nvim;
        config = toLua ''
          require('Comment').setup()
        '';
      }

      # Which-key (muestra keybindings disponibles)
      {
        plugin = which-key-nvim;
        config = toLua ''
          require("which-key").setup({})
        '';
      }

      # Indent guides
      {
        plugin = indent-blankline-nvim;
        config = toLua ''
          require("ibl").setup({
            indent = { char = "│" },
            scope = { enabled = false },
          })
        '';
      }
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./lua/other.lua}
    '';
  };
}

