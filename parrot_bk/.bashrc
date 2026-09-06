# ~/.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/share:/usr/share/john:/opt/mssql-tools/bin:$PATH

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	    color_prompt=yes
    else
	    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 1 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]☺\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]☺\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
else
    PS1='┌──[\u@\h]─[\w]\n└──╼ \$ '
fi

# Set 'man' colors
if [ "$color_prompt" = yes ]; then
	man() {
	env \
	LESS_TERMCAP_mb=$'\e[01;31m' \
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;44;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;32m' \
	man "$@"
	}
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\033[1;32m\]\342\224\214\342\224\200\$([[ \$(/etc/htb/vpnbash.sh) == *\"10.\"* ]] && echo \"[\[\033[1;34m\]\$(/etc/htb/vpnserver.sh)\[\033[1;32m\]]\342\224\200[\[\033[1;37m\]\$(/etc/htb/vpnbash.sh)\[\033[1;32m\]]\342\224\200\")[\[\033[1;37m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[1;32m\]]\342\224\200[\[\033[1;37m\]\w\[\033[1;32m\]]\n\[\033[1;32m\]\342\224\224\342\224\200\342\224\200\342\225\274 [\[\e[01;33m\]★\[\e[01;32m\]]\\$ \[\e[0m\]"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# Makes text green while its being typed
export PS1="$PS1\[\033[1;32m\]"
trap 'echo -ne "\033[0m"' DEBUG

# For vim
set mouse=a

# Workaround for python2.7
##export PYENV_ROOT="$HOME/.pyenv"
##command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
##eval "$(pyenv init -)"


###
set -o vi
# bind '"jk":"\e"'
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\C-p":history-search-backward'
bind '"\C-n":history-search-forward'
bind -x '"\C-o":clear'

bind '"\C-h":"\e[D"'
bind '"\C-l":"\e[C"'
bind '"\C-k":history-search-backward'
bind '"\C-j":history-search-forward'
bind -m vi-insert '"\C-d":delete-char'
bind -m vi-command '"\C-d":nop'

bind '"\C-a":"\e[H"' # home
bind '"\C-e":"\e[F"' # end

bind '"\eh": backward-word'
bind '"\el": forward-word'

# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"c

# bind '""\": "\"\""'

readline-brackets() {
    READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}${1}${READLINE_LINE:$READLINE_POINT}"
    ((READLINE_POINT += 1))
}

bind -m vi-insert -x '"\"": "readline-brackets \"\""'
bind -m vi-insert -x $'"\047": "readline-brackets \\\047\\\047"' # SINGLE QUOTE bind -m vi-insert -x '"<" : "readline-brackets \<\>"'
bind -m vi-insert -x '"(": "readline-brackets \(\)"'
bind -m vi-insert -x '"[": "readline-brackets []"'
bind -m vi-insert -x '"{": "readline-brackets {}"'
bind -m vi-insert -x '"`": "readline-brackets \`\`"'

p() {
    bind -m vi-insert -x '"\"" : "readline-brackets \""'
    bind -m vi-insert -x $'"\047" : "readline-brackets \\\047"' # SINGLE QUOTE
    bind -m vi-insert -x '"<" : "readline-brackets \<"'
    bind -m vi-insert -x '"(" : "readline-brackets \("'
    bind -m vi-insert -x '"[" : "readline-brackets ["'
    bind -m vi-insert -x '"{" : "readline-brackets {"'
    bind -m vi-insert -x '"`" : "readline-brackets \`"'
}

np() {
    bind -m vi-insert -x '"\"": "readline-brackets \"\""'
    bind -m vi-insert -x $'"\047": "readline-brackets \\\047\\\047"' # SINGLE QUOTE
    bind -m vi-insert -x '"<": "readline-brackets \<\>"'
    bind -m vi-insert -x '"(": "readline-brackets \(\)"'
    bind -m vi-insert -x '"[": "readline-brackets []"'
    bind -m vi-insert -x '"{": "readline-brackets {}"'
    bind -m vi-insert -x '"`": "readline-brackets \`\`"'
}

# alias :q='exit'
alias n='mate-terminal --maximize'
alias cdd='cd ~/Desktop'
alias cddd='cd ~/Desktop/my_data'
alias c='xclip -r -selection clipboard'
alias cn='xclip -selection clipboard'
alias k='kubectl'
alias ii='xdg-open'
alias d='xdg-open ~/Desktop'
alias dd='xdg-open /home/tm123/Desktop/my_data/'
alias t='tmux'
alias alst='vim ~/.tmux.conf'
alias cddl='cd ~/Downloads'
alias dl='ii ~/Downloads'
alias color='sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g"'
alias ca='keytool -list -v -keystore /etc/pki/ca-trust/extracted/java/cacerts -storepass changeit | vim -'
alias v='vim'
# alias vt="vim -c ':term ++curwin' -c 'vnew' -c ':term ++curwin'"
alias vt="vim -u ~/.termrc -c ':term ++curwin' -c ':vert term' -c ':file bash2' -c ':wincmd w'"
alias als='v ~/Desktop/my_data/.bashrc'
# alias als='v ~/.tmprc'
alias alsdir='v ~/.dirrc'
alias vrc='v ~/.config/nvim/init.vim'
alias cdv='cd ~/.config/nvim/'
alias trc='v ~/.tmux.conf'
alias bkt='cp ~/.tmux.conf ~/Desktop/my_data/.tmux.conf'
alias bkv='cp ~/.config/nvim/init.vim ~/Desktop/my_data/init.vim'
alias re=' cp ~/Desktop/my_data/.bashrc ~/.bashrc; source ~/.bashrc'
# alias re='source ~/.tmprc'
alias l='less -N'
alias bn='basename'
alias cls='clear'
alias ll='ls -lah'
alias lt='ls -ltrh'
alias lld='ls -ld'
alias lt1='ls -1tr'
alias s='find $PWD -name 2>/dev/null'
alias sd='find $PWD -type d -name 2>/dev/null'
alias jl='jobs -l'
# alias c='sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g"' # uncolor
alias u='cat /etc/passwd'
alias cdsp='cd ~/.sp'
alias cdca='cd /etc/pki/ca-trust/'
alias cdcaj='cd /etc/pki/ca-trust/extracted/java'
alias py="python"

alias j1='fg %1'
alias j2='fg %2'
alias j3='fg %3'
alias j4='fg %4'
alias j5='fg %5'
alias j6='fg %6'
alias j7='fg %7'
alias j8='fg %8'
alias j9='fg %9'
alias llca='ll /etc/pki/ca-trust/extracted/openssl/ca-bundle.trust.crt /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem /etc/pki/ca-trust/extracted/pem/email-ca-bundle.pem /etc/pki/ca-trust/extracted/pem/objsign-ca-bundle.pem /etc/pki/ca-trust/extracted/java/cacerts /etc/pki/ca-trust/extracted/edk2/cacerts.bin'

alias u='cat /etc/passwd'
alias g='cat /etc/group'

alias fn='realpath'


if [ -f ~/.dirrc ]; then
    source ~/.dirrc
fi   
# servers

cd() {
    #builtin cd $@
    # command cd $@ && echo " " && ll
    command cd $@ && ll
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

# function mkdir {
#   command mkdir $1 && cd $1
# }

clg() {
    for f in *; do
        cat $f | c >${f}.log
        rm $f
    done
}

zg() {
    zgrep -l "VAService" $(find . -name "*.gz")
}

cdp() {
    cd $(dirname $1)
}

bk() {
    f=$1
    newf="$1.bk$(date +%Y%m%d)"
    mv $1 $newf
    ll $newf
}

gencsr() {
    # filename=$1
    # openssl genrsa -out server.key 2048
    openssl genrsa -out server.key 2048
    openssl req -new -key ./server.key -out "$(hostname).csr" -config csr.conf
    openssl req -in "$(hostname).csr" -noout -text
}

clg() {
    for f in *; do
        cat $f | c >${f}.log
        rm $f
    done
}

zg() {
    zgrep -l "VAService" $(find . -name "*.gz")
}

hint () {
     grep Password: /home/tm123/Desktop/my_credentials.txt | awk '{print $2}' | c
}

rdp() { xfreerdp /v:$@ /u:letsdefend /p:'' /cert:ignore /dynamic-resolution -grab-keyboard; };
# gsettings set org.mate.Marco.global-keybindings switch-windows "'<Alt>a'"
gsettings set org.mate.Marco.global-keybindings switch-windows "<Alt>a"
gsettings set org.mate.Marco.global-keybindings cycle-windows "<Alt>apostrophe"
# gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>apostrophe']"
# gsettings set org.mate.Marco.global-keybindings switch-windows  "['<Alt>a', '<Alt>apostrophe']"
export PATH="$PATH:~/.local/bin"

clear
# copy_to_clipboard() {
#     local json_string
#     json_string=$(printf '%s' "$(cat)" | base64 | tr -d '\r\n')
#     printf "\033]52;c;%s\a" "$json_string"
# }


