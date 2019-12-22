export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
ZSH_THEME="ys"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false
KEYTIMEOUT=1

plugins=(
    git
    zsh-syntax-highlighting
    sudo
    fancy-ctrl-z
#    tmux
    pep8
)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/home/.texlive/2019/bin/x86_64-linux
export PATH=$PATH:/home/$USER/.local/bin/
export EDITOR="vim"
export OPENER=$EDITOR
export PAGER=bat
export MANPAGER=less
export MANPATH=$HOME/.texlive/2019/texmf-dist/doc/man
export INFOPATH=$HOME/.texlive/2019/texmf-dist/doc/info
#export BAT_THEME="OneHalfDark"
#export PRINTER=Brother
export SCRIPTS="/home/$USER/scripts"
export GPG_TTY=$(tty)
export XRES="/home/lordof20th/.Xresources"

alias zshrc="$EDITOR ~/.zshrc && exec zsh"
alias i3rc="$EDITOR ~/.config/i3/config"
alias xbi="sudo xbps-install -S"
alias xbsu="sudo xbps-install -Su"
alias xbr="sudo xbps-remove -R"
alias xbq="xbps-query -Rs"
alias lr="ls -R"
alias llr="ls -lR"
alias du="du -h"
alias df="df -h"
alias free="free -h"
alias cksv="ls /etc/sv/"
alias ztf="zathura --mode fullscreen"
alias v="vim"
alias vrc="$EDITOR ~/.vim/vimrc"
alias k="kak"
alias krc="$EDITOR ~/.config/kak/kakrc"
alias powertop="sudo powertop"
alias svup="ls /var/service/"
alias RM="rm -rdvf"
alias RMS="sudo rm -rdvf"
alias :q="echo 'You are not in Vim, you stupid...'"
alias pmbootstrap="./pmbootstrap.py"
alias mutt="neomutt"
alias -g dnull="/dev/null"
alias mergepdf="gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=temp.pdf"
alias xinit="exec xinit"
alias bsp="../bootstrap.sh"
alias ureload="xrdb -merge"
alias comptonrc="$EDITOR ~/.config/compton.conf"
alias i3blrc="$EDITOR ~/.config/i3blocks/config"
alias weather="curl -Ss 'https://wttr.in?0'"

eval $(thefuck --alias)

myip ()
{
    curl https://ifconfig.co
}

gitdiff ()
{
    git diff $1 | bat
}


gitssh ()
{
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/github
}
bck ()
{
	cp "$1" "$1.bak"
}
mkcd ()
{
    mkdir -p $1 && cd $1
}

gay ()
{
    yes "$(seq 231 -1 16)" | while read i
    do
        printf "\x1b[48;5;${i}m\n"
        sleep .02
    done
}

tex2ztf ()
{
    pdflatex $1 && ztf $1
}

buildlatex ()
{
    rubber --pdf $1
    rubber --clean $1
}

mask()
{
    printf '%s\n' ${(l:$#1::*:)1:$#1*3/4}
}
