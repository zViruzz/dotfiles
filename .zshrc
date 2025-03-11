# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="headline"
# ZSH_THEME="refined"
# ZSH_THEME="awesomepanda"
# ZSH_THEME="jbergantine"
ZSH_THEME="sorin"
# ZSH_THEME="zhann"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Load a few plugins
zinit light jmaroeder/plugin-git
# zinit light agkozak/zsh-z
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::dnf
zinit snippet OMZP::aliases

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

source $ZSH/oh-my-zsh.sh

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# check the dnf plugins commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dnf

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r

# fastfetch. Will be disabled if above colorscript was chosen to install
fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

HEADLINE_STATUS_TO_STATUS='|'
HEADLINE_DO_GIT_STATUS_COUNTS=true
HEADLINE_DO_GIT_STATUS_OMIT_ONE=true
HEADLINE_USER_PREFIX=' '
HEADLINE_HOST_PREFIX=' '
HEADLINE_PATH_PREFIX=' '
HEADLINE_BRANCH_PREFIX=' '

HEADLINE_LINE_MODE=off

HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

alias zed="~/.local/zed.app/bin/zed"
alias gcm="git commit -am"
alias tyy="tty-clock -C 7 -b -c"
alias zi="yazi"
alias nv="nvim"
alias rconf="cd ~/.config/"
alias m-psql='sudo -u postgres psql'
alias cz='czg emoji'
alias c='clear'
alias pn='pnpm'
alias scrlow='scrcpy -b 2m -m 1024'

alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

alias la="lsd -lSa"
alias ll="lsd -lS"
alias lll="lsd -aS"
# Set-up icons for files/folders in terminal using eza
# alias la='eza -al --icons'
# alias ls='eza -a --icons'
# alias lt='eza -a --tree --level=1 --icons'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/zviruz/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
FNM_PATH="/home/zviruz/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/zviruz/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
# eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


