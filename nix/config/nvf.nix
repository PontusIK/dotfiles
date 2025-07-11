{ ... }:

{
  
  programs.nvf = {
    enable = true;

    settings.vim = {
      lineNumberMode = "number";
      useSystemClipboard = true;

      options = {
        tabstop = 2;
        shiftwidth = 2;
        wrap = false;
      };

      telescope.enable = true;
      git.enable = true;
      treesitter.context.enable = true;
      lsp = {
        enable = true;
        inlayHints.enable = true;
        nvim-docs-view.enable = true;
        trouble.enable = true;
      };

      languages = {
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        java.enable = true;
        clang.enable = true;
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
