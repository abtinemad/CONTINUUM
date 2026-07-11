-- CONTINUUM — Phase 0 · 70 · le dépôt vide
--
-- `depots_contenu_requis` (db/30) ne vérifie que `IS NOT NULL`. Mesuré sur origin/main,
-- base montée, transaction réelle : `''`, `'   \n  '` et `E'\t'` sont **acceptés, datés,
-- attribués**. Trois dépôts vides sur le fil d'un patient.
--
-- Le domaine 2 est append-only et rien ne s'y masque : un dépôt vide n'est pas un accident
-- qu'on efface, c'est une cicatrice définitive, signée d'un nom. Le vide qui est un FAIT a
-- déjà sa nature — `vide_info`, §6, « j'ai regardé, il n'y avait rien ». Le blanc du doigt
-- qui glisse n'en est pas un.
--
-- Sans ce CHECK, le refus du champ blanc est une règle d'application. Donc contournable.
-- Donc rien. « La garde est une absence de chemin, pas une permission. »
--
-- ── Pourquoi `~ '\S'` et non `btrim(...) <> ''` ────────────────────────────────────────
-- `btrim()` ne rogne, par défaut, que l'ESPACE. Vérifié :
--     btrim(E'\n') <> ''   →  true   (passe)
--     E'\n' ~ '\S'        →  false  (refuse)
-- L'idiome `btrim(x) <> ''` du domaine 0 laisse donc passer un IPP fait d'un seul retour
-- ligne. On le corrige ici aussi : même faiblesse, même remède, un seul fil.
--
-- Plus aucune nature ne reste nue : la temporalité elle-même nomme le temps qu'elle
-- demande et pourquoi (§6, refondu). `depots_contenu_requis` (db/30) refuse le NULL, ce
-- CHECK refuse le blanc — les deux contraintes se composent, aucune ne remplace l'autre.

SET ROLE continuum_migration;

ALTER TABLE depot.depots
  ADD CONSTRAINT depots_contenu_non_vide
  CHECK (contenu ~ '\S');

ALTER TABLE identite.patients
  DROP CONSTRAINT IF EXISTS patients_ipp_check;
ALTER TABLE identite.patients
  ADD CONSTRAINT patients_ipp_non_vide CHECK (ipp ~ '\S');

RESET ROLE;
