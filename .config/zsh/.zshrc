# Prompt:
    autoload -U colors && colors	
    PS1="%B%{$fg[#4c566a]%}[%n@%{$fg[#eceff4]%}%M] [%{$fg[white]%}%~]%{$reset_color%}"$'\n'"$ "

# History:
    HISTSIZE=100000
    SAVEHIST=100000
    HISTFILE=~/.cache/zsh/history

# Autocompletion:
    autoload -U compinit
    zstyle ':completion:*' menu select
    zmodload zsh/complist
    compinit
    _comp_options+=(globdots)		# Include hidden files.
    setopt MENU_COMPLETE

# Aliases.
    [ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Path:
    export PATH="$HOME/.local/bin:$PATH"
    export PATH="$HOME/.local/share/cargo/bin:$PATH"
    compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION 

# Autosuggestions:
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# zsh-syntax-highlighting; should be last.
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
