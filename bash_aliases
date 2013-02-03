# -*- shell-script -*-
# Some useful aliases.
alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'
alias clean='echo -n "Really clean this directory?";
	read yorn;
	if test "$yorn" = "y"; then
	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	   echo "Cleaned.";
	else
	   echo "Not cleaned.";
	fi'
alias h='history'
alias j="jobs -l"
alias l="ls -l "
alias ll="ls -l"
alias ls="ls -F"
alias pu="pushd"
alias po="popd"

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi
# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
    local name=$1 value="$2"
    echo alias $name=\'$value\' >>~/etc/bash_aliases
    eval alias $name=\'$value\'
    alias $name
}


# Aliases added with add-alias:
alias xine='xine --no-splash'
alias fuseiso='fuseiso -p'
alias la='ls -lA'
alias screen='screen -xRR'
alias nmh='PATH=/usr/bin/mh:/home/tiago/bin:/home/tiago/bin:/usr/local/bin:/usr/bin:/bin:/usr/games '
alias dquilt='quilt --quiltrc=${HOME}/etc/quiltrc-dpkg '
