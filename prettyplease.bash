#!/bin/bash
# pretty sudo prompt
flowerseed=(
🌺 🌳 🌸 🌷 🌷 🌸 🌻 🌷 🌷 🌸 🌸 🌸 🌸 🌷 🌼 🌷 🌳 🌺 🌼 🌺
🌸 🌻 🌼 🌼 🌳 🌳 🌼 🌺 🌻 🌷 🐛 🌷 🌼 🌻 🌳 🌸 🌷 🌷 🌻 🌸
🌸 🦉 🌻 🌸 🌳 🌷 🌸 🌷 🌸 🌳 🌸 🌻 🌳 🐌 🌻 🌷 🌷 🌼 🌻 🌺
🌺 🌻 🌼 🌻 🌻 🌼 🌺 🌻 🌳 🌼 🌳 🌺 🌳 🌷 🌻 🌼 🌷 🌼 🌻 🌸
🌳 🌸 🌻 🌺 🌻 🌳 🌺 🌺 🌻 🌺 🌸 🌻 🌷 🌷 🌼 🌻 🌺 🌼 🌻 🌻
🌷 🌳 🌻 🌸 🌳 🌷 🌻 🌳 🌳 🌳 🌳 🌼 🌳 🌳 🌺 🌷 🌳 🌺 🌳 🌺
🦉 🌸 🌻 🌺 🌺 🌳 🌸 🌸 🌼 🌻 🌺 🌼 🌷 🌸 🌳 🌼 🌺 🌸 🌺 🌷
🌻 🌷 🌺 🌺 🌳 🌷 🌷 🐰 🌸 🌻 🌳 🌸 🌼 🌷 🌼 🌳 🌷 🐹 🌼 🌺
🌷 🌳 🌻 🌸 🌸 🌼 🐰 🌷 🌺 🌷 🌺 🌻 🌷 🌸 🌺 🌻 🌳 🌻 🌷 🌻
🌻 🌺 🌸 🌸 🌺 🌻 🌸 🌻 🌳 🌳 🌻 🐦 🌻 🌼 🌼 🌻 🌻 🌺 🌳 🐰
🌼 🐦 🌻 🌳 🌸 🌸 🌳 🌷 🌺 🌼 🌳 🌷 🌸 🌻 🌼 🌻 🐛 🌻 🌼 🌷
🌺 🌼 🌺 🌸 🌺 🦔 🌷 🌸 🌷 🌻 🌻 🌺 🌼 🌷 🐌 🌸 🌷 🌼 🌸 🐹
🌸 🌳 🌻 🌼 🌻 🌳 🌸 🌷 🌺 🌷 🌷 🌼 🌻 🌷 🌻 🌺 🌼 🌼 🌳 🌸
🌻 🌻 🌸 🌼 🌼 🌸 🌳 🌺 🌻 🌻 🌳 🌺 🌷 🐰 🌻 🌼 🐹 🌷 🌷 🌳
🌼 🌷 🌻 🌸 🌼 🌳 🌻 🌻 🌳 🌷 🌼 🌻 🌺 🌺 🌺 🌺 🌺 🌳 🌻 🌼
🌷 🌸 🌸 🌻 🌺 🌻 🌳 🌸 🌷 🌺 🌺 🌼 🌸 🌺 🌻 🌻 🌷 🌸 🌻 🌷
)

flowers() {
  local n=$1
  for i in $(seq 1 $[ n / 2]); do
    echo -n ${flowerseed[$RANDOM % ${#flowerseed[@]}]}
  done
}

flowerline() {
  flowers $COLUMNS
  echo
}

flowermsg() {
  local PADDING='    '
  local msg="$PADDING$1$PADDING"
  MARGLEFT=$[ (COLUMNS - ${#msg}) / 2 ]
  MARGRIGHT=$[ COLUMNS - MARGLEFT - ${#msg} ]
  if test $[ ${#msg} % 2] -eq 1; then
    msg="${msg} "
  fi
  if test $[ COLUMNS - (MARGLEFT + ${#msg} + MARGRIGHT)] -lt 0; then
    MARGLEFT=$[ MARGLEFT - 1 ]
  fi
  flowers $MARGLEFT
  for i in $(seq 1 ${#msg}); do echo -n ' '; done
  flowers $MARGRIGHT
  echo
  flowers $MARGLEFT
  echo -n "$msg"
  flowers $MARGRIGHT
  echo
  flowers $MARGLEFT
  for i in $(seq 1 ${#msg}); do echo -n ' '; done
  flowers $MARGRIGHT
  echo
}

flowerprompt() {
  local msg='please enter ur password, cutie pie'
  FLINES=$[ LINES - 2 ]
  HFLINES=$[ (FLINES - 3) / 2]
  FFLINES=$[ FLINES - 3 - HFLINES]
  for j in $(seq 1 $HFLINES); do
    flowerline
  done
  flowermsg "$msg"
  for j in $(seq 1 $FFLINES); do
    flowerline
  done
  echo -n "
  🥰 ps i love u 🥰 : "
}

alias prettyplease='sudo -p "$(flowerprompt)"'
