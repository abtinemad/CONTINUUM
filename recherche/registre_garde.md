# Registre-garde — CONTINUUM

Note de recherche. Compagnon de `internes_eval.md`, `architecture_eval.md`,
`extraction_leclg.md`. Ne double pas la topologie (scellée) ; installe la pièce
que REGISTRE_LAIQUE nous a montrée dans le moteur Collègue : un **bloc-garde de
sortie unique**, suffixé identiquement à chaque prompt qui lit du sens et écrit
du texte **en langue** — l'eval (pour son champ `raisonnement` et ses sorties
prose), le condensé de la plume (§6.3), la génération de compte-rendu, la lecture
institutionnelle Continuité / Fragmentation — plutôt que la même discipline
redite, et fatalement dérivée, prompt par prompt.

---

## Ce qu'il remplace

Dans le worker du Collègue (`server.ts`), la discipline de registre laïque est
**éparpillée**. Le persona (`SYSTEM_PROMPT`) la porte en vingt endroits : « sans
jargon », « tu ne poses pas de diagnostic », « tu détectes les mécanismes de
défense sans jamais les nommer », « une description fonctionnelle, pas un
diagnostic ». L'évaluateur (`EVAL_SYSTEM`) n'en tient qu'une part. Une garde
dispersée dérive — vingt copies qui divergent en silence, la fragmentation logée
dans la charge non partagée (§12 bis). Le registre-garde la **rassemble en un seul bloc**,
écrit une fois, suffixé partout : l'**invariant 12** tenu par une garde partagée,
pas par la vigilance de chaque prompt pris à part. « Langue du participant »
(Sibeoni) opérationnalisée.

---

## Le bloc — à suffixer en dernier, prime **en langue** sur ce qui précède

> **Registre de sortie — invariant. Prime en langue sur tout ce qui précède.**
>
> *Portée. Ce bloc régit la **prose adressée à un humain** — le condensé de la
> plume, le compte-rendu, la lecture institutionnelle, le raisonnement en clair
> de l'eval. Il ne bâillonne **jamais** le plancher structurel : les booléens de
> couverture et les pointeurs de localisation restent des oui/non durs — c'est
> précisément ce qui ne peut pas oublier. Les clauses de **registre** ci-dessous
> (langue, « jamais le sujet », tentatif) bornent la prose ; les clauses de
> **structure** (le nombre, le crédit du déposé, la mesure qui ne gouverne que
> l'interface) tiennent partout, prose et champs.*
>
> - Tu écris dans la langue de la personne, pas dans la tienne — ses mots, pas
>   les tiens. Aucun terme de métier : tu écris ce que le corps fait, jamais
>   « somatisation » ; ce qui revient, jamais « compulsion » ; ce qu'elle tient
>   à distance, jamais « défense ». Si le mot juste est un mot clinique, tu ne
>   l'emploies pas — tu décris.
> - Jamais « le sujet », « le patient », « l'usager ». La personne n'est pas
>   l'objet de ta phrase.
> - Tu montres, tu ne conclus pas. Tentatif toujours — « on dirait que »,
>   « quelque chose semble » ; jamais « il est », « elle a ». Aucun verdict,
>   aucun diagnostic, aucun pronostic. Le bord de ce que tu écris est une
>   question tenue ouverte, pas une sentence. *(Registre : cette clause borne la
>   prose. Elle ne touche pas les booléens de couverture, qui doivent trancher.)*
> - Ce que tu lis dans la Clinique, tu le cites mot pour mot ou tu n'y touches
>   pas. Tu ne reformules jamais une lecture clinique ; tu ne la noues jamais au
>   reste.
> - Aucun nombre ne porte sur la personne. Une taille, une épaisseur, une
>   intensité disent le **volume de ce qui a été récolté** — jamais une valeur
>   sur qui elle est. Les nombres que tu produis règlent un affichage, jamais un
>   dépôt, et ne font jamais face à un soignant comme un score. **Au niveau
>   institutionnel, plus strict encore : la magnitude ne s'affiche pas même
>   comme nombre — elle module une lumière (le clair-obscur du §18 bis).
>   Énoncé partagé, verbatim avec internes_eval.md : magnitude → lumière ;
>   nombre stocké ou affiché : nulle part.**
> - Tu ne portes au compte de la personne que ce qu'un humain a déposé. Une
>   question, une image, une reformulation venue de la machine ne devient jamais
>   sa matière tant qu'elle ne s'en est pas saisie. Tu lis ce qui a été apporté —
>   jamais ce que tu as toi-même suggéré.
> - Ta mesure ne gouverne jamais le soin. Ce que tu produis règle l'interface —
>   ce qu'un écran montre, où un regard se pose. La détresse, elle, est reçue
>   dans le fil quoi qu'il arrive, indépendamment de toi.

---

## Ancrage — chaque clause tient à une ligne de la doctrine

- **Langue de la personne, aucun jargon** → Sibeoni (langue du participant) ; la
  discipline dispersée du persona, ici rassemblée.
- **Jamais « le sujet »** → ontologie §19 : la surface montre *notre trace*, ne
  nomme jamais l'intérieur de la personne.
- **Tentatif, montrer sans conclure** → §19 ; tenu aussi par l'ordre des champs
  (ci-dessous). Borné à la prose : les booléens de couverture, eux, tranchent.
- **Clinique citée verbatim, jamais nouée** → **invariant 12**, §6.3.
- **Aucun nombre sur la personne** → **invariant 4** (aucun nombre sur un dépôt ;
  seuls nombres = des dates), §19 (taille = volume de récolte, jamais valeur du
  patient), §9 (aucun score qui fasse face). Cran institutionnel : §18 bis,
  « Continuité et Fragmentation — la lumière et l'ombre » (*sans nombre*, le
  clair-obscur).
- **Ne créditer que le déposé** → **§6.4** (il crédite ce que *tu* fais, jamais
  ce que la machine a suggéré). Déjà en dur dans `EVAL_SYSTEM`.
- **La mesure ne gouverne pas le soin** → §9, mesure auto-effaçante ; visible
  dans la discipline `crise` de `EVAL_SYSTEM` (le champ règle l'escalade de
  l'interface, jamais le soin).

---

## Deux mécaniques de garde lues dans le moteur Collègue

1. **Le bloc-garde suffixé** (REGISTRE_LAIQUE, analyses Carnet) — un seul bloc,
   en fin de prompt, jamais ré-écrit. La forme adoptée ci-dessus.
2. **L'ordre des champs comme garde** (`EVAL_SYSTEM`) — le champ `raisonnement`
   vient *avant* tous les booléens, « volontairement : c'est ce qui oblige à
   juger après avoir regardé, pas d'emblée ». Le montrer-sans-conclure tenu par
   la **structure de sortie**, pas par une injonction. À reprendre pour tout eval
   CONTINUUM : regarder d'abord, trancher ensuite, dans cet ordre imposé.

---

## Deux resserrages après relecture

Deux endroits où un bloc « qui prime sur tout » pouvait, mal lu, se retourner
contre la doctrine. Consignés ici pour qu'un lecteur froid voie *pourquoi* la
portée est bornée — pas seulement qu'elle l'est.

1. **Vers le bas — ne pas bâillonner le plancher.** « Tu ne conclus pas, tentatif
   toujours » vise la prose ; à la lettre, la clause entrait en conflit avec les
   **booléens de couverture**, qui *doivent* trancher dur (touché / pas touché) —
   le plancher qui ne peut pas oublier. D'où la ligne de portée. Mais la coupe
   n'est pas « le bloc ne touche pas au structurel » (trop large) : les clauses de
   *structure* (nombre, crédit, mesure→interface) tiennent aussi sur les champs —
   un compte de couverture promu en score déposé est exactement ce qu'elles
   interdisent. La coupe juste est **registre / structure**, pas prose / champs.

2. **Vers le haut — le nombre qui se rematérialise à l'institutionnel.** « Les
   nombres règlent un affichage » est juste par patient (pupille, globe). Mais le
   bloc se suffixe aussi à la lecture institutionnelle, où §18 bis (« Continuité
   et Fragmentation — la lumière et l'ombre ») grave *sans nombre* — le
   clair-obscur, pas « fragmentée à 40 % ». Le seul endroit où un chiffre peut
   revenir sans qu'on le voie. La clause « jamais comme un score » n'interdisait
   que le *facing*, pas l'existence du chiffre : sous-contrainte. D'où le
   resserrage reprend verbatim l'énoncé d'internes_eval.md :
   magnitude → lumière ; nombre stocké ou affiché : nulle part.

---

## Rédigeable maintenant / gelable plus tard

Le **contenu** du bloc est doctrine-dérivé : posable dès aujourd'hui. Ce qui
attend, c'est sa **calibration** — une garde de sortie se règle contre ce qui la
franchit. Une garde qui n'a jamais rencontré ce qu'elle garde est une théorie,
pas une garde. Quand les prompts d'eval existeront et qu'on verra une sortie
produire « le sujet somatise », on durcira l'injonction correspondante. Ne pas
figer ce bloc *avant* ce contact. Rédiger n'est pas geler ; le bloc ci-dessus est
le premier état.
