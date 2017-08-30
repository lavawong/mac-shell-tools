#!/bin/bash
# User specific aliases and functions
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR="/usr/bin/vim"
export SVN_EDITOR="/usr/bin/vim"
# 快捷命令定义区域
alias rm="trash"
alias ll="ls -lG"
alias ehost="sudo vim /etc/hosts"
alias svim="sudo vim"
alias flushcache="dscacheutil -flushcache"
alias fdstart="sudo fd-server startDaemon"
alias fdstop="sudo fd-server stop"
alias sshtunnel="~/workspace/tools/sshtunnel.sh"
alias g="git"
alias gd="git diff"
alias gs="git status"
alias ppjson='python -mjson.tool'

[ -f $HOME/.securityrc ] && source $HOME/.securityrc

# $PS1 var defined
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

__ps1_last_cmd ()
{
    local exit_code=$?
    if [ $exit_code -eq "0" ]; then 
        echo "✔"
    else 
        echo "✘"
    fi

}
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
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

export GYP_GENERATORS=ninja
if [ -x $HOME/worksapce/depot_tools ]; then
    export PATH=$PATH:$HOME/workspace/depot_tools
    [ -x $HOME/workspace/src/out/Debug/chrome_sandbox ] && export CHROME_DEVEL_SANDBOX=$HOME/workspace/src/out/Debug/chrome_sandbox
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:${JAVA_HOME}/bin
if [ -x $HOME/java_tools/maven ]; then
    export M2_HOME=$HOME/java_tools/maven
    export PATH=$PATH:${M2_HOME}/bin
fi

if [ -x $HOME/java_tools/hadoop ]; then
    export HADOOP_HOME=~/java_tools/hadoop
    export PATH=$PATH:${HADOOP_HOME}/bin
    export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar
fi
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[30;43m'       # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/lavawong/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/lavawong/.sdkman/bin/sdkman-init.sh"
ANDROID_HOME=$HOME/Library/Android/sdk
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/platform-tools
alias mnpm="npm --registry=http://r.npm.sankuai.com \
--cache=$HOME/.cache/mnpm \
--disturl=http://npm.sankuai.com/dist/node \
--userconfig=$HOME/.mnpmrc"

alias catsss="lsof -i -n -P | grep privoxy"

PATH=$PATH:$HOME/workspace/depot_tools
