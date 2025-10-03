{ inputs, ... }:

{

  imports = [ inputs.nvf.nixosModules.default ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      clipboard = {
        enable = true;
        providers.xclip.enable = true;
        registers = "unnamedplus";
      };

      lineNumberMode = "number";

      options = {
        tabstop = 4;
        shiftwidth = 4;
        wrap = false;
      };

      telescope.enable = true;
      git.enable = true;
      treesitter.context.enable = true;
      lsp.enable = true;

      diagnostics = {
        enable = true;
        nvim-lint.enable = true;
        config = {
          underline = true;
          virtual_text = true;
          signs = true;
        };
      };

      autocomplete.blink-cmp.enable = true;

      languages = {
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        java.enable = true;
        clang.enable = true;
        python = {
          enable = true;
          lsp.server = "pyright";
        };
        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
        };
      };

      keymaps = [
        {
          key = "<leader>ff";
          mode = ["n"];
          action = "<cmd>Telescope find_files<cr>";
          desc = "Telescope find files";
        }
        {
          key = "<leader>lg";
          mode = ["n"];
          action = "<cmd>Telescope live_grep<cr>";
          desc = "Telescope live grep";
        }
      ];
    
    };
  };

}
