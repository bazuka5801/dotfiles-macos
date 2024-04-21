# word jump
# bindkey "[C" forward-word
# bindkey "[D" backward-word

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="refined"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-npm-scripts-autocomplete
	asdf
	# completion
	bundler
	# This plugin uses the command-not-found package for zsh to provide suggested packages to be installed if a command cannot be found.
	command-not-found
	history
	iterm2
)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

if test -f "~/.fastlane/completions/completion.sh"; then
	. ~/.fastlane/completions/completion.sh
fi


alias k=kubectl

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/max/yandex-cloud/path.bash.inc' ]; then source '/Users/max/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/Users/max/yandex-cloud/completion.zsh.inc' ]; then source '/Users/max/yandex-cloud/completion.zsh.inc'; fi


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terragrunt terragrunt
