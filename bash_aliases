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
    eval "`dircolors -b $HOME/etc/dircolors`"
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

# open file in emacs and raise emacs window. See ts-raiseme function
# in my emacs lib
alias edi='emacsclient -e "(ts-raiseme)"; emacsclient -n'

# Aliases added with add-alias:
alias xine='xine --no-splash'
alias fuseiso='fuseiso -p'
alias la='ls -lA'
alias screen='screen -xRR'
alias nmh='PATH=/usr/bin/mh:/home/tiago/bin:/home/tiago/bin:/usr/local/bin:/usr/bin:/bin:/usr/games '
alias dquilt='quilt --quiltrc=${HOME}/etc/quiltrc-dpkg '
alias lesc='LESS="-R" LESSOPEN="|pygmentize -g %s" less'
alias lesa='LESS="-R" LESSOPEN="|~/etc/lessfilter %s" LESSCLOSE="~/etc/lessfilter %s %s" less'
alias chrome-bb='setarch x86_64 --uname-2.6 google-chrome'
alias emapipe='emacsclient -n -e "(progn (switch-to-buffer "*results*") (shell-command "cat ~/piping.fifo" "*results*"))" & cat >~/piping.fifo'
alias bb='setarch x86_64 --uname-2.6'
alias mld='cd /var/lib/mldonkey/incoming; ls *'
alias offl='/home/tiago/src/offlineimap/offlineimap.py'
