# SIID — outil de pilotage clinique

> **Servir la continuité du parcours, contre la fragmentation de l'esprit.**

> Document fondateur. État : brouillon de conception, avant première ligne de code.
> Tout ce qui suit a été tranché en discussion et sert de socle. Les points encore
> ouverts sont marqués **[à trancher]**.

---

## 0. En une phrase

Un instrument au service d'un seul geste : **ne jamais lâcher le fil du patient** —
anticiper la rupture de continuité, aider à l'éviter, et quand elle survient,
accompagner vers une continuité nouvelle.

L'outil **aide à** faire ces gestes. Il ne les fait pas. Il rend visible où est le
risque, fait remonter le silence, garde la mémoire des liens — pour que le soignant
travaille la rupture sans la reconstituer de tête à chaque fois. Il protège les
conditions du geste ; il n'est pas le geste. Le jour où l'on écrit « l'appli anticipe
la rupture », on a refabriqué le protocole qui décide à la place du soignant.

---

## 1. Le geste que l'outil protège

Le SIID ne produit pas ses résultats (baisse de l'isolement, de la contention, de la
DMS, de l'absentéisme) parce que c'est un « dispositif ». Il les produit à cause d'un
geste clinique précis : **voir la demande réelle derrière la demande brute non
digérée, et simplifier le parcours en conséquence.** La demande brute est une
enveloppe ; le travail est de dégager ce qui est réellement demandé, avant que ça ne
se transforme en morcellement, en réhospitalisation, en contrainte.

Ce geste est aujourd'hui dans une tête et se perd avec l'attention. L'outil a une seule
raison d'être : **sortir ce geste de la tête** — le rendre déposable, transmissible,
partageable — sans prétendre le remplacer. La lecture clinique reste humaine (voir §4,
le sanctuaire).

### La justesse se scinde en deux moitiés

Distinction structurante, valable partout dans l'outil :

- **La perception** — faire émerger la gestalt juste à partir de mots crus qui,
  isolés, ne veulent rien dire (« déni », « agressif », « méfiant » rapportés par les
  urgences, les pompiers, la famille). Par *émergence d'analogie*, avec l'expérience,
  on sait tout de suite dans quelle situation on est — souvent **contre** la lecture
  moyenne. Cette moitié est **humaine, sanctuaire, jamais la machine**.
- **La déduction** — une fois la perception posée, en tirer la conduite (« si déni +
  contrainte, alors desserrer pour tenir le lien »). Cette moitié est **mécanisable** :
  la plume la rejoue à l'identique.

Danger central : la machine *a* les mots crus (ils sont dans le dossier) et peut les
**rassembler**. Mais si elle tente l'émergence, elle produit le **cliché statistique** —
la lecture moyenne, celle qui mène au cadre serré, à la contrainte : exactement l'erreur
que le SIID corrige. **Interdit dur : la machine ne suggère jamais de lecture clinique,
même quand les mots crus la rendent « évidente ». L'évidence est le piège.**

---

## 2. La grille — colonne vertébrale

L'unité n'est **pas l'acte**, c'est **le patient dans la durée**. Le journal d'actes
existant devient le substrat qui nourrit la ligne-patient ; il cesse d'être le tableau.

```
Situation → Clinique → Ressenti → Demande → Diffraction → Équilibre
   (S)         (C)        (R)        (D)       (Diff)        (É)
```

Structure de *Regarder ensemble* : la troisième partie « La traversée » = S → R → D →
Diff → É ; la deuxième partie « Le regard » donne le C. Les six termes sont
**intriqués, pas séquentiels** : ils coexistent, la sortie se travaille dès l'entrée.
Toute modélisation qui suppose 1 *puis* 2 est fausse.

### Situation — *« Partir de ce qui est là »*
Le réel brut. Contexte, motif d'hospitalisation, conditions de vie. On cite, on ne
lisse pas.

### Clinique — *« Le regard » / « Reconnaître, pas étiqueter »* — **SANCTUAIRE**
La lecture clinique : **le mécanisme qui traverse le patient**, jamais ce qu'il *est*.
On nomme un mécanisme (« la méfiance est la peur d'être repris »), pas une étiquette
identitaire. Le diagnostic descend au rang de **fait tenu léger** — pas la lecture.
Registre **hypothétique, tenu, daté** — jamais un verdict, même envers le clinicien
(sinon on brûle la temporalité du patient : une vision n'a de valeur que si on lui
donne vie, en respectant le rythme de chacun). Champ **jamais généré ni touché par la
machine**.

**Clinique dédoublée :** une lecture **médecin** (prioritaire) + une lecture **équipe
soignante** (secondaire). Les deux restent humaines. Voir §4 pour la gestion de la
discordance.

### Ressenti — *« Descendre dans la sensation »*
Ce que la situation fait éprouver. **Trois positions distinctes, jamais fusionnées :**
patient / équipe / entourage. L'écart entre les trois est un matériau. Une position
**vide est une info** (§6) : l'entourage vide chez un isolé = fait clinique, pas trou
de saisie.

### Demande — *« La demande réelle »*
Pas la demande brute (l'enveloppe), mais la demande dégagée : digérée, pensable. Se
formule **depuis** le ressenti. C'est ici que s'inscrit le geste du §1. La carte peut
porter les deux niveaux : surface / réelle.

### Diffraction — *« Le regard de l'autre »*
Le partage entre intervenants pour multiplier les angles. **Différent du ressenti** :
le ressenti éprouve, la diffraction donne à voir depuis d'autres positions. Regards
**posés côte à côte, non pour trancher — pour tendre un miroir**. L'écart entre *ta*
demande et ce que la diffraction fait remonter est probablement le signal clinique le
plus fin de l'outil. L'absence de diffraction est aussi une info.

Au Collègue, la diffraction est rare, à susciter (l'utilisateur est seul). Au SIID,
c'est le **milieu natif** (points quotidiens, réunions, partenaires) qui **se perd à
l'oral** — la case le capte au lieu de le provoquer.

### Équilibre — *« L'équilibre qui respire »*
Pas « c'est cousu ». **« Les liens tiennent souples, aucun élastique n'a claqué, ceux
qui étaient trop tendus ont été reposés à temps — et rien ne s'est rompu dans
l'abandon. »** L'équilibre peut inclure une **déliaison réussie** (un lien desserré,
détendu, accompagné). « Ne rien lâcher » ≠ « tout garder » : ça veut dire *aucun fil ne
se défait sans qu'on l'accompagne*. « Ne rien faire » / « attendre » sont des équilibres
valides **s'ils sont construits**, pas des sorties par défaut.

**Clôturer un SIID n'est jamais une coupe.** Ce n'est pas *finir* le suivi — c'est
renouer le fil ailleurs (CMP, autonomie, semi-autonomie). L'autonomie du patient n'est
pas la fin du lien, c'est son fruit (« la compétence n'est pas de prêter, c'est de
reprendre »). L'outil ne présente jamais une clôture comme une fin.

---

## 3. Les deux couches + le sanctuaire

| Couche | Contenu | Qui produit | Machine ? |
|---|---|---|---|
| **Visible** (traversée) | S, R, D, Diff, É | équipe (dépose) | met en forme, ne conclut jamais |
| **Sanctuaire** (le regard) | C — lecture clinique | psychiatre (+ équipe, secondaire) | **jamais générée, jamais touchée** |
| **Factuelle** (machine) | faits du journal | machine | lit et remonte, **ne juge jamais** |

Code couleur, structurel et non décoratif :
- **encre** = ce que l'équipe dépose ;
- **rouge** = main humaine, sanctuaire clinique (l'intouchable) ;
- **ardoise / mono** = machine, faits (jamais un jugement).

L'œil ne doit **jamais** confondre un fait avec un jugement, ni la machine avec le
soignant.

---

## 4. Discordance médecin / équipe

La lecture médecin prime ; celle de l'équipe est secondaire mais visible. Détecter la
divergence **sans l'interpréter** (interpréter le fond franchirait le sanctuaire) :

- **(a) Juxtaposition attribuée, toujours.** Les deux lectures côte à côte, sources
  nommées. L'écart devient visible à l'œil humain. Zéro interprétation machine. *(C'est
  la mécanique de l'« écart tenu, non résolu » de la maquette : on ne détecte pas, on
  montre, et l'écart saute aux yeux ; on renvoie la résolution à la réunion, pas à la
  carte.)*
- **(b) Balise grossière structurée.** Chaque partie pose un marqueur simple (ex. *tient
  / fragile / décroche*). L'outil compare **les balises, pas le sens**, et signale quand
  elles diffèrent. La clinique libre reste sanctuarisée.
- **(c) Hypothèses plurielles de tendance** — *si assez de données*. L'outil peut
  ouvrir : « des écarts comme celui-là ont souvent tenu à : une info que l'un avait et
  pas l'autre / deux moments différents du patient / deux places dans la relation ».
  **Toujours plusieurs, jamais une.** Une hypothèse seule est une interprétation
  déguisée ; trois qui se contredisent restent une ouverture.

Rejeté : **(d) comparaison sémantique par modèle** — franchit le sanctuaire.

« Écart tenu, à travailler en réunion » — jamais tranché dans la carte.

---

## 5. La plume (génération de synthèses)

Deux registres, deux générateurs : **synthèse équipe** (télégraphique, pour la réunion /
le relai) et **synthèse patient** (restitution, objet médiateur — ce qu'on dit *sur* le
patient ≠ ce qu'on remet *au* patient).

Discipline (transposée du prompt de *Le collègue*) :
- **montre sans expliquer** — dit « voilà ce qui s'est passé, dans cet ordre » et
  s'arrête là où commencerait le « parce que » ;
- **cite, ne reformule pas au propre** — garde les mots déposés ;
- **garde l'écart, ne le résout pas** ;
- **le vide reste vide** ;
- **ne génère jamais la Clinique** — elle la transcrit ;
- **refuse de se générer sous un seuil de matière** — « pas assez déposé pour restituer
  un fil », jamais broder.

Garde-fou : une belle déduction sur une mauvaise perception = une **erreur clinique bien
écrite**, plus dangereuse qu'une erreur maladroite. La qualité de la synthèse dépend
entièrement de la qualité des prémisses déposées → §8, §1.

---

## 6. Vide nommé ≠ non renseigné

Trois états, jamais deux :
- **vide-info** : la case est vide *et c'est un fait* (« aucun tiers — patient isolé »).
  À afficher comme un événement typographié, pas comme un blanc.
- **non-renseigné** : un travail en attente.
- (rempli.)

Écraser le premier sous le second (« à remplir ») détruit une information clinique.
Réf. code : `diffraction_sans_partage` de *Le collègue* — le vide comme champ de
première classe.

---

## 7. Le Collègue au SIID

Le moteur de *Le collègue* re-sujetté : ici il lit la trajectoire du patient, pas la
pensée de l'utilisateur. **Bornes strictes :**
- **Pour le soignant, jamais le patient.** Ce n'est **pas un outil de soin**. Pas de
  soin délivré par IA, pas de mode crise, pas de responsabilité de prescripteur. Sujet =
  le soignant bloqué sur un cas (« je sais pas quoi faire de lui »), à qui il aide à
  dégager *sa* demande floue — supervision, pas thérapie.
- **Générateur de synthèses** (la plume, §5), sans interprétation (montre sans
  expliquer).

Hors périmètre, explicitement : le Collègue-interlocuteur du patient. Si un jour
envisagé → autre régime (dispositif médical, RGPD données de santé, responsabilité), pas
un simple toggle.

---

## 8. Enseignement : implicite, par la forme — avec des indices qui ouvrent

L'outil **enseigne la grille de lecture — implicitement, par sa forme, jamais en
apportant des réponses.**

- La **structure** enseigne ; le **contenu** jamais. On apprend en **remplissant** —
  comme on apprend une langue en faisant des phrases. *Teaching-by-doing*, jamais
  *teaching-by-prescribing*. Réf. *Le collègue* : « la conversation suit cet ordre sans
  jamais le rendre explicite ». On traverse la grille sans savoir qu'elle existe. En
  l'utilisant, elle **simplifie** — et c'est cette simplification qui s'apprend, toute
  seule. Pas un programme : un effet.

### Les indices — permis, à condition qu'ils ouvrent

L'outil **peut** donner des indices : ils stimulent l'imagination, laissent l'autre
prendre son chemin, orientent la **posture** du soignant sans projeter sur le **contenu**
du patient. Le discriminant n'est pas *indice / silence*, c'est :

> **L'indice ouvre un geste ; il ne livre jamais une conclusion.**
> « As-tu regardé ce que l'entourage en dit ? » ouvre. « Ce patient décroche » ferme.

Règle généralisée à **tous les champs** : quand il y a assez de matière, l'outil peut
proposer des **hypothèses de tendance** — jamais de l'interprétation, de l'hypothèse qui
montre et stimule. **Toujours plurielles, jamais une seule** (une piste seule = une
interprétation déguisée). Plusieurs, ou le silence.

### La forme doit être muette sur elle-même

Si la grille enseigne par sa forme, la forme doit être **irréprochable et muette**.
L'outil n'explique **jamais** sa propre grille ; il la fait pratiquer. Le jour où un
champ « a besoin » d'un texte d'aide pour être compris, **c'est le champ qui est mal
fait** — on le retravaille jusqu'à ce qu'il se passe de glose. (Réf. *socle de clarté* :
les vérités fixes sont montrées, pas expliquées.)

### Pourquoi (ancrage terrain)

La formation a été vidée de sa grammaire clinique (réduction massive de la
psychopathologie / psychodynamique depuis le diplôme unique de 1992) ; la psychiatrie
publique est décrite comme « en dépression », soignants « usés et désabusés » ; le CCNE
parle de crise « d'une ampleur inédite ». Une boussole sert aux **désorientés**. L'outil
enseigne parce que l'école a cessé de le faire — et c'est ça qui **protège les
prémisses** (§5).

### Le piège à éviter

Ce qui a ruiné la clinique, c'est déjà « un outil qui dirige les soins » : le protocole
de groupe, devenu *ininterrogeable*, « pour qu'il n'y ait plus de questions ». Un outil
qui enseigne en **prescrivant** devient un protocole de plus. La grille échappe parce
qu'elle enseigne une **opération** (cherche la demande sous l'enveloppe, tiens l'écart,
nomme le vide) et **ouvre** la question à chaque champ. L'un dit quoi voir ; l'autre
apprend à voir.

Note de posture : c'est une **contre-lecture**. Le réflexe du terrain *célèbre la coupe*
(la réponse qui tranche, la solution qui clôt). L'outil dit l'inverse, à des gens formés
à vouloir la lame. L'enseignement travaille contre un réflexe, pas contre une ignorance.

---

## 9. Base de tendances

Base **vivante**, alimentée par les vrais chemins de l'équipe au fil du temps (pas une
moyenne statique = un cliché). Elle apprend *votre* façon de dévier, pas la moyenne de
la psychiatrie française.

- **Tirée, jamais poussée.** L'équipe la sollicite quand elle sèche sur un cas complexe ;
  elle ne s'affiche jamais d'elle-même. **Une bibliothèque, pas un panneau publicitaire.**
- **Des chemins, pas des lectures.** Elle stocke « dans une situation où revenaient ces
  mots, voici ce qui a été *tenté*, et ce que ça a donné » — au pluriel, échecs compris.
  Jamais « profil X → conclusion Y à valider ».
- **Des tendances, pas une finitude.** Une tendance penche sans enfermer et laisse la
  place au cas qui dévie (les cas qui dévient = les vôtres). Elle **élargit** le champ des
  possibles, ne le **rétrécit** jamais vers une lecture.

Réf. livre : l'intermède « Des gestes — des exemples, pas des règles » est la maquette de
ce que cette base doit contenir.

---

## 10. Règle de conception générale : structure fixe, contenu libre

**Les contenants sont posés une fois et guident le regard ; ce qu'on met dedans est
toujours libre, jamais une liste à cocher.** C'est ce qui rend l'outil guidant sans être
une checklist, vivant sans être un formulaire.

Critère de partage :
> **Case pour ce qui se coche (un fait est là ou pas). Prose pour ce qui se pense (un
> pourquoi ne se coche pas).** Dès qu'un champ demande un jugement, il sort de la
> checklist ; dès qu'il demande un fait, il y entre.

---

## 11. La vue lundi (indication + intake)

Point d'entrée : **pas de ligne-patient sans indication posée.** Le matin en intra, sur
mise en commun d'équipe. L'après-midi : alliance avec les patients retenus.

Composition (structure fixe, contenu libre) :

1. **Le paquet** — la machine **rassemble** les mots crus épars (dossier urgences,
   rapport pompiers, ce que la famille a dit, mots de l'équipe) et les présente
   ensemble. Elle rassemble ; elle ne fait **pas** émerger la lecture (§1).

2. **Ressources internes / externes** — **deux zones libres**, pas des cases par item.
   Des **amorces en gris** montrent le genre de chose à chercher (internes : autonomie,
   se rend seul aux rdv, gère son traitement — externes : entourage, travail, IDEL,
   SAMSAH, psy libéral). La **catégorie guide, l'item ne s'impose pas** : on inventorie
   les ressources réelles de *ce* patient, pas d'un patient théorique. Le vide se nomme
   (« vit seul, rien » ≠ zone non regardée).

3. **Le « pourquoi SIID »** — **prose libre**, jamais une case. C'est le début de la
   digestion de la demande. En **latence** dessous, les six portes de rupture (voir
   §12) : l'outil range en silence ce que la prose touche, et **relance par l'absence**
   sur ce qui n'a pas été touché — une fois, sous forme de question qui ouvre, jamais un
   champ qui ordonne.

4. **La digestion** — SIID ou pas. **Sanctuaire.** L'outil a tendu les faits ; il ne
   conclut pas.

---

## 12. Critères d'indication SIID

L'indication ne se pose pas sur un diagnostic ni un profil, mais sur un **pronostic de
rupture** : *estime-t-on que la sortie d'hospitalisation va créer un trou dans la
continuité de prise en charge ?* La question du lundi n'est pas « quel profil ? » mais
**« où est le risque de rupture, et pourquoi ? »** — ce qui est la thèse même de la
tribune.

Les six portes du trou de continuité (structure latente du champ « pourquoi », jamais
une checklist affichée) :

1. pas d'alliance (le lien n'a pas pu se faire) ;
2. hospitalisation traumatique ou sous contrainte ;
3. anosognosie ;
4. non-observance du traitement ;
5. pas d'entourage pour accompagner vers les soins ;
6. entourage présent mais trop inquiet / épuisé pour tenir.

Le SIID crée une **alliance au long cours** (avec la manière de faire de l'équipe) qui
rouvre ensuite vers les structures classiques (CMP, reprise de la vie) — mais avec, cette
fois, une alliance avec les soins. But : accompagner progressivement vers l'**autonomie
ou la semi-autonomie**, avec des ressources extérieures.

Collecte des signaux de rupture = l'équipe (documentable par un soignant, une secrétaire
zélée : mots crus du dossier). Lecture (SIID ou pas) = le psychiatre.

---

## 13. Ressources externes = les liens à travailler

Ce ne sont **pas** des données d'info sur le patient. Ce sont **les liens qu'on
accompagne** — les mains vers lesquelles on tisse la continuité, pendant et après le
SIID. Le champ tient **la mémoire d'avant *et* le regard vers l'avant** ensemble (séparer
passé et futur, c'est déjà morceler).

- **Double fonction, même donnée.** À l'indication (lundi) : mesure le **risque de
  rupture** (peu de mains = trou probable = SIID plus indiqué). À l'équilibre : devient
  le **support de la continuité nouvelle** (ces mains sont celles vers qui on recoud au
  relais). La même donnée sert d'abord à *mesurer* la rupture, puis à la *réparer*.
- **Champ dynamique.** Il s'enrichit à mesure qu'on tisse (un SAMSAH activé en cours de
  route, une sœur qui reprend contact, un psy libéral trouvé pour le relais).
- **Jamais de signe fixe.** Ni « + » ni « − », ni pastille verte/rouge. Un lien n'a pas
  une *valeur* (bon/mauvais), il a une **tension** qui bouge : trop tendu, détendu, juste.
  Le registre n'est pas moral (bon/mauvais chef), il est **élastique** : savoir reposer
  un lien trop tendu **avant qu'il ne craque et ne revienne dans la figure**. Cette
  lecture de la tension est clinique → sanctuaire ; l'outil garde la trace du lien, il ne
  lui met pas de signe.
- **Liaisons ET déliaisons accompagnées.** Avec certaines mains on coud ; avec d'autres,
  non ; avec d'autres, il faut détendre avant de recoudre ailleurs. **Découdre accompagné
  ≠ rupture subie.** La continuité n'est pas « garder tous les liens » — c'est
  qu'*aucun lien ne se défasse sans qu'un autre se noue*.
- **Exception : la perversité.** Il existe des systèmes structurellement destructeurs
  (pervers) où il faut vraiment défaire. Mais c'est l'**exception**, lue au cas par cas
  dans le sanctuaire — **jamais outillée en routine** (99 fois sur 100, « toxique »
  serait un lien tendu mal lu).
- **À cheval sur la Diffraction.** Une main est aussi un regard (l'IDEL voit le patient
  chaque matin). Ressources externes et diffraction partagent des acteurs ; l'outil doit
  permettre de passer de l'un à l'autre (cette personne est une ressource *et* un angle).
- **Pas un CRM de partenaires.** La ressource vit dans la trajectoire d'*un* patient, pas
  dans un référentiel de structures à maintenir. Sinon on redevient un logiciel de
  coordination gestionnaire (voir §14).

---

## 14. Articulation / distinction avec le case management

Le case management (mode actuel) coordonne soins et services pour des patients à besoins
multiples, vers un accompagnement progressif dans le milieu de vie ordinaire — proche de
la cible du SIID. Le SIID **s'y articule** (accompagnement vers autonomie/semi-autonomie
avec ressources extérieures) **mais s'en distingue** :

> Le case management travaille la **coordination**. Le SIID travaille l'**alliance** —
> et il est **en amont** : il fabrique le lien sans lequel aucune coordination ne tient.

Piège à éviter : devenir la version **gestionnaire** du case management (un CRM de
partenaires, un logiciel de coordination). L'outil produit d'abord de l'alliance, pas de
la logistique.

---

## 15. Modèle de données (esquisse)

### Ligne-patient (unité)
- **Identifiant unique (IPP)** — **non négociable**. Patient-centré + saisie par
  plusieurs + lecture par l'équipe ⇒ le prénom ne suffit pas (homonymes).
  **L'identité nominative vit aux extrémités** (saisie, sortie) ; le moteur tourne sur un
  code stable. Bon design *et* protection : découpler l'identité de l'analyse.
- Statiques (posés à l'entrée, servent de paramètres) : type de SIID, date d'entrée,
  statut (actif / relai en cours / clôturé).
- Six champs de la grille (§2), dont **Clinique = sanctuaire, dédoublée** (médecin
  prioritaire / équipe secondaire).
- Ressenti = **trois sous-champs** (patient / équipe / entourage), chacun avec état
  vide-info distinct de non-renseigné.
- Diffraction = regards attribués, gardés contrastés ; `sans_partage` booléen.
- Ressources = zones libres, dynamiques, sans signe (§13).

### Typage SIID (paramètre de lecture, pas verdict)
- **aigu** (sortie d'hospitalisation) — **NAP** (observance) — **chronique** (stable mais
  fragile). Rythme adapté à la clinique, pas de seuil unique.

### Couche factuelle (machine — lit le journal, ne juge jamais)
Auto-remplissable, faits seulement :
- dernier contact (silence : « il y a N jours ») ;
- glissement de modalité (domicile → téléphone) ;
- actes non aboutis qui s'accumulent ;
- rythme / fréquence ;
- échéancier séquentiel / NAP.

Elle ne dit jamais « il décroche » (interprétation = humain). Elle dit « dernier contact
il y a 23 j » (fait). Elle couvre l'angle mort du réseau : l'isolé dont *rien n'arrive*.
Ne se rempliront **jamais** seuls : les six champs interprétés (dépôt humain).

### Faisabilité vérifiée sur `Suivi_d_activités_SIID_2026.xlsx`

Structure réelle du fichier :
- Feuille **`Suivi d'activités`** (journal vivant) : 280 actes, 53 patients. Colonnes
  IPP · Nom · Prénom · Secteur · **Date** · **Type d'intervention** (= modalité) ·
  **Acte principal** · **Agents** · **Commentaire**. L'**IPP est déjà présent** (renseigné
  sur 259 lignes / 280) → la clé unique existe, il suffit de la rendre obligatoire.
- Feuille **`Suivi parcours`** (22 colonnes d'anamnèse : date de naissance, code
  diagnostic FXX.X, structure d'origine, motif d'orientation SIID, prescripteur…) :
  **quasi vide, juste des noms.** Preuve par l'exemple : ce qui demande un geste humain
  ne se remplit pas dans un tableur mort. C'est *ça* que l'outil doit rendre vivant.
- Feuille **`PATIENTS SEQUENTIELS`** : temporalité NAP par patient (« toutes les 4/6
  semaines ») + IPP → permet de calculer le **NAP en retard**.
- Feuille **`Choix multiple`** : vocabulaires contrôlés (motif d'orientation SIID,
  orientation/relai, motif de fin de PEC, hospitalisation…) — utiles comme **amorces**,
  pas comme cases imposées.

Auto-calculable **sans double saisie** (confirmé sur les données) :

| Signal factuel | Source | Exemple réel |
|---|---|---|
| **Silence** (jours depuis dernier acte) | max(Date) par patient | TOUHENON 208 j, BA 195 j |
| **Glissement de modalité** | suite des « Type d'intervention » | domicile (183) → téléphone (44) |
| **Actes non aboutis** | Commentaire (« ABSENT », « REFUS ») | 5 absents + 1 refus détectés |
| **Rythme / fréquence** | écart entre dates par patient | — |
| **NAP en retard** | dernier INR × temporalité SÉQUENTIELS | « toutes les 4 semaines » dépassé |
| **Charge par agent** | colonne Agents | CELINE, LOUBNA, ANTHONY, KARIMA… |
| **Volume mensuel** | déjà en place (COUNTIFS sur Date) | — |

Événements de couture déjà tracés dans le Commentaire : « RELAI CMP », « RELAIS CMP à
partir du 16/06/26 », « SYNTHESE », « RENOUVELLEMENT ORDO » → matière brute du fil de
continuité, à structurer.

**Ne se calcule jamais** : les six champs interprétés (S/C/R/D/Diff/É) — dépôt humain,
comme le prouve la feuille « parcours » restée à zéro.

---

## 16. Les trois moments d'usage

- **Lundi matin (intra)** — indication + création de la ligne-patient (§11) ; alliance
  l'après-midi.
- **Mardi matin (synthèses)** — les cas en bascule / bloqués ; la synthèse patient =
  support de séance.
- **Trimestriel (revue)** — continuer / **renouer ailleurs** (jamais « clôturer » comme
  une fin). Le « métronome » existe déjà ; l'outil le **nourrit**, ne le réinvente pas.

Priorité de prototypage : **la carte d'abord** (la forme juste), puis la vue lundi.

---

## 17. v1 vs v2 — ne pas mélanger

- **v1 — outil interne.** Psychiatre + Anthony. **Muet, sans pédagogie** : ils savent
  déjà regarder. Objectif : la grille qui *marche*, taillée pour leur geste. Peut être
  laid. Doit marcher.
- **v2 — produit diffusable.** Pour les désorientés. La fonction d'enseignement (§8)
  s'active — et elle est **gratuite** : rien à construire, c'est un *effet de la justesse
  de la forme*. Si la grille est assez juste, la remplir *est* apprendre à regarder.

Règle : ne pas sur-concevoir la v1 en pensant à la v2.

---

## 18. Garde-fous / conformité

- **Données de santé nominatives.** Pseudonymisation par défaut ; l'identité réelle ne
  quitte pas le poste ; le cœur analytique tourne sur un code.
- L'outil **n'est pas un dispositif de soin** (Collègue borné au soignant). Toute
  ouverture au patient changerait de régime réglementaire.
- Aucune synthèse générée n'est un acte médical : elle **met en forme**, ne conclut pas ;
  la décision reste humaine et, si besoin, médicale.
- **« Prédire » est proscrit** — trahit la temporalité du patient (une vision n'a de
  valeur que si on lui donne vie) et expose au risque CNIL. L'outil **aide à**
  anticiper ; il ne prédit pas.

---

## 19. Identité visuelle — le logo

Le principe de fond de l'outil (voir encadré ci-dessous) n'est **écrit nulle part** dans
l'interface ni la doc destinée aux utilisateurs. Il est porté, muet, par le **logo** —
enseignement-par-la-forme appliqué à la marque elle-même.

### Le principe (fil à plomb, jamais exhibé)

> **Couper = finir = mort. Nouer = transformer = vivant.**

Le nœud gordien n'est pas une énigme à trancher : c'est une réalité à **transformer** (un
nœud en un autre nœud). Le trancher ne le résout pas — ça le tue. Le réflexe d'Alexandre
(couper) est une erreur de catégorie : il confond *résoudre* et *finir*. C'est exactement
le geste clinique : l'évidence qui tranche est la coupe gordienne ; le soin est dans le
nouage qui continue. *(Intuition arrivée par la clinique ; cousinage vérifié avec le nœud
borroméen de Lacan — assise, pas source : rencontre indépendante, pas emprunt.)*

### Le logo bistable

Une image à **deux lectures selon le temps qu'on lui accorde** — et la bascule *est* le
geste :
- **regard court** → « un nœud, il faut couper » (réflexe d'Alexandre) ;
- **regard long** → « c'est un lien, il ne se coupe pas ; il faut ne pas trop serrer, ou
  desserrer et faire glisser le nœud un peu plus loin ».

Le logo fait commettre au spectateur l'erreur d'Alexandre, puis la lui fait dépasser.

### Les variantes à essayer (Claude Design)

Principe perceptif commun : **le même trait a deux rôles selon la figure privilégiée** —
ce qui est « croisement qui serre » dans une lecture doit être « courbe qui relie » dans
l'autre. Sept pistes distinctes, à tester à l'œil (la bistabilité se vérifie en
regardant, pas en théorie) :

**V1 — Croisement / passage.** Un tracé dont les croisements (les X) se lisent comme
*serrage* au regard court (« nœud serré, à trancher ») et comme *passage qui glisse* au
regard long (le fil passe et continue, rien ne se ferme). Le basculement se joue sur les
points de croisement.

**V2 — Fil unique sans fin** (type nœud celtique / tracé fermé sur lui-même). Regard
court : une masse, un obstacle à trancher. Regard long : l'œil trouve le fil, le suit,
tourne — et comprend qu'il n'y a **pas de bout à couper**. « Dénouer = arriver à la fin
de l'histoire », sauf qu'il n'y a pas de fin. La coupe devient absurde à mesure qu'on
regarde.

**V3 — Nœud coulant** *(la plus fidèle à la thèse « desserrer et faire glisser »)*. Un
nœud qui **tient sans serrer à mort et qu'on peut faire glisser** le long du fil. Image
littérale de l'élastique qu'on repose : le nœud n'est pas fixé, il se repositionne, il ne
se rompt pas. Peut se dessiner avec une petite « queue » de fil qui montre que le nœud
pourrait coulisser.

**V4 — Vide qui devient forme** (type vase de Rubin) *(ambitieuse)*. Le **négatif** entre
les brins dessine autre chose que le positif : regard court, les brins noirs forment un
nœud ; regard long, le blanc entre eux forme une continuité — une boucle ouverte, une
main tendue, ou une lettre (le « e » d'Encre, un « S » de SIID…). Superbe si ça tombe
juste, casse-gueule si c'est forcé.

**V5 — Nœud / lien selon la distance** (bascule figure entière). De près / petit : ça
lit « nœud ». En grand / avec recul : les brins se révèlent être **deux mains** ou **deux
fils qui se tiennent** sans se ligoter. La même image dit « obstacle » ou « lien » selon
l'échelle de lecture.

**V6 — Combinaison recommandée : coulant + croisement/passage.** Un **nœud coulant tracé
d'un seul trait continu, sans bout visible**, dont les croisements se lisent serrage
(court) / passage (long). C'est la plus solide perceptivement et celle qui porte le mieux
la phrase « ne pas trop serrer, ne pas couper, ou desserrer et faire glisser un peu plus
loin ».

**V7 — Idéogramme minimal** (le pari épuré). Réduction à un seul geste de plume : une
ligne qui se noue une fois et repart, presque une signature. Risque : perdre la
bistabilité en gagnant en simplicité — à tester, ça peut être le plus fort comme le plus
plat.

Pour **chaque** variante, décliner deux registres de tracé :
- **organique** — un fil qui a du mou, de la matière, de la souplesse (raconte
  l'élastique, la tension qui se repose) ;
- **géométrique / épuré** — un tracé net, abstrait, un idéogramme (raconte la structure,
  le principe).

Lignage **Encre** (à appliquer à toutes) : tracé **noir** (le fil, le lien) ; **rouge**
réservé — comme le sanctuaire — au **point de nouage**, c'est-à-dire au lieu exact du
basculement (là où l'on croit devoir couper, là où en fait ça tient). Un seul point
rouge, le nœud, sur un fil noir continu. Fond papier clinique (blanc froid, pas crème).

> **[à trancher à l'œil]** laquelle bascule vraiment (court → long) sans qu'on ait à
> l'expliquer, et dans quel registre (organique / géométrique). Tester les sept dans
> Claude Design, garder celle qui fait *voir* le lien sans un mot.

---

## 20. Filiation

- **`Regarder ensemble`** (le livre) = **le mode d'emploi de la grille**. La traversée
  (ch. 14-18) est la colonne vertébrale ; « Le regard » (ch. 10-13) est le sanctuaire
  Clinique ; « La continuité qui digère » / « Ce que le morcellement détruit » est la
  thèse. Le livre n'est pas à côté de l'outil : il en est la doc.
- **`Le collègue`** (l'app) = le **moteur re-sujetté** (grille implicite, lecture par
  l'absence, gating par l'alliance, socle de clarté, plume qui montre sans expliquer).
- Lignage esthétique **`Encre`** (noir / rouge / serif) : le rouge réservé à
  l'intouchable (sanctuaire humain, point de nouage du logo).

---

## 21. Décisions arrêtées

- Unité = patient, pas acte.
- Grille = **S / C / R / Demande / Diffraction / É**, intriquée.
- **Clinique = sanctuaire humain**, dédoublée (médecin prioritaire / équipe), nomme le
  mécanisme, jamais l'étiquette ; hypothèse tenue, jamais verdict.
- **Interdit dur** : la machine ne suggère jamais de lecture clinique, même « évidente ».
- Ressenti = **trois positions**, non fusionnées.
- Diffraction ≠ ressenti ; discordance = (a) juxtaposition + (b) balise + (c) hypothèses
  **plurielles** ; jamais (d) sémantique.
- **Vide nommé** ≠ non-renseigné.
- Plume = **montre sans expliquer**, refuse sous seuil.
- Couche silencieuse = **factuelle seulement** (version stricte).
- Collègue = **pour le soignant, jamais le patient** ; + plume.
- Enseignement = **implicite par la forme** ; indices **qui ouvrent**, **pluriels** ;
  forme muette sur elle-même.
- Base de tendances = **vivante, tirée, chemins pluriels** ; jamais des lectures.
- Règle générale = **structure fixe, contenu libre** ; case/prose selon coche/pense.
- Vue lundi = paquet + 2 zones libres + prose latente (6 portes) + relance par l'absence.
- Indication = **pronostic de rupture** (« où, et pourquoi »).
- Ressources externes = **liens à travailler**, sans signe, tension mouvante, liaisons
  **et** déliaisons accompagnées.
- Équilibre = **souplesse maintenue** ; clôture = renouer, jamais couper.
- **IPP obligatoire** ; identité aux extrémités.
- **« Prédire » proscrit** ; l'outil **aide à**, ne fait pas.
- Logo = **nœud gordien bistable** ; le principe anti-coupe n'est écrit nulle part, il est
  dans la marque.

---

## 22. Questions ouvertes **[à trancher]**

1. **Enseignement — jusqu'où ?** Entraîner le *dépôt* dans la traversée (rapide) — et/ou
   entraîner le *regard* clinique lui-même (le sanctuaire ; non enseignable par
   prescription, au mieux entraînable comme *Le collègue* entraîne sans soigner) ?
2. **Auto-remplissage** — ✅ liste figée sur l'Excel de départ (§15). Reste à décider
   comment structurer les événements de couture aujourd'hui noyés dans le champ
   Commentaire (« RELAI CMP », « SYNTHESE »…).
3. **Synthèse patient** — registre et cadre exacts (objet remis au patient).
4. **Logo** — organique vs géométrique, à trancher à l'œil sur maquette.

---

## 23. Prochaine étape

Refaire la maquette de la **carte-patient** avec les calages du livre (Clinique = le
mécanisme qui traverse, pas l'étiquette ; Demande = la réelle sous l'enveloppe ;
Diffraction = regards côte à côte pour tendre un miroir), en s'assurant qu'**aucun champ
n'a besoin d'un mot d'explication** pour se comprendre. Si un champ réclame une glose, le
retravailler jusqu'à ce qu'il se taise.
