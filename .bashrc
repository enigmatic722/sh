export TERM=xterm-256color

case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH
export VISUAL=vim
export EDITOR=vim

# some more ls aliases
# alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.dirrc ]; then
    source ~/.dirrc
fi

stty -ixon

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

bind -m vi-insert -x '"\"" : "readline-brackets \"\""'
bind -m vi-insert -x $'"\047" : "readline-brackets \\\047\\\047"' # SINGLE QUOTE bind -m vi-insert -x '"<" : "readline-brackets \<\>"'
bind -m vi-insert -x '"(" : "readline-brackets \(\)"'
bind -m vi-insert -x '"[" : "readline-brackets []"'
bind -m vi-insert -x '"{" : "readline-brackets {}"'
bind -m vi-insert -x '"`" : "readline-brackets \`\`"'

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
    bind -m vi-insert -x '"\"" : "readline-brackets \"\""'
    bind -m vi-insert -x $'"\047" : "readline-brackets \\\047\\\047"' # SINGLE QUOTE
    bind -m vi-insert -x '"<" : "readline-brackets \<\>"'
    bind -m vi-insert -x '"(" : "readline-brackets \(\)"'
    bind -m vi-insert -x '"[" : "readline-brackets []"'
    bind -m vi-insert -x '"{" : "readline-brackets {}"'
    bind -m vi-insert -x '"`" : "readline-brackets \`\`"'
}

# alias :q='exit'
alias c='sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g"'
alias ca='keytool -list -v -keystore /etc/pki/ca-trust/extracted/java/cacerts -storepass changeit | vim -'
alias v='vim'
# alias vt="vim -c ':term ++curwin' -c 'vnew' -c ':term ++curwin'"
alias vt="vim -u ~/.termrc -c ':term ++curwin' -c ':vert term' -c ':file bash2' -c ':wincmd w'"
alias als='v ~/.bashrc'
# alias als='v ~/.tmprc'
alias alsdir='v ~/.dirrc'
alias vrc='v ~/.vimrc'
alias trc='v ~/.termrc'
alias re='source ~/.bashrc'
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
alias c='sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g"' # uncolor
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

alias cdbk='cd /TBB/nb3/logs/$(date '+%Y-%m')'
alias logfx='v /TBB/nb3/logs/ms_fx.log'

alias u='cat /etc/passwd'
alias g='cat /etc/group'

alias fn='realpath'
# servers
export api1=root@10.17.20.163
export api2=root@10.17.20.164
export amspw=root@10.17.40.69
export amsp1=root@10.17.20.218
export amsp2=root@10.17.20.219
export amsp21=root@10.17.20.222
export amsp22=root@10.17.20.223
export csap=root@10.17.20.227
export papi1=root@10.17.20.215
export papi2=root@10.17.20.216

alias api1="ssh $api1"
alias api2="ssh $api2"
alias amspw="ssh $amspw"
alias amsp1="ssh $amsp1"
alias amsp2="ssh $amsp2"
alias amsp21="ssh $amsp21"
alias amsp22="ssh $amsp22"
alias csap="ssh $csap"
alias papi1="ssh $papi1"
alias papi2="ssh $papi2"

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

# otp() {
#   grep -a "$1  OTP == " /TBB/nb3/logs/ms_tw.log --color=always | tail -1
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
    openssl genrsa -out server.key 4096
    # openssl req -new -key .\"server.key" -out "$filename.csr"  -subj "/C=TW/ST=Taiwan/L=Taipei/O=TBB/OU=IT/CN=$filename/emailAddress=yuhsiang.chunag@mail.tbb.com.tw"
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

initvim() {
    cd ~/.vim/bundle
    git clone https://github.com/Raimondi/delimitMate.git
    git clone https://github.com/tpope/vim-commentary.git
    git clone https://github.com/justinmk/vim-sneak.git
}

# clear
