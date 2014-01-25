# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

for function in ~/.zsh/functions/*; do
  source $function
done

# history settings
setopt histignoredups
SAVEHIST=4096
HISTSIZE=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Try to correct command line spelling
setopt correct correctall

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^K" kill-line
bindkey "^]" emacs-forward-word
bindkey "^[" backward-word

# use vim as the visual editor
export VISUAL="mvim -f"
export EDITOR="$VISUAL"

# path
if [[ -d "/usr/local/AWS/eb/macosx/python2.7" ]] ; then ;
    export PATH="$PATH:/usr/local/AWS/eb/macosx/python2.7"
fi

# AWS
export AWS_CREDENTIAL_FILE="$HOME/.aws/credentials"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
