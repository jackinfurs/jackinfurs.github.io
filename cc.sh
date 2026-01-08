#!/usr/bin/env bash

bold="$(tput bold)"
dim="$(tput dim)"
reset="$(tput sgr0)"
yellow="$(tput setaf 3)"

cat <<EOF

 ${dim}╭───────────────────────────────────────────────────────╮
 ${dim}│                                                       │
 ${dim}│${reset}           ${bold}Jack Dunne${reset}, final year cs student           ${dim}│
 ${dim}│${reset}              @ university college dublin${reset}              ${dim}│
 ${dim}│                                                       │
 ${dim}│${reset}        ${bold}web:${reset}                      jackinfurs.ie        ${dim}│
 ${dim}│${reset}        ${bold}email:${reset}                 me${dim}@jackinfurs.ie        │
 ${dim}│${reset}        ${bold}github:${reset}           ${dim}github.com/${reset}jackinfurs        ${dim}│
 ${dim}│${reset}        ${bold}codeberg:${reset}       ${dim}codeberg.org/${reset}jackinfurs        ${dim}│
 ${dim}│${reset}        ${bold}linkedin:${reset}    ${dim}linkedin.com/in/${reset}jackinfurs        ${dim}│
 ${dim}│                                                       │
 ${dim}│${reset}             ${yellow}curl https://jackinfurs.ie/cc/${reset}${dim}            │
 ${dim}│                                                       │
 ${dim}╰───────────────────────────────────────────────────────╯

EOF

