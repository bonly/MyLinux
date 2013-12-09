#!/bin/bash
#set -o vi
set -o emacs
alias grep='grep --color -n '
alias ls='ls --color=auto'
alias devenv='. /home/opt/bin/DevPath'
#alias cpu='for i in 0 1 2 3; do sudo cpufreq-selector -c $i -g performance; done; cat /proc/cpuinfo &'
#alias hcpu='$HOME/bin/cpu performance &'
#alias lcpu='$HOME/bin/cpu ondemand &'
alias vcpu='cat /proc/cpuinfo |grep MHz'

[[ -f ~/bin/AppPath ]] && source ~/bin/AppPath

#function _update_ps1(){
#  export PS1="$(~/bin/powerline-bash.py $?)"
#}
#export PROMPT_COMMAND="_update_ps1"

export PS1='\[\e[36;1m\]\u@\[\e[32;1m\]\h:\[\e[35m\]\w\[\e[34m\]\$ \[\e[0m\]'
export PS2="\[\033[01;31m\]continue ->\[\033[00m\]"
export LANG=zh_CN.utf8
export PATH=.:$HOME/bin:$PATH:/bin:/sbin:/usr/bin:/usr/sbin
export LD_LIBRARY=.:/lib64:/lib:/usr/lib:/usr/local/lib

[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh
complete -cf sudo

#wayland
#export XDG_RUNTIME_DIR=/tmp

shopt -s histappend  #Ã¥Â°ÂÃ¥ÂÂ½Ã¤Â»Â¤Ã¨Â¿Â½Ã¥ÂÂ Ã¥ÂÂ° history Ã¤Â¸Â­
PROMPT_COMMAND=`history -a` #Ã¥ÂÂ¨Ã¦ÂÂ¾Ã§Â¤ÂºÃ¥ÂÂ½Ã¤Â»Â¤Ã¦ÂÂÃ§Â¤ÂºÃ§Â¬Â¦Ã¦ÂÂ¶Ã¯Â¼ÂÃ¤Â¿ÂÃ¥Â­Â history
export HISTTIMEFORMAT='%F %T ' #Ã¦ÂÂ¾Ã§Â¤ÂºÃ¦ÂÂ§Ã¨Â¡ÂÃ¦ÂÂ¶Ã©ÂÂ´

#Ã¦ÂÂ§Ã¥ÂÂ¶Ã¥ÂÂÃ¥ÂÂ²Ã¥ÂÂ½Ã¤Â»Â¤Ã¨Â®Â°Ã¥Â½ÂÃ§ÂÂÃ¦ÂÂ»Ã¨Â¡ÂÃ¦ÂÂ°
#HISTSIZE=450
#HISTFILESIZE=450
#Ã¦ÂÂ´Ã¦ÂÂ¹Ã¥ÂÂÃ¥ÂÂ²Ã¦ÂÂÃ¤Â»Â¶Ã¥ÂÂÃ§Â§Â°
#HISTFILE=~/.commandline_warrior
#Ã¥ÂÂÃ©ÂÂ¤Ã¨Â¿ÂÃ§Â»Â­Ã©ÂÂÃ¥Â¤ÂÃ§ÂÂÃ¦ÂÂ¡Ã§ÂÂ®
#export HISTCONTROL=ignoredups
#Ã¦Â¸ÂÃ©ÂÂ¤Ã¦ÂÂ´Ã¤Â¸ÂªÃ¥ÂÂ½Ã¤Â»Â¤Ã¥ÂÂÃ¥ÂÂ²Ã¤Â¸Â­Ã§ÂÂÃ©ÂÂÃ¥Â¤ÂÃ¦ÂÂ¡Ã§ÂÂ®
export HISTCONTROL=erasedups
#Ã¥Â¼ÂºÃ¥ÂÂ¶ history Ã¤Â¸ÂÃ¨Â®Â°Ã¤Â½ÂÃ§ÂÂ¹Ã¥Â®ÂÃ§ÂÂÃ¥ÂÂ½Ã¤Â»Â¤,Ã¤Â¸ÂÃ¦ÂÂ³Ã¨Â¢Â«Ã¨Â®Â°Ã¤Â½ÂÃ§ÂÂÃ¥ÂÂ½Ã¤Â»Â¤Ã¥ÂÂÃ©ÂÂ¢Ã¨Â¾ÂÃ¥ÂÂ¥Ã¤Â¸ÂÃ¤Â¸ÂªÃ§Â©ÂºÃ¦Â Â¼
#export HISTCONTROL=ignorespace

#history -c Ã¦Â¸ÂÃ©ÂÂ¤Ã¦ÂÂÃ¦ÂÂÃ§ÂÂÃ¥ÂÂ½Ã¤Â»Â¤Ã¥ÂÂÃ¥ÂÂ²
#!!:$ Ã¥Â°ÂÃ¤Â¸ÂºÃ¥Â½ÂÃ¥ÂÂÃ§ÂÂÃ¥ÂÂ½Ã¤Â»Â¤Ã¨ÂÂ·Ã¥Â¾ÂÃ¤Â¸ÂÃ¤Â¸ÂÃ¦ÂÂ¡Ã¥ÂÂ½Ã¤Â»Â¤Ã§ÂÂÃ¥ÂÂÃ¦ÂÂ°,Ã¤Â½Â¿Ã§ÂÂ¨ !$ Ã¥ÂÂ¯Ã¤Â»Â¥Ã¨Â¾Â¾Ã¥ÂÂ°Ã¥ÂÂÃ¦Â Â·Ã§ÂÂÃ¦ÂÂÃ¦ÂÂ,!^ Ã¤Â»ÂÃ¤Â¸ÂÃ¤Â¸ÂÃ¦ÂÂ¡Ã¥ÂÂ½Ã¤Â»Â¤Ã¨ÂÂ·Ã¥Â¾ÂÃ§Â¬Â¬Ã¤Â¸ÂÃ©Â¡Â¹Ã¥ÂÂÃ¦ÂÂ°
#!cp:2 Ã¤Â»ÂÃ¥ÂÂ½Ã¤Â»Â¤Ã¥ÂÂÃ¥ÂÂ²Ã¤Â¸Â­Ã¦ÂÂÃ§Â´Â¢Ã¤Â»Â¥ cp Ã¥Â¼ÂÃ¥Â¤Â´Ã§ÂÂÃ¥ÂÂ½Ã¤Â»Â¤Ã¯Â¼ÂÃ¥Â¹Â¶Ã¨ÂÂ·Ã¥ÂÂÃ¥Â®ÂÃ§ÂÂÃ§Â¬Â¬Ã¤ÂºÂÃ©Â¡Â¹Ã¥ÂÂÃ¦ÂÂ°
#!cp:$ Ã¨ÂÂ·Ã¥ÂÂ cp Ã¥ÂÂ½Ã¤Â»Â¤Ã§ÂÂÃ¦ÂÂÃ¥ÂÂÃ¤Â¸ÂÃ©Â¡Â¹Ã¥ÂÂÃ¦ÂÂ°
#Ã¤Â½Â¿Ã§ÂÂ¨ HISTIGNORE Ã¥Â¿Â½Ã§ÂÂ¥Ã¥ÂÂÃ¥ÂÂ²Ã¤Â¸Â­Ã§ÂÂÃ§ÂÂ¹Ã¥Â®ÂÃ¥ÂÂ½Ã¤Â»Â¤
#export HISTIGNORE=Ã¢ÂÂpwd:ls:ls -ltr:Ã¢ÂÂ

#apropos
#man
#whatis

export PATH=/home/opt/Sencha:$PATH

#for TTY in /dev/tty[1-4]; do
#       setterm -term linux -blength 0 > $TTY
#done

export SENCHA_SDK_TOOLS_2_0_0_BETA3="/home/opt/Sencha"

if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
    startx
fi
