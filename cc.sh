#!/usr/bin/env bash

bold="$(tput bold)"
dim="$(tput dim)"
reset="$(tput sgr0)"
yellow="$(tput setaf 3)"

cat <<EOF

 ${dim}╭───────────────────────────────────────────────────────╮
 ${dim}│                                                       │
 ${dim}│${reset}          ${bold}Jack Dunne${reset}, fourth year cs student           ${dim}│
 ${dim}│${reset}             @ university college dublin${reset}               ${dim}│
 ${dim}│                                                       │
 ${dim}│${reset}        ${bold}email:${reset}             jackinfurs${dim}@gmail.com        │
 ${dim}│${reset}        ${bold}web:${reset}               jackinfurs${dim}.github.io        │
 ${dim}│${reset}        ${bold}github:${reset}           ${dim}github.com/${reset}jackinfurs        ${dim}│
 ${dim}│${reset}        ${bold}codeberg:${reset}       ${dim}codeberg.org/${reset}jackinfurs        ${dim}│
 ${dim}│${reset}        ${bold}linkedin:${reset}    ${dim}linkedin.com/in/${reset}jackinfurs        ${dim}│
 ${dim}│                                                       │
 ${dim}│${reset}        ${bold}card:${reset}  ${yellow}curl -sL jackinfurs.github.io/cc${reset}        ${dim}│
 ${dim}│                                                       │
 ${dim}╰───────────────────────────────────────────────────────╯

EOF

