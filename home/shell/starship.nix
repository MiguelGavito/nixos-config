{config, ...}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/s=starship";

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol   = "[➜](bold red)";
      };

      hostname = {
        disabled = false;
        format = "[$ssh_symbol](blue dimmed bold)[$hostname]($style) ";
        ssh_only = false;
        style = "green dimmed bold";
        trim_at = ".";
      };
      username = {
        format = "[$user]($style) ";
        show_always = true;
        style_root = "red bold bg:0x9A348E";
        style_user = "yellow bold bg:0x9A348E";
        disabled = false;
      };

      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        symbol = " ";
        style = "bold purple bg:0xFCA17D";
        truncation_length = 9223372036854775807;
        truncation_symbol = "…";
        only_attached = false;
        always_show_remote = false;
        ignore_branches = [];
        disabled = false;
      };
      git_commit = {
        commit_hash_length = 7;
        format = "[($hash$tag)]($style) ";
        style = "green bold";
        only_detached = true;
        disabled = false;
        tag_symbol = "  ";
        tag_disabled = true;
      };
      git_metrics = {
        added_style = "bold green";
        deleted_style = "bold red";
        only_nonzero_diffs = true;
        format = "([+$added]($added_style) )([-$deleted]($deleted_style) )";
        disabled = false;
      };
      git_state = {
        am = "AM";
        am_or_rebase = "AM/REBASE";
        bisect = "BISECTING";
        cherry_pick = " CHERRY-PICK";
        disabled = false;
        format = "([$state( $progress_current/$progress_total)]($style)) ";
        merge = "MERGING";
        rebase = "REBASING";
        revert = "REVERTING";
        style = "bold yellow";
      };
      git_status = {
        conflicted = "󰅙 ";
        deleted    = " ";
        modified   = " ";
        renamed    = " ";
        staged     = " ";
        stashed    = " ";
        untracked  = " ";
        up_to_date = " ";
      };
      directory = {
        disabled = false;
        fish_style_pwd_dir_length = 0;
        format = "[$path]($style)[$read_only]($read_only_style) ";
        home_symbol = "~";
        read_only = "";
        read_only_style = "red";
        repo_root_format = "[$before_root_path]($style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) ";
        style = "cyan bold bg:0xDA627D";
        truncate_to_repo = true;
        truncation_length = 3;
        truncation_symbol = "…/";
        use_logical_path = true;
        use_os_path_sep = true;
      };
      directory.substitutions = {
        # Here is how you can shorten some long paths by text replacement;
        # similar to mapped_locations in Oh My Posh:;
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
        "Videos"    = " ";
        "Projects"  = " ";
        ".config"   = " ";
        # Keep in mind that the order matters. For example:;
        # "Important Documents" = "  ";
        # will not be replaced, because "Documents" was already substituted before.;
        # So either put "Important Documents" before "Documents" or use the substituted version:;
        # "Important  " = "  ";
        "Important " = " ";
      };
      cmake = {
        format = "[$symbol($version )]($style)";
        version_format = "v$raw";
        symbol = "󰔷 ";
        style = "bold blue";
        disabled = false;
        detect_extensions = [];
        detect_files = [
          "CMakeLists.txt"
          "CMakeCache.txt"
        ];
        detect_folders = [];
      };
      c = {
        format = "[$symbol($version(-$name) )]($style)";
        version_format = "v$raw";
        style = "fg:149 bold bg:0x86BBD8";
        symbol = " ";
        disabled = false;
        detect_extensions = [
          "c"
          "h"
        ];
        detect_files = [];
        detect_folders = [];
        commands = [
          [
            "cc"
            "--version"
          ]
          [
            "gcc"
            "--version"
          ]
          [
            "clang"
            "--version"
          ]
        ];
      };
      sudo = {
        format = "[as $symbol]($style)";
        symbol = " ";
        style = "bold blue";
        allow_windows = false;
        disabled = true;
      };
      # shell = {
      #   format = "[$indicator]($style) ";
      #   bash_indicator = "bsh";
      #   cmd_indicator = "cmd";
      #   elvish_indicator = "esh";
      #   fish_indicator = "";
      #   ion_indicator = "ion";
      #   nu_indicator = "nu";
      #   powershell_indicator = "_";
      #   style = "white bold";
      #   tcsh_indicator = "tsh";
      #   unknown_indicator = "mystery shell";
      #   xonsh_indicator = "xsh";
      #   zsh_indicator = "zsh";
      #   disabled = false;
      # };
    };
  };
}
