#!/usr/bin/env sh
# Le banc de fidélité de l'interface. Séparé de run_test.sh : celui-ci teste la GÉOMÉTRIE du
# fil (node nu, aucune dépendance) ; celui-là teste ce que l'app FAIT (puppeteer, un navigateur).
# On ne les fusionne pas : la géométrie doit rester testable sur une machine sans navigateur.
#
# Un banc a TROIS états : 0 tenu · 1 rompu · 2 non exécuté (et ça arrête la chaîne).
# Comme db/run_db_test.sh exige un PostgreSQL réel et ne sort pas 0 quand il est absent, ce
# banc exige puppeteer et sort 2 quand il manque. Un banc sauté n'est pas un banc vert : un
# 0 rendu sans avoir rien vérifié, c'est quatre erreurs qui simulent quatre vertus.
set -e
cd "$(dirname "$0")/.."
./core.sh verifier          # un CORE dérivé → on ne teste rien
node -e "require.resolve('puppeteer')" 2>/dev/null || {
  echo "banc NON EXÉCUTÉ — puppeteer absent. \`npm ci\` d'abord."
  echo "Un banc sauté n'est pas un banc vert."
  exit 2
}
node tests/fidelite.js
