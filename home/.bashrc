[[ -s "$HOME/.bashrc_private" ]] && source "$HOME/.bashrc_private"

function parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

function dssh() {
	docker exec -ti $1 bash
}

function dlogs() {
	docker logs -f $1
}

function dstats() {
	docker stats --format "table {{.Name}}\t{{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}"
}

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
alias l="ls -lah"
alias ll="ls -lah"
alias r="tput reset"
alias s="sudo"
alias dcup="docker-compose up"
alias dcupd="docker-compose up -d"
alias dps="docker ps"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
alias dcrebuild="dcd && dcb && dcup --remove-orphans"
alias dcrebuildd="dcd && dcb && dcupd --remove-orphans"
alias phpx='php -dzend_extension=xdebug.so -dxdebug.remote_autostart=on -dxdebug.remote_enable=1 -dxdebug.remote_connect_back=1'
alias gotest='go test ./... -race -count=1 -failfast'
alias gotesti='gotest -tags=integration'
alias gotestv='gotest -v'
alias gotestiv='gotesti -v'
alias gotestc='gotest -coverprofile=coverage.out'
alias gotestic='gotesti -coverprofile=coverage.out'
alias gocover='gotestc && go tool cover -html=coverage.out && rm coverage.out'
alias gocoveri='gotestic && go tool cover -html=coverage.out && rm coverage.out'
alias gt='git log --graph --abbrev-commit --decorate --format=format:'\''%C(dim white)%h%C(reset) %C(dim white)%aD%C(reset) %C(yellow)%d%C(reset)%n        %C(white)%s%C(reset) %C(green)%an%C(reset)'\'' --all'
alias gl="git log --pretty=format:'%ad %C(Yellow)%s%Creset (%-an)' --date=format:'%d/%m/%Y %H:%m'"
alias glup="gulp"
alias gi="grep -i"
alias gs="gb | gi"

export PS1="\u \[\033[36m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin
