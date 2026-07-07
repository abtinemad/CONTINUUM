# Internes de l'eval — remplissage depuis le moteur Collègue (2026-07-07)

> Remplit les trois points laissés en attente par `architecture_eval.md` (§ « Ce qui attend tes
> fichiers Collègue ») : (1) comment le cerveau lit le brut, extrait, cite le sanctuaire ; (2) le
> calibrage de la couverture sémantique sur *ta* phénoménologie ; (3) le calcul du différentiel
> Affectif↔Réflexif sans le résoudre. **La topologie ne bouge pas** — seuls les internes se
> remplissent.
>
> Source lue en entier : le moteur LeCLG réel — `EVAL_SYSTEM` (évaluateur silencieux),
> `useReflectionCard.ts` (la carte : fragment brut + champs distillés + miroir), `climate.ts`
> (agrégation métadonnée-seule), `useCarnetAnalyses.ts` (chaîne d'analyses gatée), `server.ts` (les
> prompts d'analyse + la méthode longitudinale + le registre-garde partagé). + Sibeoni 2020
> (reconnaissance + surprise) + ta thèse/mémoire TPL (sujet = l'aidant, jamais le patient).
> Compagnon de `extraction_leclg.md` et `methode_reflexivite.md` : il **ferme** leurs verrous ouverts.

---

## Interne 1 — Comment le cerveau lit le brut

**Ce qu'il lit.** Le domaine 1 (perceptif, mouvant — « selon la perception de qui récolte »), jamais
le domaine 0 (dur). Confirmé mécaniquement : la carte LeCLG travaille les *propos*, pas l'état-civil.
La donnée dure n'a pas besoin de sémantique ; la donnée vécue en dépend (doctrine, §18 bis, « Les trois strates — récolte, métabolisation, institutionnel »).

**Comment il lit.** Il lit la **texture, l'angle, la défense** — pas le contenu-verdict. LeCLG lit un
répertoire de mécanismes (déni, projection, clivage, isolation de l'affect…) *« comme des pièces sur
un échiquier — sans jamais les nommer »*. Transposé : l'eval lit l'angle que le soignant occupe, la
défense de l'écrit — jamais un jugement sur le patient. Il **projette** de ce brut un condensé dans
l'Affectif (le vécu) et le Réflexif (le raisonnement / la posture) : la re-projection prémâchée du
§18 bis (« Les trois strates — récolte, métabolisation, institutionnel »).

**Raisonnement avant booléens.** `EVAL_SYSTEM` force le champ `raisonnement` *avant* tout booléen —
« juger après avoir regardé, pas d'emblée ». Réflexivité bakée dans la structure de sortie
(`methode_reflexivite`, Principe 1). À reprendre tel quel : toute sortie d'eval s'ouvre par le regard,
ferme par le jugement.

**Deux mécanismes distincts — ne pas les fondre.** (a) *La mesure auto-effaçante = la règle de crédit.*
`EVAL_SYSTEM` : « tu évalues UNIQUEMENT ce que la PERSONNE apporte, jamais ce que le facilitateur
propose, demande, reformule ou suggère. » → l'eval crédite la trace du **soignant**, jamais ce que la
plume a suggéré ; le tool ne compte pas sa propre influence. (Confirmé au schéma, §6.4 : « il crédite
ce que *tu* fais, jamais ce que la machine a suggéré ».) (b) *La Vigilante non-déposable = elle est
**calculée**, pas composée.* Le différentiel et la couverture sont des **projections** (domaine 3,
recalculables) ; il n'existe **aucune `nature` de dépôt** où l'on déposerait dans la Vigilante
(catalogue §4), et la machine n'a pas d'`INSERT` (invariant 2). « On la lit, on n'y dépose pas » ne
tient donc **pas** à la règle de crédit — il tient à l'**absence de guichet**. Les deux se renforcent
(l'eval témoigne sans se créditer ; la Vigilante se lit sans se remplir) mais reposent sur deux
mécanismes séparés : les fondre ferait porter la non-déposabilité par le mauvais.

**Gaté, pas continu.** Les analyses LeCLG se déclenchent à des seuils (temps + volume : élan ≥ 7 j &
≥ 3 cartes ; matrice ≥ 21 j, ≥ 5 cartes, ≥ 2 prismes — `useCarnetAnalyses.ts`), jamais en flux. →
l'eval de CONTINUUM se calcule aux **moments clés** (la branche compte rendu), pas à chaque frappe. La
réflexivité exige l'arrêt conscient (`methode_reflexivite`, Principe 3) ; un eval continu la tuerait.

---

## Interne 2 — Citer le sanctuaire verbatim sans le nouer (résout l'item déféré)

Tu avais posé cet item de côté — « tu vas voir avec le moteur ». Le moteur le tranche.

**Le mécanisme = le champ typé.** La carte LeCLG demande un `fragment` : *« un mot, une image ou une
expression brute tirée directement des propos de la personne. **Pas de reformulation propre.** »* Le
`fragment` est un **champ à part** dans le JSON, structurellement séparé des champs reformulés
(`deplacement`, `direction`). → **Le verbatim vit dans son propre créneau typé ; l'eval lit *autour*,
jamais dedans.** C'est exactement le `lecture_clinique` **pass-through** qu'`architecture_eval.md`
avait posé en I/O — le moteur confirme que le motif tient en production.

**Les couches d'aval ne re-touchent jamais le brut.** Le `miroir` LeCLG est *« RÉGÉNÉRÉ à partir des
seuls champs distillés de la carte (jamais la conversation) »*, avec `noInjection: true`, et sous
consigne *« ne résume pas, ne donne aucun conseil, ne pose aucune question »*. → deux invariants d'un
coup : (a) **projection sur les champs distillés**, jamais re-cascade sur le brut ; (b) *montrer sans
conclure* baké dans la consigne de génération. Le sanctuaire est protégé **par absence de re-lecture**,
pas par un filtre. (Renforcé côté DB : conversations non persistées.)

**⚠️ Divergence à tenir — LeCLG chaîne ses analyses, CONTINUUM interdit eval-lit-eval.** LeCLG fait lire
à son analyse `affect` la **sortie** de son analyse `lien` (`useCarnetAnalyses.ts` : `refresh("affect",
…, { fragments: cards, lien: lienData, … })`). ⚠️ *Ici `lien` = une analyse du Carnet LeCLG — **aucun
rapport avec le Lien, §18 bis**, l'objet collectif ; simple homonymie.* La topologie CONTINUUM
**interdit** ce chaînage : « aucune eval ne lit une autre eval pour du contenu » — sinon un trou creusé
dans une eval devient invisible dans la suivante (cascade de résumés). L'Affectif et le Réflexif lisent
donc le brut **en parallèle**, jamais l'un la sortie de l'autre. On emprunte au moteur la mécanique de
la carte (fragment typé + miroir sur distillé), **pas** son chaînage. C'est le point précis où copier
LeCLG casserait ton event-sourcing.

---

## Interne 3 — Le différentiel Affectif↔Réflexif sans le résoudre

**Localisation, pas magnitude** (validé #4). Le modèle est déjà dans `EVAL_SYSTEM` : la diffraction y
sort en **deux booléens co-présents** — `diffraction` ⊕ `diffraction_sans_partage` — **jamais fondus**.
On ne soustrait pas, on **pointe**. → le différentiel Vigilante est un **pointeur** : *quel axe, quel
dépôt* divergent entre le vécu (Affectif) et le raisonné (Réflexif), jamais un scalaire d'écart. « Un
miroir tendu », pas un ratio (doctrine §4 ; §18 bis, « Le Lien », l'intrication).

**La ligne magnitude — magnitude = lumière, jamais chiffre.** LeCLG *a* des scalaires internes
(`emotional_charge`, `alliance`, 0-3), mais deux gardes tiennent, et la seconde est décisive : (a) ils
ne vivent qu'**au climat** — `aggregateClimate` ne lit que la métadonnée (émotion, sphère, horodatage),
agrège, anonymise, ne touche **jamais** le `fragment` ; (b) surtout, le climat les rend en **couleur,
pas en nombre** : *il montre la lumière (présence, distribution), grésille le nom* (chiffrement
phénoménologique, `extraction_leclg`). → **discipline alignée sur le §18 bis (« Continuité et Fragmentation — la lumière et l'ombre ») que tu viens
d'inscrire** : l'institutionnel est *montré, jamais chiffré* — « pas d'unité fragmentée à 40 %, mais le
clair-obscur ». La magnitude institutionnelle vit donc comme **intensité de lumière**, jamais comme
valeur stockée ou affichée (schéma, invariant 4 : aucun nombre hors dates ; §9 : pas de champ score).
Et le différentiel per-patient reste **localisation seule** (anti-fusion) — aucun scalaire, même
interne, ne le chiffre : la finesse même dé-anonymiserait. En un énoncé : **magnitude → lumière au
climat anonyme ; localisation → pointeur au trilobe per-patient ; nombre stocké ou affiché : nulle
part.**

---

## Le récit qui s'écrit — la méthode longitudinale (lue dans `server.ts`)

`server.ts` est là où LeCLG bâtit une **analyse de qualité à partir de matériel ponctuel régulier** :
une série de dépôts discrets (les cartes), lus dans le temps. C'est le mécanisme qui manquait à
l'Interne 1 pour le « récit qui s'écrit » (§18 bis, « Les trois strates — récolte, métabolisation, institutionnel »). Cinq mécaniques transférables :

1. **Une série d'unités distillées, jamais du brut re-concaténé.** Chaque dépôt ponctuel est réduit à
   une structure typée stable (la carte) ; les analyses lisent la *série de structures*, pas les
   conversations (non persistées). → CONTINUUM : la métabolisation lit la série de dépôts typés
   (domaine 2), pas des re-lectures du brut. Ton event-sourcing comme *matière d'analyse*.

2. **Sédimentation + relief, jamais une somme.** `EVAL_LIEN` range les fragments par sphère (teinte,
   intensité) **et** ajoute un `relief` — la « Structure Invisible », *« une analyse sobre résumant la
   circulation du vécu »*. Le relief lit une **circulation**, pas un empilement. → c'est exactement ta
   **trame de l'évolution** (§18 bis, « Les trois strates — récolte, métabolisation, institutionnel ») : le récit n'accumule pas les dépôts, il lit leur circulation.

3. **Étagement par temporalité — la couche lente produit le récit.** Les analyses tournent à des
   rythmes différents (`lien` par carte, `elan` ≥ 7 j, `matrice` ≥ 21 j), chaque plus lente lisant
   l'accumulé. La profondeur longitudinale vient du **lent qui lit le sédimenté**, pas d'un re-calcul à
   chaque dépôt. → c'est ton **compte-rendu aux moments clés** (§18 bis, « Les trois strates — récolte, métabolisation, institutionnel » : « se génère de cette
   continuité, sans tout ré-assembler à la main »). Le récit est la couche lente.

4. **Le bord avant = une question en suspens, jamais une conclusion.** `EVAL_ELAN` sort
   `{ mouvement, direction, question }` — *« la question qui vous travaille »*. La lecture
   longitudinale culmine en **question ouverte**, pas en pronostic. → *montrer sans conclure* dans le
   temps ; « laisser la personne écrire la suite » (§18 bis, « Les trois strates — récolte, métabolisation, institutionnel ») ; le projet reste hypothèse de travail,
   jamais contrat (schéma §4, `equilibre`).

5. **Au plus profond, ça reste tentatif — jamais « le sujet ».** La `matrice` est la couche la plus
   profonde (*« la structure fondamentale, ce dont on vient »*) — et même là, `schema_central` doit
   être *« une phrase telle que la personne elle-même pourrait la formuler — tentative, jamais un
   verdict, jamais une désignation à la troisième personne (« le sujet ») »*. → l'ontologie §19 tenue
   **là où la tentation de conclure est maximale** (§18 bis, « Les trois strates — récolte, métabolisation, institutionnel » le nomme). La strate qui synthétise le plus
   est la plus surveillée.

**La trouvaille d'ingénierie — un bloc-garde de sortie, partagé.** Chaque prompt d'analyse est suffixé
par `${REGISTRE_LAIQUE}`, un bloc unique imposant à *toute* sortie : (a) **REGISTRE** — les mots de la
personne, zéro jargon (« écris ce que le corps fait, dans ses mots à elle », pas « somatisation ») ;
(b) **POSTURE** — jamais « le sujet », jamais note de cas, tentatif, aucun verdict. → **CONTINUUM doit
avoir son propre registre-garde unique, suffixé à chaque eval** : mots du soignant, zéro jargon en
sortie, tentatif, aucun verdict sur le patient, *montre sans conclure*. Un seul bloc, jamais ré-écrit
par eval — DRY, discipline uniforme, et c'est la « langue du participant » de Sibeoni (recherche dans
les mots de la personne) opérationnalisée. C'est le locus-prompt de l'invariant 12 (schéma) : la
non-conclusion tenue par une garde partagée, pas par la vigilance de chaque prompt pris isolément.

**Le détecteur d'arrêt, déjà éprouvé.** `enrich_fragments` (point 2) lit *« à quel endroit les sessions
s'arrêtent souvent »* et le formule *« discret et neutre, sans le commenter »* (ex. « Arrêt fréquent
avant l'équilibre »). → c'est ton **« endroit où ça s'arrête souvent »** (le signal d'arrière-plan) et
ta **relance par l'absence** (§11) : un pointeur discret, jamais un reproche ni un constat d'échec. Le
mécanisme tourne déjà.

**⚠️ Divergence temporelle à tenir.** LeCLG chaîne aussi *dans le temps* : `metacognition` lit les
**sorties** de `lien` / `affect` / `elan`. La couche lente CONTINUUM (le compte-rendu) doit lire la
**série-source accumulée** (domaine 2), **pas** le contenu des projections rapides — sinon un trou
creusé dans une couche rapide se propage dans le récit. L'**étagement temporel** transfère ; le
**cascade de contenu** non (la divergence de l'Interne 2, portée sur l'axe du temps). Le schéma le tient
déjà : la plume lit 0-1-2, « chaque énoncé dérive d'au moins un dépôt » (§6.3).

**Note d'ingénierie — robustesse de la sortie structurée.** `geminiJSON` : JSON imposé, `thinking`
désactivé sur l'extraction (sinon il dévore le budget et tronque la sortie), réparation + retry borné à
backoff. → le « structurel = plancher » au niveau de l'appel : la sortie d'eval est un JSON typé, parsé
robustement. À reprendre tel quel côté ingénierie.

---

## Le verrou fermé — « Pertinence de quoi ? » (`methode_reflexivite`)

Le moteur ferme le verrou : **l'eval ne calcule jamais la pertinence.** Le `fragment` est extrait
verbatim (donc aucune sélection-de-pertinence sur les mots eux-mêmes) ; le chiffrement phénoménologique
*montre en déplaçant la lumière, grésille le nom* — l'angle est montré comme **absence**, jamais rangé
sur une norme. ⇒ pertinence = **l'angle mort rendu étrange**, jamais pertinence-à-une-norme. Confirmé,
pas conjecturé.

**Couverture-surprise = Vigilante, unifiée** (réponse #1). Un défaut de couverture *est* un
candidat-angle-mort remonté à la Vigilante — un seul geste épistémique, pas deux. Et *comment* on
« utilise reconnaissance + surprise sur le terrain » (ta gêne, légitime) : **on ne l'utilise pas comme
métrique — l'eval ne la mesure pas.** (Réponse #2, qui répond bien au #1.) L'eval **propose** un angle ;
la **reconnaissance + surprise est la validation du soignant dans la boucle** — « c'est exactement ça,
mais je ne l'avais jamais formulé comme ça » (Sibeoni 2020). Conséquence assumée : **l'eval ne signale
jamais seul une sous-couverture.** La norme reste l'humain, pas une statistique. Cohérent avec « témoin
pur : on la lit, on n'y dépose pas ».

---

## Le calibrage sur *ta* phénoménologie (le trou, défini par tes textes)

Un **trou phénoménologique** — ce que la couverture sémantique doit rattraper — n'est pas un thème
manquant, c'est une **texture aplatie**. Tes propres matériaux le définissent :

- **La texture-perte.** Sibeoni montre que l'intensité tient à *« ce que je ne peux plus faire »* et
  non *« ce que je ne peux pas faire »* — une perte, pas un déficit ; les échelles thématiques la
  ratent. Le trou-type : un vécu de perte présent dans plusieurs dépôts, qu'aucun lobe ne nomme.
- **La contradiction tenue.** Ta thèse tient l'**ambivalence du diagnostic** sans la résoudre
  (soulagement *et* peur — « cette ambivalence », C151) et le **paradoxe de l'aidant inclus-exclu**
  (« on vous dit vous êtes impliqué… mais on est tout seul », C120). Aplatir l'un des deux côtés = le
  trou. → la couverture sémantique **préserve la contradiction tenue** : c'est l'anti-fusion (§4)
  côté extraction.
- **Sujet = le soignant, jamais le patient** — et c'est **ta méthode** qui le fonde : ton IPSE
  interroge l'**aidant**, jamais le proche malade (notice : « votre proche TPL ne sera pas
  interrogé »). La vigie fait pareil : elle met en miroir le soignant, ne lit jamais l'intérieur du
  patient (montrer notre trace, §19).

⇒ Calibrage : la couverture cherche **perte, ambivalence tenue, angle mort** — pas une couverture de
thèmes. Test d'acceptation = reconnaissance + surprise, **sujet = le soignant**.

---

## Adjacent — deux arbitrages qui penchent, à confirmer (non bloquant)

`extraction_leclg.md` laissait deux arbitrages. Le moteur les oriente ; ils relèvent de la doctrine
vigie, pas des internes — notés sans être gravés :
1. **Patient-level** : reçoit l'ontologie §19 (montrer notre trace), **pas** le chiffrement
   (lecteur ≠ sujet). Penche confirmé.
2. **Climat** : lisible **par l'équipe comme son miroir**, jamais par l'institution comme tableau de
   bord (asymétrie hiérarchique, risque médico-mimétique). Penche confirmé.
