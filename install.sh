#!/bin/bash
set -x

ETC="${HOME}/etc"

ln -s  ${ETC}/bash_init      ${HOME}/.bashrc
ln -s  ${ETC}/bash_init      ${HOME}/.bash_profile
ln -s  ${ETC}/conkerorrc     ${HOME}/.conkerorrc	  
ln -s  ${ETC}/gitconfig	     ${HOME}/.gitconfig 	  
ln -s  ${ETC}/hgrc	         ${HOME}/.hgrc      	  
ln -s  ${ETC}/html2psrc	     ${HOME}/.html2psrc 	  
ln -s  ${ETC}/inputrc	     ${HOME}/.inputrc   	  
ln -s  ${ETC}/kde-vars.sh    ${HOME}/.kde/env/kde-vars.sh
ln -s  ${ETC}/muttrc	     ${HOME}/.muttrc             
ln -s  ${ETC}/offlineimaprc  ${HOME}/.offlineimaprc    
ln -s  ${ETC}/reportbugrc    ${HOME}/.reportbugrc        
ln -s  ${ETC}/screenrc	     ${HOME}/.screenrc           
ln -s  ${ETC}/stumpwmrc	     ${HOME}/.stumpwmrc          
ln -s  ${ETC}/sensible-data/netrc ${HOME}/.netrc
ln -s  ${ETC}/pulseaudio/default.pa \
   ${HOME}/.config/pulse/default.pa

if [ "$(crontab -l)" ]
then
    echo "Crontab not empty. Ignoring \$ETC/crontab"
else
    crontab ${ETC}/crontab
fi
