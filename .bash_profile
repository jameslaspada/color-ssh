   adding line
   adding line

if [ -f ~/.bashrc ]; then source ~/.bashrc fi

alias cssh="tabc ssh; get_ssh "
function get_ssh(){
  for i in "ssh"; do
    args+=("")
  done
  ssh ""
  unset args
  tabc
}

