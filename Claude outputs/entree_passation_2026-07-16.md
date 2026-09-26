## 2026-07-16 — les quatre écrans, le moteur unique, et la base à 33 gestes

*(Entrée écrite le 13/09/2026, à froid, contre le dépôt : la passation s'était arrêtée au 10/07 —
**142 commits en arrière**. Tout ce qui suit est relu depuis `git log` ; aucun mot n'est attribué qui
ne soit dans un message de commit. La seule chose mesurée aujourd'hui est le banc, dit en fin d'entrée.)*

**Le moteur ne vit qu'une fois.** `core.sh` avait reçu un propriétaire unique (`9d3ba9f`), puis il
**meurt** : le noyau devient **module ES unique** — `noyau.js`, `tsc` entre, trois bancs verts
(`9131f5e`). Entre les deux, `creerForme()` donne un état de forme **par instance** (`e3ea8e5`) et le
nœud s'extrait en module partagé multi-instance (`50ed737`) : de là `opts.labels` pour monter le nœud
sans libellés (`92630aa`), `opts.encre` — une seule source pour fil/overs/oudjat (`3c25fcb`), et un
témoin de rendu Puppeteer (`27be751`). L'unicité est tenue par le symbole interne, pas par la vigilance.

**La base s'arrête sur ses mots.** Quatre renommages qui sont des arbitrages, pas du confort.
`equilibre` → **`hypothese_clinique`** : l'organe du nouage devient l'hypothèse *en mouvement, jamais
l'état atteint* (`a3182b0`, `80f8796`). `gestation` → **`temporalite`** : la pause opaque devient un
temps argumenté, qui **se dépose ET se lève en collège** — attendre est un acte d'équipe (`c02be9c`,
`b62d04b`, `115f484`) ; la temporalité à respecter remplace les hypothèses en cours, relance déférée
(`62fe64c`). `rendez_vous` → **`jalon`**, le rendez-vous n'étant qu'un type de jalon (`ea0be69`).
Puis la table **`avis`** — la signature à plusieurs du collège (`f3ec288`) —, le refus non argumenté
attrapé jusque sur le NULL (`1797b7d`), et `db(50)` : **la machine ne voit que le validé**, filtre
≥ 2 signataires, masque retiré (`3a9465b`). `db(70)` ferme la dernière nature nue (`c156bc9`).

**Le trio additif est prouvé, pas seulement accepté.** L'agrafe `geste_id`, le `fil` rencontre/soin et
les natures entrent dans la grammaire (`0666778`) ; cinq gestes de contrôle positif les prouvent —
**20 → 25 TENU** (`8fe43db`), puis 33 après le passage à `jalon`.

**Quatre écrans existent.** `01_file_active` : le nœud passe en haut à droite, figé en bilobe, la
recherche en bulle-loupe (`0210c47`, `83cdae4`) ; la **veilleuse** naît — clic court = notif, appui
long ≥ 500 ms = oudjat (`2bf38fa`) —, le fil ne tourne plus, l'œil se balade (`a459060`) ; notif,
dictée et ondulation sont portées **dans le module**, plus page-side (`d56fb00`, `54ee478`, `51bf93e`).
`02_intra_patient` devient **« Le fil de soi »** : vrai cadre téléphone (`2e2b283`), header fixe,
trois onglets Récolte/Métabolisation/Vigilance (`d620861`), et l'onglet Vigilance reçoit son contenu
en **témoin pur** — aucun bouton, aucun guichet (`2437e80`). Puis la **résonance** (`ecd39f0`) : le
geste que la doctrine décrivait depuis le 14/07 et qui n'existait nulle part. `03_filigrane` est refait
sur sa vraie matière — *le support du point institutionnel, plus un tableau de bord* (`3b0e1cf`) : le
guichet de l'hypothèse (`340a90c`), les hypothèses **anonymes** (`1675f01`), le quorum qui ouvre le
scellé (`38542ec`), enfin l'écart Affectif ↔ Réflexif qui se nomme et se chiffre — **47 % contre 52 %,
et le verdict saute : les deux nombres SONT l'écart** (`2abca6b`, `88fa57b`). `00_connexion` monte
l'app dans le cadre téléphone (`8bc16df`), la boîte de connexion, l'anonymat de la vitrine — *ni
soignant ni patient* (`4563a3d`) —, les trois parties avec leur doctrine et leurs exemples (`eb46c7e`),
et le récit institutionnel qui perd sa date parce qu'il s'écrit tout seul (`dd24714`).

**Le bilobe apprend la matière.** `setGrainBi` **redistribue** au lieu de faire grossir — le ∞ est déjà
pleine largeur et chaque dépôt nourrit les deux faces, une croissance absolue saturerait en permanence
et ne dirait rien (`2c0595b`). L'asymétrie native appartient à la **marque**, pas à l'instrument : au
repos elle dirait *« la Continuité est plus grande »*, un verdict par la forme — d'où `symetrique:true`
en page 3 (`9a075c4`). Et le signal cesse d'être noyé, deux fois le même bug : la bascule passe en
racine (`K_GAIN`), et le lest de l'œil, **plus grand que l'assiette**, la noyait — `LEST_MAX`
3,2° → 0,8° (`3443b01`). Ce qui se lit : deux canaux qui ne se recouvrent pas — *les boucles basculent
du côté où la matière tombe ; l'assiette penche du côté où l'équipe met son poids* (`e9b444e`).

**Doctrine — un organe, deux noms.** L'instrument du trilobe s'appelle **le Recul** ; « Vigie » est
rendue au bilobe, l'institutionnel (`6b3aff4`), et l'ontologie *vigilance ≠ surveillance* part avec
elle, où elle est chez elle (`b1da094`). La spirale se dédouble et se nomme : spirale des **révisions**,
spirale des **strates**, avec ses trois patients — pentalobe = le patient, trilobe = l'équipe qui le
prend en charge, bilobe = l'institution (`08fc182`, `031f992`). Puis la fermeture : **la Vigilante et
la Vigie sont le même organe à deux tours** — le texte les décrivait séparément sans jamais le dire
(`bea7152`). L'interdit de la Vigie est le **déterminisme**, pas le nommage : nommer au tentatif reste
permis (`8bfa7c6`, `b66ea22`). Le bilobe reçoit ce qui le nourrit : deux agrégats, le poids collectif,
la mécanique de répartition, les textures du climat (`45c341f`).

**Les périmés du 15/07, arbitrés en bloc** (`789dd99`) : le chiffrement phénoménologique **tombe** ; le
climat n'est pas une métadonnée, il lit le mot cru ; le couple miroir privé + climat global n'est plus
obligé ; **la chef de pôle tombe** — signatures égales, aucune voix au-dessus ; quorum ≥ 5 → ≥ 2
(*réunir cinq personnes est irréaliste ; le principe ne bouge pas*) ; **le nombre** : l'interdit passait
par la strate, il passe par la **personne** — aucun nombre sur un patient ni un soignant nommé, mais à
l'institutionnel il n'y a plus personne ; l'Affectif et le Réflexif sont implicites au bilobe. Et le
lendemain, **« quorum » est retiré du dépôt** : le mot venait des patchs de Claude du 15/07, qui l'avait
ensuite grepé et attribué à Abtine comme s'il préexistait (`165cb77`). Zéro occurrence aujourd'hui.

**Note de recherche** — `analyse_corpus.md` (`2b3d2f6`) : la méthode Reinert pour le climat, les
spécificités de Lafon pour la dérive, et la coupe doctrinale sur le process mining — *discovery à
prendre* (découvrir la forme = montrer), *conformance à refuser en bloc* (mesurer l'écart à la norme =
conclure). La formulation la plus opérationnelle du **montrer sans conclure**.

**Mesure du 13/09/2026.** `db/run_db_test.sh` rejoué de zéro sur un PostgreSQL 16 nu, base jetable :
**33 gestes, 33 TENU, aucun invariant rompu.** `mockup/run_test.sh` : tout vert, le moteur ne vit que
dans `noyau.js`. Le banc ne dépend d'aucune infrastructure — le projet Supabase est un confort de
portabilité, jamais une dépendance.

**Reste ouvert** — deux arbitrages Vigilante (patient = §19, climat = équipe-miroir) ; `CONTINUUM.md`
§10, qui situe encore l'exception coordinateur dans les permissions au lieu du cadre ; le
**registre-garde** écrit (`recherche/registre_garde.md`) mais branché nulle part ; la garde gravée en
sens inverse du nombre permis au bilobe (L1244, `registre_garde`, `internes_eval` — patch identifié le
15/07, non fait) ; et le serveur qui connecterait l'app à une base, qui n'existe dans aucun commit.

Commits `51b98e8..88fa57b` — 142.

