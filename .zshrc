# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="headline"


plugins=(
  git
  dnf
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autocomplete
  web-search
)

source $ZSH/oh-my-zsh.sh


# check the dnf plugins commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dnf


# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r

# fastfetch. Will be disabled if above colorscript was chosen to install
fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)


HEADLINE_STATUS_TO_STATUS='|'
HEADLINE_DO_GIT_STATUS_COUNTS=true
HEADLINE_DO_GIT_STATUS_OMIT_ONE=true
HEADLINE_USER_PREFIX=' '
HEADLINE_HOST_PREFIX=' '
HEADLINE_PATH_PREFIX=' '
HEADLINE_BRANCH_PREFIX=' '

HEADLINE_LINE_MODE=off


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias zed="~/.local/zed.app/bin/zed"
alias gcm="git commit -am"
alias tyy="tty-clock -C 7 -b -c"
alias yz="yazi"
alias nv="nvim"
alias rconf="cd ~/.config/"

alias xampp='sudo /opt/lampp/lampp'
# Set-up icons for files/folders in terminal using eza
# alias ls='eza -a --icons'
# alias ll='eza -al --icons'
# alias lt='eza -a --tree --level=1 --icons'

alias la="lsd -lS"
alias laa="lsd -lSa"
alias ll="lsd -aS"
alias nff="neofetch"


PATH=~/.console-ninja/.bin:$PATH


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/zviruz/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

if [ -e /home/zviruz/.nix-profile/etc/profile.d/nix.sh ]; then . /home/zviruz/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
