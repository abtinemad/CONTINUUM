#!/usr/bin/env sh
# Test de la géométrie du logo CONTINUUM.
#
# Source de vérité = le noyau : mockup/noyau.js, module ES unique. testvrille l'IMPORTE
# (plus d'eval, plus de core.js dérivé). Le moteur ne vit qu'une fois.
#
# Usage :  sh run_test.sh   →  doit afficher "Tout vert."
set -e
cd "$(dirname "$0")"
node testvrille.mjs
sh tests/source_unique.sh
