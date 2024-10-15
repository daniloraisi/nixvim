_: {
  plugins.neo-tree = {
    enable = true;
    sources = ["filesystem" "buffers" "git_status" "document_symbols"];
    addBlankLineAtTop = false;

    filesystem = {
      bindToCwd = false;
      followCurrentFile = {
        enabled = true;
      };
      filteredItems = {
        visible = true;
        hideDotfiles = false;
        hideGitignored = true;
        neverShow = [".git"];
      };
    };

    defaultComponentConfigs = {
      indent = {
        withExpanders = true;
        expanderCollapsed = "󰅂";
        expanderExpanded = "󰅀";
        expanderHighlight = "NeoTreeExpander";
      };

      gitStatus = {
        symbols = {
          added = " ";
          conflict = "󰩌 ";
          deleted = "󱂥";
          ignored = " ";
          modified = " ";
          renamed = "󰑕";
          staged = "󰩍";
          unstaged = "";
          untracked = " ";
        };
      };
    };
    window.mappings = {
      l = "open";
      h = "close_node";
      "<space>" = "none";
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {desc = "Open/Close Neotree";};
    }
  ];
}
