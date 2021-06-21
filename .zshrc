# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [ $TERM = linux ]
then
	ZSH_THEME="robbyrussell"
else
	ZSH_THEME="powerlevel10k/powerlevel10k"
	export ZSH="/home/gabe/.oh-my-zsh"
	source $ZSH/oh-my-zsh.sh
	# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi


# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export EDITOR="/usr/bin/nvim"
export PATH=$PATH:~/.local/bin:~/bin
#source ~/.apis
eval $(thefuck --alias)

bindkey -s '^O' 'ranger^M'

alias ls='ls --color=auto'
alias ll='ls -la'
alias lr='ls -ltr'
alias ep='nvim ~/.zshrc'
alias epv='nvim ~/.config/nvim/init.vim'
alias sp='source ~/.zshrc'
alias pacs='pacman -Qe | grep -i'
alias seba='source env/bin/activate'
alias key='xbindkeys --key'
alias ev='nvim ~/.config/nvim/init.vim'
alias wttr='curl wttr.in/Honolulu'
alias updateweb='rsync -uvrP --delete-after ~/website/ root@gabebanks.net:/var/www/gabebanks/'
alias mu='sudo mount /dev/sda1 /mnt'
alias umu='sudo umount /mnt'
alias hs='history | grep -i'
alias ytdl='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "%(autonumber)s %(title)s.%(ext)s"'
alias please='sudo $(fc -ln -1)'
alias anaconda="export PATH=~/anaconda3/bin:$PATH"

myip() {
	ip addr | grep "inet " | grep -v " 127." | awk '{print $2}'
}

see() {
	zathura $1 & disown
}

spdl() {
	spotify_dl -l $1 -o ~/music
}

out() {
        "$@" & disown
}


fortune | cowsay | lolcat
echo


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gabe/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gabe/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gabe/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gabe/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
