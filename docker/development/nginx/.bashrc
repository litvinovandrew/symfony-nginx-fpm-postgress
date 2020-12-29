umask 002

export TERM=xterm

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -ahl'
alias ownr='chown -R www-data:www-data .'
alias usr='su www-data'

alias debug_on='cp ~/xdebug_on.ini /usr/local/etc/php/conf.d/xdebug.ini  && service apache2 reload'
alias debug_off='cp ~/xdebug_off.ini /usr/local/etc/php/conf.d/xdebug.ini  && service apache2 reload'



if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
