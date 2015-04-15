#!/bin/bash
# User specific aliases and functions
export EDITOR="/usr/bin/vim"
export SVN_EDITOR="/usr/bin/vim"
# 快捷命令定义区域
alias ll="ls -lG"
alias ehost="sudo vim /etc/hosts"
alias svim="sudo vim"
alias flushcache="dscacheutil -flushcache"
alias fdstart="sudo fd-server startDaemon"
alias fdstop="sudo fd-server stop"
alias sshtunnel="~/workspace/tools/sshtunnel.sh"

# $PS1 var defined
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
__ps1_last_cmd ()
{
    exit_code=$?
    if [ $exit_code -eq "0" ]; then 
        printf "✔"
    else 
        printf "✘"
    fi

}
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
if [ -f ~/workspace/tools/git-prompt.sh ]; then
  source ~/workspace/tools/git-prompt.sh
  export PS1='$(__ps1_last_cmd "(%s)")\[\e[m\][\u@\h:\W$(__git_ps1 "(%s)")]\\$ '
fi

# findjs
__find_js ()
{
	local arg1=$1
	local arg2=$2
	if [ -z $arg1 ] && [ -z $arg2]; then
		echo "error: You must specify at least one parameters. [find dirpath search-expr] or [find search-expr]"
		return 1
	fi
	# 'find . -name "*.html" -exec grep  {} ";"'
	if [ -z $arg2 ]; then
		find . -name "*.js" -type f | xargs grep -n $arg1
	else
		find $arg1 -name "*.js" -type f | xargs grep -n $arg2
	fi
}
alias findjs=__find_js

# Get lastest version
__svnlast ()
{
	local path=$1
	local number=$2

	if [ -z $number ]; then
		number=1
	fi

	svn ls -v $path | sort -d | tail -n $number 
}
alias svnlast=__svnlast

# Get lastest version
__svndiff ()
{
	local path=$1
	svn diff $path | colordiff
}
alias svndiff=__svndiff
