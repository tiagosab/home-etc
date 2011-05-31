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

# from: http://github.com/relevance/etc/blob/master/bash/project_aliases.sh
# In ~/.bash_profile define a PROJECT_PARENT_DIRS array and source this script. e.g.
# PROJECT_PARENT_DIRS[0]="$HOME/src"
# PROJECT_PARENT_DIRS[1]="$HOME/work"
# source ~/.project_aliases.sh
 
if [ -z "${PROJECT_PARENT_DIRS[*]}" ]; then
    echo "Define a PROJECT_PARENT_DIRS array in ~/.bash_profile"
fi

for PARENT_DIR in ${PROJECT_PARENT_DIRS[@]} ; do
    if [ -d "$PARENT_DIR" ]; then
        for PROJECT_DIR in $(/bin/ls $PARENT_DIR); do
            if [ ! -z "$(which cd$PROJECT_DIR)" ]; then
                continue # don't set alias if there is something already a command on the path with the same name
            fi
            if [ -d "$PARENT_DIR/$PROJECT_DIR" ]; then
                alias "cd$PROJECT_DIR"="cd $PARENT_DIR/$PROJECT_DIR"
            fi
        done
    fi
done

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
alias mld-c='mldonkey_command -p casa23'
alias screen='screen -xRR'
alias cdflavio='cd /home/tiago/home/filosofia/flavio'
alias cdmld='cd /srv/mldonkey/incoming/files'
alias cdspinoza='cd /home/tiago/home/filosofia/spinoza'
alias nmh='PATH=/usr/bin/mh:/home/tiago/bin:/home/tiago/bin:/usr/local/bin:/usr/bin:/bin:/usr/games '
alias dquilt='quilt --quiltrc=${HOME}/etc/quiltrc-dpkg '
