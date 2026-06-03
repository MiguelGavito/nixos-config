{ config, ...}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/s=starship";

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true; 
    enableNushellIntegration = true;
    
    settings = {
      # Usar Catppuccin Mocha
      palette = "catppuccin_mocha";
      
      # Definir los colores Catppuccin
      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
      
      # El formato: qué mostrar y en qué orden
      format = "$username$hostname$directory$git_branch$git_status$character";
      
      # Módulo: Usuario
      username = {
        show_always = true;
        style_user = "bg:red fg:crust";
        style_root = "bg:red fg:crust";
        format = "[ $user ]($style)";
      };
      
      # Módulo: Hostname
      hostname = {
        ssh_only = false;
        style = "bg:peach fg:crust";
        format = "[ $hostname ]($style)";
      };
      
      # Módulo: Directorio
      directory = {
        style = "bg:blue fg:crust";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncate_to_repo = true;
      };
      
      # Módulo: Rama Git
      git_branch = {
        symbol = " ";
        style = "bg:green fg:crust";
        format = "[ $symbol $branch ]($style)";
      };
      
      # Módulo: Estado Git
      git_status = {
        style = "bg:green fg:crust";
        format = "[ $all_status$ahead_behind ]($style)";
      };
      
      # Módulo: Carácter final (el prompt)
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
      };
    };
  };
}