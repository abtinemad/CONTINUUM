-- CONTINUUM — Phase 0 · 60 · privilèges
--
-- Invariant 1 : « Rien ne s'écrase, rien ne s'efface » — aucun rôle de runtime ne reçoit
--               jamais UPDATE, DELETE ou TRUNCATE. Nulle part, sur aucune table.
-- Invariant 2 : « La machine n'écrit jamais un dépôt » — le rôle machine n'a pas USAGE
--               sur le schéma `depot`. Ce n'est pas un droit retiré : c'est un nom qu'elle
--               ne peut pas résoudre.
--
-- ┌ Ce que la structure ne peut pas tenir, et qu'il faut donc dire ─────────────┐
-- │ Le propriétaire d'une table conserve tous les droits sur elle, et un        │
-- │ superutilisateur passe au travers de tout. Les deux invariants ci-dessus    │
-- │ valent donc **exactement aussi longtemps que la discipline de connexion** : │
-- │ l'application se connecte comme `continuum_soignant` ou `continuum_machine`,│
-- │ jamais comme `continuum_migration`, jamais comme superutilisateur. C'est la  │
-- │ dernière garde qui reste du code — non de la structure. La nommer ici, c'est │
-- │ refuser de la laisser se dissoudre dans le confort d'une DDL qui « tient ». │
-- └────────────────────────────────────────────────────────────────────────────┘

-- ── Le socle : personne, par défaut ───────────────────────────────────────────
REVOKE ALL ON ALL TABLES    IN SCHEMA identite, recolte, depot, machine, lecture FROM PUBLIC;
REVOKE ALL ON SCHEMA identite, recolte, depot, machine, lecture FROM PUBLIC;

-- ── Le soignant : les deux guichets ───────────────────────────────────────────
-- Un seul rôle pour la récolte et le collège : le régime tient au `cadre`, jamais au grade.
GRANT USAGE ON SCHEMA identite, recolte, depot, machine, lecture TO continuum_soignant;

GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA identite TO continuum_soignant;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA recolte  TO continuum_soignant;
GRANT SELECT, INSERT ON ALL TABLES IN SCHEMA depot    TO continuum_soignant;
GRANT SELECT           ON ALL TABLES IN SCHEMA machine TO continuum_soignant;  -- lit ; n'écrit pas
GRANT SELECT           ON ALL TABLES IN SCHEMA lecture TO continuum_soignant;

-- ── La machine : lit par la fenêtre, écrit chez elle ──────────────────────────
-- Aucun USAGE sur `identite`, `recolte`, `depot`. Les trois lignes qui suivent sont la
-- totalité de ce que la machine peut nommer.
GRANT USAGE ON SCHEMA lecture, machine TO continuum_machine;

GRANT SELECT ON ALL TABLES IN SCHEMA lecture TO continuum_machine;
GRANT SELECT, INSERT ON machine.propositions_retypage TO continuum_machine;
GRANT SELECT, INSERT ON machine.relances              TO continuum_machine;
GRANT SELECT, INSERT ON machine.pistes                TO continuum_machine;
GRANT        INSERT ON machine.miroir_agent           TO continuum_machine;  -- écrit, ne relit jamais

-- ── Invariant 1, écrit deux fois pour qu'on ne l'ajoute jamais par distraction ─
REVOKE UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA identite, recolte, depot, machine, lecture
  FROM continuum_soignant, continuum_machine, PUBLIC;

ALTER DEFAULT PRIVILEGES FOR ROLE continuum_migration IN SCHEMA identite, recolte, depot, machine, lecture
  REVOKE UPDATE, DELETE, TRUNCATE ON TABLES FROM continuum_soignant, continuum_machine, PUBLIC;

-- ── Absences, énumérées pour qu'on ne les comble pas ──────────────────────────
-- · Aucun GRANT INSERT sur les vues de `lecture` : elles portent un `WITH` de tête et ne
--   sont pas auto-inscriptibles. Le GRANT n'y changerait rien — vérifié par le test 1 bis.
-- · Aucun GRANT sur `machine.miroir_agent` en SELECT pour `continuum_machine` : elle
--   dépose la trace, elle ne s'en nourrit jamais (« mesure auto-effaçante »).
-- · Aucune vue d'agrégat, aucune fonction d'agrégat, nulle part. Le `AVG` reste un geste
--   contre le grain, jamais un clic (invariant 6).
