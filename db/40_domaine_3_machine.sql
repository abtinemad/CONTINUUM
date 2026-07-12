-- CONTINUUM — Phase 0 · 40 · domaine 3 — Machine
--
-- Loi : lit 0-1-2, n'écrit que chez elle. Tout y est soit **recalculable** (les projections
-- — jetables à volonté, donc jamais propriétaires d'un état), soit **immuable et daté**
-- (les propositions). Les projections ne sont pas ici : ce sont des vues et des fonctions,
-- écrites quand le recours sera calibré sur les données réelles (`schema.md` §11.2). Une
-- projection qu'on grave en table cesse d'être une projection.

SET ROLE continuum_migration;

-- ── Propositions (immuables, datées) ──────────────────────────────────────────

CREATE TABLE machine.propositions_retypage (
  id              uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  ipp             text        NOT NULL REFERENCES identite.patients (ipp),
  emise_le        timestamptz NOT NULL DEFAULT now(),
  type_propose    text        NOT NULL CHECK (type_propose IN ('aigu','nap','chronique')),
  base_factuelle  text        NOT NULL          -- jamais une lecture
);
COMMENT ON COLUMN machine.propositions_retypage.base_factuelle IS
  'La proposition porte sa base factuelle — jamais une lecture. Le différentiel propose, le regard valide.';

-- Le dépôt de validation référence la proposition qu'un regard a validée. La FK va donc
-- du domaine 2 vers le domaine 3 : elle n'y lit **aucune vérité** (une proposition reste
-- une proposition) — elle atteste **qu'un acte machine daté a eu lieu, et lequel**. Sans
-- elle, `ref_proposition_id` serait un uuid nu : falsifiable, donc interdit (loi 3).
ALTER TABLE depot.depots
  ADD CONSTRAINT depots_ref_proposition
  FOREIGN KEY (ref_proposition_id) REFERENCES machine.propositions_retypage (id);

CREATE TABLE machine.relances (
  id        uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  ipp       text        NOT NULL REFERENCES identite.patients (ipp),
  porte     text        NOT NULL CHECK (porte IN (
              'alliance_absente','hospitalisation_contrainte','anosognosie',
              'non_observance','entourage_absent','entourage_epuise')),   -- les six portes (§12)
  question  text        NOT NULL,
  emise_le  timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT relances_une_fois_par_porte UNIQUE (ipp, porte)             -- invariant 8
);
COMMENT ON TABLE machine.relances IS
  'Une fois par porte. Déférée à la temporalité argumentée quand une temporalite est ouverte sur la demande (garde de code, à venir) — jamais suspendue : le temps nommé passé, elle revient. Affichée dans la vue, jamais notifiée : il n''existe pas d''infrastructure pour pousser.';

CREATE TABLE machine.pistes (
  id        uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  ipp       text        NOT NULL REFERENCES identite.patients (ipp),
  emise_le  timestamptz NOT NULL DEFAULT now(),
  contenu   text[]      NOT NULL CHECK (cardinality(contenu) >= 2)       -- invariant 7
);
COMMENT ON TABLE machine.pistes IS
  'Plusieurs ou le silence. Une piste seule est une interprétation déguisée. Jamais sur la lecture clinique.';

-- ── Le miroir de l'agent — privé par absence de chemin (§6.4) ─────────────────

CREATE TABLE machine.miroir_agent (
  id              uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  utilisateur_id  uuid        NOT NULL REFERENCES recolte.agents (id),
  note_le         timestamptz NOT NULL DEFAULT now(),
  evenement       text        NOT NULL CHECK (evenement IN ('propose_garde','propose_coupe','propose_reformule')),
  extrait         text
);
ALTER TABLE machine.miroir_agent ENABLE ROW LEVEL SECURITY;
ALTER TABLE machine.miroir_agent FORCE  ROW LEVEL SECURITY;   -- même le propriétaire ne passe pas

-- Aucune vue croisée, aucune fonction d'agrégat n'existe sur cette table, et il n'en
-- existera pas : « réflexion, pas score ». Le rapprochement se lit ligne à ligne, par
-- son seul auteur, jamais compté.
CREATE POLICY miroir_lecture_de_soi ON machine.miroir_agent
  FOR SELECT TO continuum_soignant
  USING (utilisateur_id = nullif(current_setting('continuum.agent_id', true), '')::uuid);

CREATE POLICY miroir_ecriture_machine ON machine.miroir_agent
  FOR INSERT TO continuum_machine
  WITH CHECK (true);

COMMENT ON TABLE machine.miroir_agent IS
  'Le seul résidu persistant du brouillon. Il crédite ce que TU fais, jamais ce que la machine a suggéré : mesure auto-effaçante.';

-- ── Ce qui n'existe pas côté machine ──────────────────────────────────────────
-- Pas de table de notifications. Pas de job d'alerte. Pas de file de priorité.
-- Pas de table `syntheses`, pas de table `brouillons`, pas de colonne `source`.
-- Pas de table `fragments`, pas de table `condense`, pas de colonne `axes` :
-- « la machine ne porte que ce qu'elle peut recalculer ».
-- « Tiré, jamais poussé » n'est pas un réglage : c'est cette absence-ci.

RESET ROLE;
