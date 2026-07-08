#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
patch_dashmode_renvoi.py — mockup/continuum_mockup.html — DASH_MODE cite §19.

Une seule édition, hors CORE : la ligne DASH_MODE n'avait aucun commentaire.
Depuis le commit 79485c8, §19 ne cite plus l'identifiant DASH_MODE (la doctrine
ne dépend pas d'un nom de constante). Le renvoi doit donc exister dans l'autre
sens : le code cite la doctrine, en nommant la phrase, pas seulement la section
— un renvoi ne vaut que s'il résout.

DRY-RUN PAR DÉFAUT. Ancre unique, vérifiée hors-CORE. Garde-CORE avant et après.
Anti-double-application. Ne commit pas, ne push pas.

    python3 mockup/patch_dashmode_renvoi.py
    python3 mockup/patch_dashmode_renvoi.py --write
"""
import json, sys, os, difflib
F=os.path.join("mockup","continuum_mockup.html")
if not os.path.exists(F): F="continuum_mockup.html"
if not os.path.exists(F): sys.exit("continuum_mockup.html introuvable — lance depuis la racine du repo.")
WRITE="--write" in sys.argv
D=json.loads(r'''{"old": "  var DASH_MODE=['compose','read','compose'];", "new": "  var DASH_MODE=['compose','read','compose'];   // §19 : « deux lobes composent, un seul lit ». Le mode est la nature du lobe, non une humeur\n                                                 // de l'œil : la lentille est l'organe de la seule Vigilante (idx1), pas un réglage disponible partout."}'''); old,new=D["old"],D["new"]
c=open(F,encoding="utf-8").read(); orig=c
CB,CE="/*==CORE==*/","/*==/CORE==*/"
if CB not in c or CE not in c: sys.exit("ARRÊT — marqueurs de CORE introuvables.")
ci=c.index(CB); cj=c.index(CE)+len(CE); core=c[ci:cj]
if "deux lobes composent, un seul lit" in c: sys.exit("ARRÊT — semble déjà appliqué. Aucune écriture.")
if c.count(old)!=1: sys.exit("ARRÊT — ancre trouvée %d fois (attendu 1). Aucune écriture." % c.count(old))
p=c.find(old)
if not (p+len(old)<=ci or p>=cj): sys.exit("ARRÊT — l'ancre tombe DANS le CORE. Aucune écriture.")
c=c.replace(old,new,1)
if c[c.index(CB):c.index(CE)+len(CE)]!=core: sys.exit("ARRÊT — le CORE a bougé. Aucune écriture.")
print("Fichier      : %s" % F); print("Édition      : 1 (hors-CORE, ancre unique)")
print("CORE         : intact (%d octets)" % len(core)); print("Δ caractères : %+d\n" % (len(c)-len(orig)))
if not WRITE:
    print("="*72); print("DRY-RUN — rien n'a été écrit. Diff proposé :"); print("="*72)
    d=difflib.unified_diff(orig.splitlines(keepends=True),c.splitlines(keepends=True),
                           fromfile=F+" (actuel)",tofile=F+" (après)")
    try:
        sys.stdout.writelines(d); print()
        print("→ relis à froid. Si ça te va :  python3 %s --write" % os.path.basename(__file__))
        sys.stdout.flush()
    except BrokenPipeError:
        os.dup2(os.open(os.devnull,os.O_WRONLY),sys.stdout.fileno())
    sys.exit(0)
open(F,"w",encoding="utf-8").write(c)
print("✓ DASH_MODE cite §19. %s réécrit." % F)
print("  → mockup/run_test.sh doit rester vert. Relis le `git diff`, commite toi-même.")
