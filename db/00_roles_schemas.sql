-- CONTINUUM — Phase 0 · 00 · rôles et schémas
--
-- Loi 3 du schéma : « Le sanctuaire est une absence de chemin, pas une permission. »
--
-- Conséquence tenue ici, et nulle part ailleurs : les quatre domaines sont **quatre
-- schémas**, et le rôle machine ne reçoit **jamais** USAGE sur le schéma des dépôts.
-- Ce n'est pas un REVOKE INSERT (qui suppose que la table est nommable, donc qu'un
-- GRANT peut la rouvrir) : c'est l'impossibilité de **résoudre le nom**. La machine ne
-- se voit pas refuser l'écriture du dépôt — elle ne trouve pas le guichet.
--
-- La machine lit 0-1-2 par des vues du schéma `lecture`, possédées par la migration.
-- Une vue non `security_invoker` s'exécute avec les droits de son propriétaire :
-- lire à travers elle n'exige aucun droit sur la table de base. Le chemin de lecture
-- existe donc sans que le chemin d'écriture existe. C'est exactement la Vigilante :
-- on lit, on ne dépose pas, faute d'opération pour le faire (§4, second barrage).

-- ── Les trois mains ────────────────────────────────────────────────────────────
-- NOINHERIT : un membre doit SET ROLE explicitement — jamais de droit hérité par surprise.
-- NOBYPASSRLS : personne ne passe au travers du miroir privé (§6.4).

CREATE ROLE continuum_migration NOLOGIN NOINHERIT NOBYPASSRLS;   -- possède le schéma, hors ligne
CREATE ROLE continuum_soignant  NOLOGIN NOINHERIT NOBYPASSRLS;   -- dépose (guichets), lit tout
CREATE ROLE continuum_machine   NOLOGIN NOINHERIT NOBYPASSRLS;   -- lit 0-1-2, n'écrit que chez elle

COMMENT ON ROLE continuum_migration IS
  'DDL seulement. Ne se connecte jamais au runtime : les invariants 1 et 2 ne valent que sous cette discipline.';
COMMENT ON ROLE continuum_soignant IS
  'Les deux guichets (récolte et collège) : même rôle, même flux — le régime tient au cadre, pas au grade (§10).';
COMMENT ON ROLE continuum_machine IS
  'Domaine 3. Aucun USAGE sur le schéma depot : le sanctuaire est une absence de chemin.';

-- ── Le socle nu ───────────────────────────────────────────────────────────────
REVOKE CREATE ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM PUBLIC;

-- ── Les quatre domaines = quatre schémas ──────────────────────────────────────
CREATE SCHEMA identite AUTHORIZATION continuum_migration;   -- domaine 0 — les extrémités
CREATE SCHEMA recolte  AUTHORIZATION continuum_migration;   -- domaine 1 — les faits durs
CREATE SCHEMA depot    AUTHORIZATION continuum_migration;   -- domaine 2 — le flux de dépôts
CREATE SCHEMA machine  AUTHORIZATION continuum_migration;   -- domaine 3 — projections, propositions
CREATE SCHEMA lecture  AUTHORIZATION continuum_migration;   -- la fenêtre 0-1-2 → machine (vues seules)

COMMENT ON SCHEMA identite IS 'Domaine 0. L''identité nominative ne sort jamais d''ici : le moteur ne connaît que l''IPP (§18).';
COMMENT ON SCHEMA recolte  IS 'Domaine 1. Faits durs, régime directif (§10). Append + corrigé projeté.';
COMMENT ON SCHEMA depot    IS 'Domaine 2. Append, rien ne se masque. La machine n''a pas USAGE ici.';
COMMENT ON SCHEMA machine  IS 'Domaine 3. Recalculable, ou immuable et daté. Rien d''autre.';
COMMENT ON SCHEMA lecture  IS 'Vues possédées par la migration. Le seul chemin de la machine vers 0-1-2. En lecture, et sans nom, et sans le non-ratifié.';
