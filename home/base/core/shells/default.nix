{ ... }:
{
	imports = [
		./bash.nix
		./zsh.nix
		./nushell
		./aliases.nix
		./env.nix
		./common.nix # Shell tool integrations (direnv, zoxide, fzf, eza, bat)
	];
}
