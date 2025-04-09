if [[ -d "$HOME/bin" ]]; then
	PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
	PATH="$HOME/.local/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [[ -d "$HOME/nvim/bin" ]]; then
	PATH="$PATH:$HOME/nvim/bin"
fi
if [[ -d "$HOME/.config/lsp/lua-language-server/bin" ]]; then
	PATH="$PATH:$HOME/.config/lsp/lua-language-server/bin"
fi

if [[ -d "/opt/miktex/bin" ]]; then
	PATH="$PATH:/opt/miktex/bin"
fi

export EDITOR=nvim

export GPG_TTY=$(tty)

if [[ -d "$HOME/.cargo/" ]]; then
	. "$HOME/.cargo/env"
fi
