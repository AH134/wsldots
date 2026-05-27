export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export NVM_DIR="$HOME/.nvm"

[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

export GALLIUM_DRIVER=d3d12
if grep -q -i "nvidia" /proc/version 2>/dev/null || glxinfo 2>/dev/null | grep -q -i "nvidia"; then
    export GALLIUM_DRIVER=d3d12
    export MESA_D3D12_DEFAULT_ADAPTER_NAME=NVIDIA
elif grep -q -i "intel" /proc/version 2>/dev/null || glxinfo 2>/dev/null | grep -q -i "intel"; then
    export GALLIUM_DRIVER=d3d12
    export MESA_D3D12_DEFAULT_ADAPTER_NAME=INTEL
fi

alias ls='eza --icons --group-directories-first'
alias la='eza -la --icons --group-directories-first'
alias ll='eza -l --icons --group-directories-first'
alias tree='eza --tree'
alias bat='batcat --paging=never'
alias zh='vim ~/wsldots/zsh/.zshrc'

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"