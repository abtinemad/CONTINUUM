#!/usr/bin/env sh
# Test « source unique » — le moteur ne vit qu'une fois, dans noyau.js.
#
# C'est core.sh RETOURNÉ : hier on demandait « les copies concordent-elles ? »,
# aujourd'hui on demande « y a-t-il seulement une copie ? ». Plus de surveillance de
# duplication : on rend la duplication IMPOSSIBLE, on la détecte si elle revient.
#
# On cherche une signature INTERNE du moteur — buildKnot2, qui construit le nœud 2-lobes
# et n'est JAMAIS importée par un écran. La trouver dans un .html OU un .js = une recopie
# du CORE = rouge. On scanne les deux extensions : une copie .js (le genre de fossile qui
# dérive en silence) doit rougir autant qu'une copie dans un écran.
# Seul noyau.js est exclu : le noyau a le droit (et le devoir) de contenir buildKnot2.
# Portée : mockup/ (le dossier de ce banc). Une copie hors de mockup/ sort de ce garde-fou.
set -e
cd "$(dirname "$0")/.."
hits=$(grep -rl --include='*.html' --include='*.js' --exclude='noyau.js' --exclude-dir=node_modules "buildKnot2" . || true)
if [ -n "$hits" ]; then
  echo "SOURCE UNIQUE ROMPUE — buildKnot2 (moteur) recopié hors de noyau.js :"
  echo "$hits" | sed 's/^/  /'
  exit 1
fi
echo "source unique — le moteur ne vit que dans noyau.js"
