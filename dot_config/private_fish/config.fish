# Homebrew — PATH, MANPATH, INFOPATH (Apple Silicon, then Intel)
for __brew in /opt/homebrew/bin/brew /usr/local/bin/brew
    if test -x $__brew
        $__brew shellenv fish | source
        break
    end
end

# Default editor (git, chezmoi, etc.)
if command -vq nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
else if command -vq vim
    set -gx EDITOR vim
    set -gx VISUAL vim
end

if status is-interactive
    set -g fish_greeting
    set -g fish_history_size 50000

    abbr -a -- gs 'git status'
    abbr -a -- gd 'git diff'
    abbr -a -- gp 'git pull'
    abbr -a -- gl 'git log --oneline -20'
    abbr -a -- k kubectl
    abbr -a -- lg lazygit
    abbr -a -- ld lazydocker
    abbr -a -- dc 'docker compose'
    abbr -a -- v nvim

    set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source
end
