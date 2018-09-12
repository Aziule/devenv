parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

dockerbash() {
    sudo docker exec -ti $1 bash
}

export PS1="\u@\h \[\033[36m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias s="sudo"
alias ga="git add"
alias gc="git checkout"
alias g="git"
alias gcm="git cm"
alias gst="git st"
alias gd="git diff"
alias gsd="git sdiff"
alias gfd="git fdiff"
alias ga="git add"
alias grs="git reset"
alias gb="git branch"
alias gpo="git pushcurrent"
alias gpom="git pull origin master"
alias gp="git pullcurrent"
alias .="cd ../"
alias ..="cd ../../"
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias -- -="cd -"
alias h="cd ~/"
alias w="cd ~/work"
alias www="cd /var/www"
alias l="ls -lh"
alias r="tput reset"
alias s="sudo"
alias sdcup="sudo docker-compose up"
alias sdcupd="sudo docker-compose up -d"
alias sdcd="sudo docker-compose down"
alias sdcb="sudo docker-compose build"
alias sdps="sudo docker ps"
alias sdcrebuild="sdcd && sdcb && sdcup --remove-orphans"
alias sdcrebuildd="sdcd && sdcb && sdcupd --remove-orphans"
alias phpx='php -dzend_extension=xdebug.so -dxdebug.remote_autostart=on -dxdebug.remote_enable=1 -dxdebug.remote_connect_back=1'
alias gt='git log --graph --abbrev-commit --decorate --format=format:'\''%C(dim white)%h%C(reset) %C(dim white)%aD%C(reset) %C(yellow)%d%C(reset)%n        %C(white)%s%C(reset) %C(green)%an%C(reset)'\'' --all'
alias gl="git log --pretty=format:'%ad %C(Yellow)%s%Creset (%-an)' --date=format:'%d/%m/%Y %H:%m'"
alias glup="gulp"
alias gi="grep -i"
alias gs="gb | gi"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
