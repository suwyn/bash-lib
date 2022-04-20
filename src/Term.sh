#!/usr/bin/env bash

# http://www.linuxcommand.org/lc3_adv_tput.php
# https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x405.html
# https://programmer.group/detailed-explanation-of-linux-tput-command.html

# https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x361.html
# https://wiki.bash-hackers.org/scripting/terminalcodes

# https://www.baeldung.com/linux/sigint-and-other-termination-signals


# https://www.linuxjournal.com/article/2807

# Saves the current state of the terminal
function Term.save {
  tput smcup
}

# Restores the terminal to its previous state
function Term.restore {
  tput rmcup
}

# returns the number of columns available in the terminal
function Term.columns {
  tput cols
}

function Term.rows {
  tput lines
}

function Term.bold {
  tput bold
}

function Term.normal {
  tput sgr0
}

function Term::Print.bold {
  local text=$1

  Term.bold
  echo "$text"
  Term.normal
}

# captures arrow keys from user input
function Term::Key.navigate {
  local key

  IFS= read -rsn1 key 2>/dev/null >&2
  if [[ $key = ""      ]]; then echo enter; fi;
  if [[ $key = $'\x20' ]]; then echo space; fi;
  if [[ $key = $'\x1b' ]]; then
    read -rsn2 key
    if [[ $key = [A ]]; then echo up;    fi;
    if [[ $key = [B ]]; then echo down;  fi;
    if [[ $key = [C ]]; then echo right;  fi;
    if [[ $key = [D ]]; then echo left;  fi;
  fi
}
