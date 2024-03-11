# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

alias ll='ls -lh'
alias la='ls -lha'

function nvim_override() {
    if [[ $1 == "nvim" || $1 == "vim" ]]; then
        if [[ $# -eq 1 || ( $# -eq 2 && $2 == "." ) ]]; then
            command nvim .
        else
            command "$@"
        fi
    else
        command "$@"
    fi
}

alias -g 'nvim'='nvim_override nvim'
alias -g 'vim'='nvim_override vim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init --cmd "cd" zsh)"
