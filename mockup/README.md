# mockup — prototype visuel CONTINUUM (nœud · œil · scouter)

Prototype du fil vrillé (le **nœud**), de l'**œil** (le point rouge qui veille) et du **scouter**
(visière de scrutin qui se déploie sur le lobe Vigilante). **Un seul mockup, tout intégré** ; ce
README dit **où sont les molettes** pour régler plus tard.

## Fichiers

- `continuum_mockup.html` — **le mockup** : géométrie du nœud (2/3/5 lobes vrillés), l'œil et sa
  signalétique Vigie, le dashboard, le scouter intégré, + un **atelier tracé/œil** (panneau de
  curseurs). Tout est ici.
- `scouter/atelier_scouter.html` — atelier interactif de réglage de la **forme** du scouter
  (curseurs + bouton « copier les réglages »). Outil de calage : les valeurs se reportent à la main
  dans le mockup.
- `scouter/scouter_clean.svg` — l'asset visière source (contour noir, sans cadre ni traits bleus).
  L'art est déjà intégré au mockup ; ce fichier est l'original éditable.

## Lignée `logo/` (câblée aux tests — à consolider)

Attention : le dossier `logo/` contient une **autre** `continuum_mockup.html` — la version trilobe
qui est la **source des tests CORE** (`logo/run_test.sh` en extrait `core.js` pour `testvrille.js`).
Ce mockup-ci (avec scouter/œil/dashboard) en est le **descendant visuel** mais n'est *pas* encore la
source des tests. Les deux ont **divergé**. Les unifier en un seul `continuum_mockup.html` canonique
(recâblage de `run_test.sh` + vérification que le CORE du descendant passe `testvrille.js`) est un
**chantier à part, délibéré** — il touche les tests. En attendant, **la source de vérité du CORE
reste `logo/`** ; ce dossier-ci est le prototype visuel en aval.

## Où régler — carte des molettes

### Tracé / œil — panneau atelier dans `continuum_mockup.html`
`rW` épaisseur · `rG` réserve · `rD` données (patient) · `rP` point · `rIris` iris · `rR` rouge ·
`rI` encre · `rB` bec · `rC` contraste.

### Animations de l'œil — constantes dans le render de `continuum_mockup.html`
- spin : 6°/s (`spinAcc += 0.096`), **gelé** pendant l'interro et le scrutin
- retournement au clic : `flipDur = 1.7` (2 tours)
- corde à sauter (entrée/sortie de boucle) : `moveDur = 0.62`
- navette du scrutin : période `2.2` s
- gestes ponctuels : `bounceDur` (1.3 interro « appel » · 0.7 notif « ping »)
- coup d'œil angle-mort : ~13 s (`sin(T*0.5)`)
- inactivité : `IDLE_IN = 14`

### Scouter — forme : atelier `scouter/atelier_scouter.html`
Curseurs : `size` · `posX` · `posY` · `orient` · `depth` (écrasement H ensemble) ·
`montS`/`montT` (dimension/charnière monture) · `ancS`/`ancT`/`ancDep` (dimension/charnière/écrasement
boîtier) · `tintO` (teinte lentille). Le bouton « copier les réglages » donne les valeurs à reporter
dans le mockup.

### Scouter — animations : `SCOUT{}` dans le render de `continuum_mockup.html`
`size` · `posX` · `posY` · `dur` (durée du rabat) · `oriMin`/`oriMax` (bornes du sway
d'orientation) · `montRest` (angle monture posée) · `flipFrom` (angle monture relevée au départ).
Sway continu de l'ensemble : `sin(T*0.45)`.

## Réglages figés actuels

- Dashboard : boucle **Vigilante = la plus grande, à droite** (`ASYM[3].s = [0.97, 1.12, 0.90]`),
  `DASH_MODE = ['compose','read','compose']` (read = Vigilante = boucle de droite, index de tri 1 ;
  le tri des nœuds top→droite→gauche interdit droite ET index 2).
- Œil dans le dashboard : se pose **dans le corps de la boucle** (`dashBary`, facteur 2.25), et passe
  **sous le fil** au retour au centre (calque `#eyeG` réordonné pendant l'animation `under`).
- Scouter : `size 0.66`, lentille `fill-opacity 0.70`, rabat `flipFrom 50 → montRest −2` en `dur 0.7`,
  sway d'orientation `[−1, +12]`. N'apparaît que sur la boucle Vigilante, une fois le tournoiement du
  clic terminé (~1.7 s).

## Montage du scouter (historique)

Le scouter est **intégré** au mockup — il n'y a plus de patch à exécuter. Pour mémoire, il avait été
greffé chirurgicalement en 5 points d'ancrage : **(0)** `<defs>` — masque de lentille `#scLensHole` +
clips monture/ancrage + l'art `#scoutArt` ; **(1)** markup `#scouter` (ancrage statique + `#scMonture`)
avant `#labels` ; **(2)** refs DOM `scouterG` + `montureG` ; **(3)** constantes `SCOUT{}` +
`scoutT`/`wasScouting` ; **(4)** render — rabat d'entrée + sway, sous condition `scouting`. Le script
de montage d'origine (`patch_scouter.py`) reste dans l'historique git si un jour il faut re-greffer
sur une nouvelle base.

## Note technique

`ptIris` (l'iris) est déclaré explicitement dans le bloc de refs — **ne pas le retirer** : sans lui,
le render lève un `ReferenceError` avant le bloc scouter dans les environnements sans accès nommé
(`window.ptIris`), et le scouter cesse d'apparaître.
