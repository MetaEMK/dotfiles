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
    # Überprüfen, ob der Befehl nvim oder vim ist
    if [[ $1 == "nvim" || $1 == "vim" ]]; then
        # Überprüfen, ob keine Argumente oder nur '.' als Argument übergeben wurden
        if [[ $# -eq 1 || ( $# -eq 2 && $2 == "." ) ]]; then
            # nvim mit '.' als Argument ausführen
            command nvim .
        else
            # Ursprünglichen Befehl ausführen
            command "$@"
        fi
    else
        # Ursprünglichen Befehl ausführen
        command "$@"
    fi
}

alias -g 'nvim'='nvim_override nvim'
alias -g 'vim'='nvim_override vim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init --cmd "cd" zsh)"
