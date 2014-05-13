# adds the current branch name in green
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}

# adds current AWS credential name in red
aws_prompt_info() {
    AWS_HOME="$HOME/.aws"
    if [ -n "${AWS_ACCESS_KEY_ID:+x}" ] ; then
        aws_creds=$(grep -l $AWS_ACCESS_KEY_ID $AWS_HOME/* | head -1)
        if [[ -n $aws_creds ]]; then
            awsid=$(basename $aws_creds)
            echo "[%{$fg_bold[red]%}${awsid}%{$reset_color%}]"
        fi
    fi
}

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt promptsubst

# prompt
export PS1='$(aws_prompt_info)$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '

# settings for .gitconfig, but can be useful elsewhere
export _EMAIL="niall@kst.com"
if [ -f "$HOME/.bu_machine" ] ; then
    export _EMAIL="ntk@bu.edu"
fi

export _NAME="Niall Kavanagh"
export _CREDENTIAL_HELPER="osxkeychain"
