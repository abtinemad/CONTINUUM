# SIID — outil de pilotage clinique

> Document fondateur. État : brouillon de conception, avant première ligne de code.
> Rien ici n'est figé dans le marbre, mais tout ce qui suit a été tranché en discussion
> et sert de socle. Les points encore ouverts sont marqués **[à trancher]**.

---

## 0. En une phrase

Un instrument qui rend lisible, transmissible et partageable la trajectoire d'un
patient en SIID — **sans jamais interpréter à la place du soignant**. Il montre, il
ne conclut pas. Il tend un miroir, il ne rend pas de verdict.

---

## 1. Le geste que l'outil protège

Le SIID ne produit pas ses résultats (baisse de l'isolement, de la contention, de la
DMS, de l'absentéisme) parce que c'est un « dispositif ». Il les produit à cause d'un
geste clinique précis : **voir la demande réelle derrière la demande brute non
digérée, et simplifier le parcours en conséquence.** La demande brute est une
enveloppe ; le travail est de dégager ce qui est réellement demandé, avant que ça ne
se transforme en morcellement, en réhospitalisation, en contrainte.

Ce geste est aujourd'hui dans une tête (celle du psychiatre) et se perd avec son
attention. L'outil a une seule raison d'être : **sortir ce geste de la tête** — le
rendre déposable, transmissible, partageable — sans prétendre le remplacer.

Corollaire non négociable : l'outil n'automatise pas ce geste. Il en protège les
conditions. La lecture clinique reste humaine (voir §4, le sanctuaire).

---

## 2. La grille — colonne vertébrale

L'unité de l'outil n'est **pas l'acte**, c'est **le patient dans la durée**. Le journal
d'actes existant devient le substrat qui nourrit la ligne-patient ; il cesse d'être le
tableau.

La ligne-patient se lit selon six termes, dans cet ordre :

```
Situation → Clinique → Ressenti → Demande → Diffraction → Équilibre
   (S)         (C)        (R)        (D)       (Diff)        (É)
```

Ce n'est pas une invention : c'est la structure de *Regarder ensemble* (la troisième
partie, « La traversée » = S → R → D → Diff → É), plus la couche « Le regard »
(deuxième partie) qui donne le C. Les définitions ci-dessous sont calées sur le livre,
pas sur des formulations génériques.

### Situation — *« Partir de ce qui est là »*
Ce qui s'amène, le réel brut. Contexte, ce qui a mené à l'hospitalisation, conditions
de vie. On cite, on ne lisse pas.

### Clinique — *« Le regard » / « Reconnaître, pas étiqueter »*  — **SANCTUAIRE**
La lecture clinique : **le mécanisme qui traverse le patient**, jamais ce qu'il *est*.
On nomme un mécanisme (« la méfiance est la peur d'être repris »), on ne pose pas une
étiquette identitaire. Le diagnostic descend au rang de **fait tenu léger** — il n'est
pas la lecture. Ce champ n'est **jamais généré ni touché par la machine** : c'est le
geste du §1, il reste humain. C'est pourquoi il n'est pas une étape de la traversée
mais la posture qui la gouverne (dans le livre : « Le regard » précède « La traversée »).

### Ressenti — *« Descendre dans la sensation »*
Ce que la situation fait éprouver. **Trois positions distinctes, jamais fusionnées :**
- ressenti **patient**
- ressenti **équipe**
- ressenti **entourage**

L'écart entre les trois est un matériau, pas un bruit. Une position **vide est une
info** (voir §6). L'entourage vide chez un isolé = fait clinique, pas trou de saisie.

### Demande — *« La demande réelle »*
Pas la demande brute (l'enveloppe), mais la demande dégagée : digérée, transformée,
pensable. Se formule **depuis** le ressenti, pas avant. C'est ici que le geste du §1
s'inscrit. La carte peut porter les deux niveaux : surface / réelle.

### Diffraction — *« Le regard de l'autre »*
Le partage entre intervenants pour multiplier les angles sur la situation. **Différent
du ressenti** : le ressenti éprouve, la diffraction donne à voir depuis d'autres
positions. Les regards sont **posés côte à côte, non pour trancher — pour tendre un
miroir**. L'écart entre *ta* demande et ce que la diffraction fait remonter est
probablement le signal clinique le plus fin de l'outil. L'absence de diffraction est,
elle aussi, une info.

Note : au Collègue, la diffraction est rare et souvent à susciter (l'utilisateur est
seul). Au SIID, elle est le milieu natif (points quotidiens, réunions, partenaires) et
se **perd à l'oral** — la case la capte au lieu de la provoquer.

### Équilibre — *« L'équilibre qui respire »*
La direction qui a émergé — pas forcément une décision : une clarté, un relâchement, un
palier. « Ne rien faire » est un équilibre valide **s'il est construit**, pas s'il est
une sortie par défaut. Vide → se **nomme** (« pas stabilisé »), ne se cache pas.
Distingue le palier *assumé* du maintien *subi* : c'est le garde-fou contre
l'hospitalisme (le SIID qui devient un CMP-bis à domicile).

---

## 3. Intrication, pas séquence

Les six termes **ne sont pas des phases traversées l'une après l'autre.** Ils
coexistent. En particulier : la phase « projet/ouverture » travaille *dès* la
stabilisation, parfois avant la crise. Toute modélisation qui suppose 1 *puis* 2 est
fausse. La grille est six lectures **simultanées** d'un même moment.

---

## 4. Les deux couches + le sanctuaire

| Couche | Contenu | Qui produit | Machine ? |
|---|---|---|---|
| **Visible** (traversée) | S, R, D, Diff, É | équipe (dépose) | met en forme, ne conclut jamais |
| **Sanctuaire** (le regard) | C — lecture clinique | psychiatre uniquement | **jamais générée, jamais touchée** |
| **Factuelle** (machine) | faits du journal | machine | lit et remonte, **ne juge jamais** |

Le code couleur de la maquette encode cette répartition, et c'est structurel, pas
décoratif :
- **encre** = ce que l'équipe dépose
- **rouge** = main humaine, sanctuaire clinique (l'intouchable)
- **ardoise / mono** = machine, faits (jamais un jugement)

L'œil ne doit **jamais** confondre un fait avec un jugement, ni la machine avec le
soignant.

---

## 5. La plume (génération de synthèses)

La plume met en forme la carte en synthèse. **Deux registres, deux générateurs :**
- **synthèse équipe** — évaluation télégraphique, pour la réunion / le relai CMP ;
- **synthèse patient** — restitution qui lui rend sa trajectoire lisible, autre
  registre (objet médiateur ; ce qui se dit *sur* le patient ≠ ce qu'on remet *au*
  patient).

Discipline de la plume (transposée du prompt de *Le collègue*) :
- **montre sans expliquer** — dit « voilà ce qui s'est passé, dans cet ordre » et
  s'arrête là où commencerait le « parce que » ;
- **cite, ne reformule pas au propre** — garde les mots déposés ;
- **garde l'écart, ne le résout pas** — si demande et diffraction divergent, montre
  les deux ;
- **le vide reste vide** — ne comble pas une case blanche par du vraisemblable ;
- **ne génère jamais le champ Clinique** — elle le transcrit ;
- **refuse de se générer sous un seuil de matière** — pas assez d'éléments → « pas
  assez déposé pour restituer un fil », jamais broder. (Le manque de données est
  précisément ce qui pousse un modèle à inventer.)

Garde-fou de fond : une belle déduction sur une mauvaise perception = une erreur
clinique *bien écrite*, plus dangereuse qu'une erreur maladroite. La qualité de la
synthèse dépend entièrement de la qualité des prémisses déposées. D'où §8.

---

## 6. Vide nommé ≠ non renseigné

Deux états à ne **jamais** confondre dans le modèle de données :
- **vide-info** : la case est vide *et c'est un fait* (« aucun tiers — patient isolé »).
  À afficher comme un événement typographié, pas comme un blanc.
- **non-renseigné** : un travail en attente.

Écraser le premier sous le second (« à remplir ») détruit une information clinique
précieuse. Réf. code : le `diffraction_sans_partage` de *Le collègue* — le vide comme
champ de première classe.

---

## 7. Le Collègue au SIID

Le moteur de *Le collègue* est re-sujetté : là il lit la pensée de l'utilisateur, ici
la trajectoire du patient. **Bornes strictes :**
- **Pour le soignant, jamais le patient.** Ce n'est **pas un outil de soin**. Pas de
  soin délivré par IA, pas de mode crise, pas de responsabilité de prescripteur
  engagée. Le sujet du Collègue = le soignant bloqué sur un cas (« je sais pas quoi
  faire de lui »), à qui il aide à dégager *sa* demande floue à lui — supervision, pas
  thérapie.
- **Générateur de synthèses** (la plume, §5) — s'il a assez de données, sans
  interprétation (= montre sans expliquer).

Ce qui reste **hors** de l'outil, explicitement : le Collègue-interlocuteur du patient.
Si un jour envisagé, c'est un autre régime (dispositif médical, RGPD données de santé,
responsabilité) — pas un simple toggle.

---

## 8. Principe d'enseignement : implicite, par la forme

L'outil doit **enseigner la grille de lecture — implicitement, par sa forme, jamais en
apportant des réponses.** C'est le point de conception le plus important.

- La **structure** enseigne ; le **contenu** jamais. Aucun tooltip « voici comment
  penser », aucune définition d'aide, aucun exemple prescriptif.
- On apprend la grille en **étant obligé de la remplir** — comme on apprend une langue
  en faisant des phrases, pas en lisant la grammaire. *Teaching-by-doing*, jamais
  *teaching-by-prescribing*.
- Le champ vide oblige à chercher. Le sanctuaire apprend que la lecture est tienne.
  L'écart de diffraction apprend à ne pas trancher (il refuse structurellement de
  trancher). La plume apprend la retenue en la pratiquant devant l'utilisateur.
- Réf. *Le collègue* : « la conversation suit cet ordre sans jamais le rendre
  explicite, sans jamais annoncer les étapes ». On traverse la grille sans savoir
  qu'elle existe.

**Exigence dure qui en découle :** si la grille enseigne par sa forme, la forme doit
être **muette et irréprochable**. Le jour où un champ « a besoin » d'un texte
d'explication pour être compris, c'est **le champ qui est mal fait** — on le retravaille
jusqu'à ce qu'il se passe de glose. L'outil n'explique jamais sa propre grille ; il la
fait pratiquer. (Réf. *socle de clarté* : les vérités fixes sont montrées, pas
générées ni expliquées.)

**Pourquoi ça compte (ancrage terrain).** La formation a été vidée de sa grammaire
clinique (réduction massive de la psychopathologie / psychodynamique depuis le diplôme
unique de 1992) ; la psychiatrie publique est décrite comme « en dépression »,
soignants « usés et désabusés » ; le CCNE parle de crise « d'une ampleur inédite ».
Une boussole ne sert pas aux sous-dotés, elle sert aux **désorientés**. L'outil
enseigne parce que l'école a cessé de le faire — et c'est *ça* qui protège les
prémisses (§5).

**Le piège à éviter absolument.** Ce qui a ruiné la clinique, c'est déjà « un outil qui
dirige les soins » : le protocole de groupe, devenu « ininterrogeable », « pour qu'il
n'y ait plus de questions ». Un outil qui enseigne en **prescrivant** devient un
protocole de plus et aggrave la maladie. La grille échappe à ça parce qu'elle enseigne
une **opération** (cherche la demande sous l'enveloppe, tiens l'écart, nomme le vide) et
**ouvre** la question à chaque champ, là où le protocole ferme. L'un dit quoi voir ;
l'autre apprend à voir.

---

## 9. v1 vs v2 — ne pas mélanger

- **v1 — outil interne.** Pour le psychiatre + Anthony. **Muet, sans pédagogie** : ils
  savent déjà regarder. Objectif : la grille qui *marche*, taillée pour leur geste,
  gain de « de tête ». C'est ce qu'on construit d'abord. Il peut être laid. Il doit
  marcher.
- **v2 — produit diffusable.** Pour les autres services, les désorientés. La fonction
  d'enseignement (§8) s'active ici — et elle est **gratuite** : rien à construire, elle
  est un *effet de la justesse de la forme*. Si la grille est assez juste, la remplir
  *est* apprendre à regarder.

Règle : ne pas sur-concevoir la v1 en pensant à la v2. On ne vend pas une méthode qu'on
n'a pas d'abord fait tourner chez soi. (C'est aussi la logique de la tribune : étendre
ce qui a fait ses preuves dans le secteur, pas plaquer un dispositif d'en haut.)

---

## 10. Modèle de données (esquisse)

### Ligne-patient (unité)
- **identifiant unique** — **non négociable**. Patient-centré + saisie par plusieurs +
  lecture par l'équipe ⇒ le prénom ne suffit pas (homonymes : plusieurs « Laurent »,
  « Mohamed »). IPP obligatoire = premier champ, condition d'existence de
  l'architecture. **L'identité nominative vit aux extrémités** (saisie, sortie) ; le
  moteur tourne sur un code stable. Bon design *et* bonne protection : découpler
  l'identité de l'analyse.
- Champs statiques (posés à l'entrée, servent de paramètres) : type de SIID, date
  d'entrée, statut (actif / relai en cours / clôturé)…
- Six champs de la grille (§2), dont **Clinique = sanctuaire**.
- Ressenti = **trois sous-champs** (patient / équipe / entourage), chacun avec état
  vide-info distinct de non-renseigné.
- Diffraction = regards attribués, gardés contrastés ; `sans_partage` booléen.

### Typage SIID (paramètre de lecture, pas verdict)
- **SIID aigu** (sortie d'hospitalisation),
- **SIID NAP** (difficultés d'observance),
- **SIID chronique** (stable mais fragile — psychose chronique en déni, isolement,
  perte d'autonomie).

Rythme attendu : **adapté à la clinique**, pas de seuil unique. Vise une diffraction
progressive vers les structures annexes, ou — si pas de structure et peu d'autonomie —
un rythme régulier mais espacé (rompre l'isolement sans surpsychiatriser). Équilibre
fin entre hospitalisme et abandon.

### Couche factuelle (machine — lit le journal, ne juge jamais)
Remonte des **faits**, jamais des jugements :
- dernier contact (silence : « il y a N jours ») ;
- glissement de modalité (domicile → téléphone) ;
- actes non aboutis qui s'accumulent ;
- NAP due / en retard.
Elle ne dit jamais « il décroche » (interprétation = humain). Elle dit « dernier
contact il y a 23 j » (fait). Elle **couvre l'angle mort du réseau** : l'isolé dont
*rien n'arrive*, que le périmètre humain ne peut pas signaler.

Ce que la couche factuelle **ne fait pas** : scorer l'alliance, lire un motif clinique,
juger. Ça, c'est le geste humain (§1), le sanctuaire.

---

## 11. Les trois moments (usage)

Trois vues d'un même fichier, filtrées :
- **Lundi matin (intra)** — pose des indications SIID sur mise en commun d'équipe.
  Crée la ligne-patient (statiques). L'après-midi : alliance avec ceux-là. **[à
  trancher]** : le minimum qui « voyage » l'après-midi ≠ tout le dossier de crise (ne
  pas précharger au point de voler au patient le début de son histoire ; garder en
  réserve ce qui appartient à ce qu'il dévoilera).
- **Mardi matin (synthèses)** — les 4-5 cas en bascule / bloqués. La synthèse patient
  = support de séance.
- **Trimestriel (revue)** — continuer / clôturer, chaque patient. Le « métronome »
  existe déjà (réunion trimestrielle documentée) ; l'outil le *nourrit*, ne le
  réinvente pas.

Priorité de prototypage : **la carte d'abord** (la forme juste), avant la saisie.
Ensuite, la vue lundi (point d'entrée : pas de ligne-patient sans indication posée).

---

## 12. Décisions arrêtées

- Unité = patient, pas acte.
- Grille = **S / C / R / Demande / Diffraction / É**, intriquée (pas séquentielle).
- **Clinique = sanctuaire humain**, jamais générée ni touchée par la machine.
- Ressenti = **trois positions** (patient / équipe / entourage), non fusionnées.
- Diffraction ≠ ressenti (partage inter-intervenants, angles multiples, miroir).
- **Vide nommé** ≠ non-renseigné ; l'absence est une info.
- Plume = **montre sans expliquer**, cite, garde l'écart, refuse sous seuil.
- Couche silencieuse = **factuelle seulement** (remonte des faits, ne juge pas) ; la
  lecture clinique reste humaine (**version stricte**).
- Collègue = **pour le soignant, jamais le patient** ; + générateur de synthèses.
- Enseignement = **implicite par la forme**, jamais par des réponses ; muet.
- **v1 interne muet** d'abord ; enseignement = effet gratuit de la justesse en v2.
- **IPP obligatoire** ; identité aux extrémités, moteur sur pseudonyme.

---

## 13. Garde-fous / conformité

- **Données de santé nominatives.** Responsable de traitement = l'établissement / le
  praticien. Pseudonymisation par défaut ; l'identité réelle ne quitte pas le poste.
  Le cœur analytique tourne sur un code, jamais sur le nom.
- L'outil **n'est pas un dispositif de soin** (Collègue borné au soignant). Toute
  ouverture au patient changerait de régime réglementaire.
- Aucune synthèse générée n'est un acte médical : elle **met en forme**, ne conclut
  pas ; la décision reste humaine et, si besoin, médicale.

---

## 14. Filiation

- **`Regarder ensemble`** (le livre) = **le mode d'emploi de la grille**. La traversée
  (ch. 14-18) est la colonne vertébrale ; « Le regard » (ch. 10-13) est le sanctuaire
  Clinique ; « La continuité qui digère » / « Ce que le morcellement détruit » est la
  thèse. Le livre n'est pas à côté de l'outil : il en est la doc.
- **`Le collègue`** (l'app) = le **moteur re-sujetté** (grille implicite, lecture par
  l'absence, gating par l'alliance, socle de clarté, plume qui montre sans expliquer).
- Lignage esthétique **`Encre`** (noir / rouge / serif) : le rouge réservé à
  l'intouchable (sanctuaire humain).

---

## 15. Questions ouvertes **[à trancher]**

1. **Enseignement — pour qui ?** L'IDE/AS qui *dépose* dans la traversée (apprentissage
   rapide) — ou aussi l'interne / jeune psychiatre à qui manque le *regard* clinique
   lui-même (le sanctuaire, non enseignable par prescription, au mieux entraînable) ?
2. **Ce qui voyage le lundi** — quel minimum sûr, sans précharger le dossier de crise ?
3. **Saisie** — quels champs se remplissent seuls depuis le journal, lesquels coûtent un
   geste ? (Le vrai test de survie de l'outil.)
4. **Synthèse patient** — registre et cadre exacts (objet remis au patient).

---

## 16. Prochaine étape

Refaire la maquette de la **carte-patient** avec les calages du livre (Clinique = le
mécanisme qui traverse, pas l'étiquette ; Demande = la réelle sous l'enveloppe ;
Diffraction = regards côte à côte pour tendre un miroir), en s'assurant qu'**aucun champ
n'a besoin d'un mot d'explication** pour se comprendre. Si un champ réclame une glose,
le retravailler jusqu'à ce qu'il se taise.
