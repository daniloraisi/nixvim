{
  plugins = {
    cmp-emoji = { enable = true; };
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        experimental = { ghost_text = false; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet = { expand = "luasnip"; };
        formatting = { fields = ["kind" "abbr" "menu"]; };
        sources = [
          { name = "git"; }
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          {
            name = "path";
            keywordLength = 3;
          }
          {
            name = "luasnip";
            keywordLength = 3;
          }
          { name = "copilot"; }
        ];

        window = {
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };

        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = auto_select })";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          "<C-CR>" = {
            __raw = ''
              function(fallback)
                cmp.abort()
                fallback()
              end
            '';
          };
        };
      };
    };
    cmp-nvim-lsp = { enable = true; };
    cmp-buffer = { enable = true; };

  };
}
