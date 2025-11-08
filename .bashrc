# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

readline-brackets() {
    READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}${1}${READLINE_LINE:$READLINE_POINT}"
    ((READLINE_POINT += 1))
}

bind -m vi-insert -x '"\"" : "readline-brackets \"\""'
bind -m vi-insert -x $'"\047" : "readline-brackets \\\047\\\047"' # SINGLE QUOTE
bind -m vi-insert -x '"<" : "readline-brackets \<\>"'
bind -m vi-insert -x '"(" : "readline-brackets \(\)"'
bind -m vi-insert -x '"[" : "readline-brackets []"'
bind -m vi-insert -x '"{" : "readline-brackets {}"'

p() {
    bind -m vi-insert -x '"\"" : "readline-brackets \""'
    bind -m vi-insert -x $'"\047" : "readline-brackets \\\047"' # SINGLE QUOTE
    bind -m vi-insert -x '"<" : "readline-brackets \<"'
    bind -m vi-insert -x '"(" : "readline-brackets \("'
    bind -m vi-insert -x '"[" : "readline-brackets ["'
    bind -m vi-insert -x '"{" : "readline-brackets {"'
}

np() {
    bind -m vi-insert -x '"\"" : "readline-brackets \"\""'
    bind -m vi-insert -x $'"\047" : "readline-brackets \\\047\\\047"' # SINGLE QUOTE
    bind -m vi-insert -x '"<" : "readline-brackets \<\>"'
    bind -m vi-insert -x '"(" : "readline-brackets \(\)"'
    bind -m vi-insert -x '"[" : "readline-brackets []"'
    bind -m vi-insert -x '"{" : "readline-brackets {}"'
}

# sudoedit
export VISUAL="vim"
export EDITOR="$VISUAL"

# alias vi='busybox vi'
alias :q="exit"
alias als='vim ~/.bashrc'
alias vrc='vim ~/.vimrc'
alias re='source ~/.bashrc'
alias bn='basename'
alias cl='clear'
alias v='vim'
# alias ll='pwd && ls -la'
alias lt='ls -ltr'
alias lt1='ls -1tr'
alias s='find $PWD -name 2>/dev/null'
alias sd='find $PWD -type d -name 2>/dev/null'
alias jl='jobs -l'
alias v='vim'
alias sv='sudoedit'
alias hosts='sudoedit /etc/hosts'
alias nconf='v /etc/nginx/nginx.conf'

bind -m vi-command 'z: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

bind '"\C-p":history-search-backward'
bind '"\C-n":history-search-forward'
bind '"\C-k":history-search-backward'
bind '"\C-j":history-search-forward'
bind '"\C-h":backward-char'
bind '"\C-l":forward-char'

bind -m vi-insert 'Control-a: beginning-of-line'
bind -m vi-insert 'Control-e: end-of-line'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"c

j() {
    fg %$1
}

cd() {
    #builtin cd $@
    command cd $@ && echo " " && ll
}

pt() {
    export whoami=whoami
    PS1="$(whoami)@\${PWD##*/}\> "
}
# 當前目錄 顯示多個檔名的路徑(包含檔名)
sf() {
    for file in "$@"; do
        s $(basename $file)
        #basename $file
        #dirname $(s $(basename $file))
    done
}

# 當前目錄 顯示多個檔名的路徑(不包含檔名)
sfd() {
    echo " "
    for file in "$@"; do
        basename $file
        s $(basename $file) | xargs -I {} dirname {}
    done
}

# 當前目錄 依據檔名備份多個檔
# search & bak
# args[]: multiple filenames, seperate by spaces
sbak() {
    for file in "$@"; do
        bakDate=$(date "+%Y-%m-%d_%H%M%S")
        targetPath=$(s $(basename $file))
        echo $targetPath.bak@$bakDate
        cp $targetPath $targetPath.bak@$bakDate
    done
}

# 當前目錄 依據檔名取代多個檔
srep() {
    for file in "$@"; do
        targetPath=$(s $(basename $file))
        echo $targetPath
        cp $file $targetPath
    done
}

# find
# args: date, filename
fb() {
    find $PWD -type f ! -newermt "$2" -name "$1" -printf "%T@ %Tc %p\n" | sort -n
}

# find & rm before date
# args: date, filename
frmb() {
    find $PWD -type f ! -newermt "$2" -name "$1" -printf "%T@ %Tc %p\n" | sort -n && find . -type f ! -newermt "$2" -name "$1" -exec rm -f {} \;
}

# mkdir()
# {
#   command mkdir -p $1
# }
