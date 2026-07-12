-- CONTINUUM — Phase 0 · 50 · le schéma `lecture` — la fenêtre, pas la porte
--
-- La machine lit 0-1-2 **ici et nulle part ailleurs**. Trois propriétés, toutes structurelles :
--
-- 1. **Non inscriptible par construction.** Chaque vue porte un `WITH` de tête. Une vue à
--    CTE de tête n'est pas auto-inscriptible en PostgreSQL : aucun GRANT ne la rouvre.
--    Ce n'est pas « INSERT refusé » — c'est « INSERT n'existe pas sur cet objet ».
-- 2. **Sans nom.** Aucune vue n'expose `nom` / `prenom` / `date_naissance` du patient.
--    La pseudonymisation est **par structure**, pas par option (§18) : la machine ne
--    reçoit pas l'ordre d'oublier l'identité, elle n'a jamais eu de chemin vers elle.
-- 3. **Sans le non-ratifié.** Un dépôt décidé-en-collège n'entre dans la fenêtre que
--    signé par ≥ 2 : la machine ne lit que le validé, jamais le fantôme (1 signature).
--
-- Les vues appartiennent à la migration et ne sont pas `security_invoker` : elles
-- s'exécutent avec les droits de leur propriétaire. Lire à travers la fenêtre n'exige
-- donc aucun droit sur la table de base — et n'en donne aucun.

SET ROLE continuum_migration;

-- ── Domaine 0 — l'IPP seul ────────────────────────────────────────────────────
CREATE VIEW lecture.patients AS
WITH nu AS (SELECT ipp, ouvert_le FROM identite.patients)
SELECT * FROM nu;
COMMENT ON VIEW lecture.patients IS 'Tout le moteur sur IPP. Le nom se résout à l''affichage, jamais dans le moteur.';

-- ── Domaine 1 — la queue de chaque chaîne de correction ───────────────────────
-- « La projection courante suit la queue de chaque chaîne. » La coquille survit dans le
-- flux (auditable), disparaît de l'écran (propre). Une queue = une ligne que personne
-- n'a corrigée.

CREATE VIEW lecture.journal_actes AS
WITH queue AS (
  SELECT a.id, a.ipp, a.date_acte, a.modalite, a.acte_principal,
         a.agents_noms, a.commentaire, a.evenement_couture, a.saisi_par, a.saisi_le
  FROM recolte.journal_actes a
  WHERE NOT EXISTS (SELECT 1 FROM recolte.journal_actes c WHERE c.corrige_id = a.id)
)
SELECT * FROM queue;

CREATE VIEW lecture.parametres_patient AS
WITH queue AS (
  SELECT p.id, p.ipp, p.date_entree, p.rythme_attendu_jours
  FROM recolte.parametres_patient p
  WHERE NOT EXISTS (SELECT 1 FROM recolte.parametres_patient c WHERE c.corrige_id = p.id)
)
SELECT * FROM queue;

CREATE VIEW lecture.consentements AS
WITH queue AS (
  SELECT c.id, c.ipp, c.partage_infos, c.visites, c.date_recueil
  FROM recolte.consentements c
  WHERE NOT EXISTS (SELECT 1 FROM recolte.consentements x WHERE x.corrige_id = c.id)
)
SELECT * FROM queue;

CREATE VIEW lecture.diagnostic_leger AS
WITH queue AS (
  SELECT d.id, d.ipp, d.code, d.libelle
  FROM recolte.diagnostic_leger d
  WHERE NOT EXISTS (SELECT 1 FROM recolte.diagnostic_leger x WHERE x.corrige_id = d.id)
)
SELECT * FROM queue;

-- L'agent : son nom, parce que l'attribution EST la garde (invariant 18). Rien d'autre —
-- ni `medecin_coordinateur` : la machine n'a aucun usage d'une hiérarchie qui n'existe pas.
CREATE VIEW lecture.agents AS
WITH queue AS (
  SELECT f.agent_id, f.nom, f.fonction
  FROM recolte.agents_fiche f
  WHERE NOT EXISTS (SELECT 1 FROM recolte.agents_fiche c WHERE c.corrige_id = f.id)
)
SELECT * FROM queue;

-- L'acteur : son libellé, jamais ses coordonnées. Joindre est un geste humain.
CREATE VIEW lecture.acteurs AS
WITH queue AS (
  SELECT a.id, a.libelle, a.categorie
  FROM recolte.acteurs a
  WHERE NOT EXISTS (SELECT 1 FROM recolte.acteurs c WHERE c.corrige_id = a.id)
)
SELECT * FROM queue;

-- ── Domaine 2 — tout le flux, rien de masqué ; la machine ne voit que le validé ──
-- « En dépôts, la projection ne masque rien : chaque pli s'affiche. » Aucun filtre de
-- correction ici — il n'y a que des états datés du regard. Un seul filtre, structurel :
-- un dépôt décidé-en-collège (ou sa levée) n'entre dans la fenêtre machine que ratifié
-- par ≥ 2 signataires. Le fantôme (1 signature) reste à l'équipe, qui lit `depot` en
-- direct ; la machine ne le voit pas.

CREATE VIEW lecture.depots AS
WITH signataires AS (
  -- signataires distincts d'un dépôt : l'auteur (qui a signé en déposant) plus les avis
  -- de type 'signature'. Un refus ne signe pas ; il ne compte jamais dans le nombre.
  SELECT depot_id, count(DISTINCT agent_id) AS nb
  FROM (
    SELECT d.id AS depot_id, d.auteur_id AS agent_id FROM depot.depots d
    UNION
    SELECT a.depot_id, a.agent_id            FROM depot.avis a WHERE a.type = 'signature'
  ) t
  GROUP BY depot_id
),
flux AS (
  SELECT d.id, d.ipp, d.depose_le, d.auteur_id, d.cadre, d.nature,
         d.champ_cible, d."position", d.facette, d.acteur_id,
         d.ref_depot_id, d.ref_nature, d.ref_proposition_id, d.type_valide,
         d.contenu,
         s.nb AS nb_signataires
  FROM depot.depots d
  JOIN signataires s ON s.depot_id = d.id
  WHERE
    (d.nature NOT IN ('situation','ressenti','demande','diffraction','hypothese_clinique','temporalite')
     AND NOT (d.nature = 'levee' AND d.ref_nature IN ('hypothese_clinique','temporalite')))
    OR s.nb >= 2
)
SELECT * FROM flux;
COMMENT ON VIEW lecture.depots IS
  'La machine ne voit que le validé : un dépôt collège ratifié par ≥ 2 signataires distincts (l''auteur, qui signe en déposant, plus un avis). Le fantôme non ratifié reste à l''équipe. nb_signataires est une magnitude, jamais un score.';

RESET ROLE;
