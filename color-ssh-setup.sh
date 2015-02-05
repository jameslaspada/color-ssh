#!/bin/bash
#This script will setup the color-ssh command

THEME=$1
CHECK_SC=$(grep "\-f ~/.bashrc" ~/.bash_profile | wc -l)
CHECK_FN=$(grep "get_ssh()" ~/.bash_profile | wc -l)
# Escape code
esc=`echo -en "\033"`

# Set colors
cc_red="${esc}[0;31m"
cc_green="${esc}[0;32m"
cc_yellow="${esc}[0;33m"
cc_blue="${esc}[0;34m"
cc_normal=`echo -en "${esc}[m\017"`

if [ -z $THEME ]; then
	echo "${cc_red} Must execute the setup script with the theme name you want color-ssh to use. ${cc_normal}"
	echo "${cc_green} (i.e. sh color-ssh-setup.sh [THEME]) ${cc_normal}"
	exit
fi

echo "${cc_yellow} validating .bashrc file exists. ${cc_normal}"
if [ ! -f ~/.bashrc ]; then
  touch ~/.bashrc
  echo "${cc_green} created ~/.bashrc file.. ${cc_normal}"
else
  echo "${cc_green} .bashrc already exists. ${cc_normal}"
fi

echo "${cc_yellow} validating .bashrc file is sourced ${cc_normal}"
if [ $CHECK_SC -eq 0 ]; then
   cat <<- EOF >> ~/.bash_profile
if [ -f ~/.bashrc ]; then source ~/.bashrc fi
EOF
  echo "${cc_green} sourced .bashrc file. ${cc_normal}"
else
  echo "${cc_green} .bashrc is already sourced ${cc_normal}"
fi

echo "${cc_yellow} Configuring color-ssh! ${cc_normal}"
if [ $CHECK_FN -eq 0 ]; then
  cat << EOF >> ~/.bash_profile	

alias cssh="tabc $THEME; get_ssh "
function get_ssh(){
  for i in "$@"; do
    args+=("$i")
  done
  ssh "${args[@]}"
  unset args
  tabc
}

EOF

  cat <<- EOF >> ~/.bashrc
	
function tabc() {
NAME=$1; if [ -z "$NAME" ]; then NAME="Homebrew"; fi
osascript -e "tell application \"Terminal\" to set current settings of front window to settings set \"$NAME\""
}

EOF

  if [ $? -eq 0 ]; then
    echo "${cc_green} color-ssh configuration has completed successfully! ${cc_normal}"
  else
    echo "${cc_red} An Error has occured during the color-ssh setup! ${cc_normal}"
  fi
else
	echo "${cc_red} color-ssh has already been configured. No need to run! ${cc_normal}"
fi