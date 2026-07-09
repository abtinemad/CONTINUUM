-- CONTINUUM — Phase 0 · 20 · domaine 1 — Récolte (les faits durs seulement)
--
-- Loi du domaine : du factuel, régime directif (§10 — la contrainte filtre à la source),
-- append-only avec **correction projetée**. Les nombres sont permis ici, et ici seulement :
-- c'est le domaine du fait, pas du dépôt.

SET ROLE continuum_migration;

-- ── L'agent : même coupe que le patient (clé nue / fiche corrigible) ───────────
-- `auteur_id` d'un dépôt doit pointer vers un identifiant **stable pour toujours** :
-- un dépôt est immuable, et l'agent, lui, change de fonction. La fiche se corrige ;
-- la clé ne bouge pas.

CREATE TABLE recolte.agents (
  id       uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  cree_le  timestamptz NOT NULL DEFAULT now()
);
COMMENT ON TABLE recolte.agents IS 'La clé de l''agent. Rien d''autre : ce qui le décrit est corrigible, donc ailleurs.';

CREATE TABLE recolte.agents_fiche (
  id                    uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  agent_id              uuid        NOT NULL REFERENCES recolte.agents (id),
  nom                   text        NOT NULL,
  fonction              text,
  medecin_coordinateur  boolean     NOT NULL DEFAULT false,   -- droit de fonction, pas hiérarchie de lecture (§10)
  corrige_id            uuid,
  saisi_le              timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT agents_fiche_cle_composite UNIQUE (id, agent_id),
  CONSTRAINT agents_fiche_pas_d_auto_correction CHECK (corrige_id IS DISTINCT FROM id),
  CONSTRAINT agents_fiche_corrige_meme_agent
    FOREIGN KEY (corrige_id, agent_id) REFERENCES recolte.agents_fiche (id, agent_id)
);
CREATE UNIQUE INDEX agents_fiche_une_tete_par_agent
  ON recolte.agents_fiche (agent_id) WHERE corrige_id IS NULL;
CREATE UNIQUE INDEX agents_fiche_chaine_sans_fourche
  ON recolte.agents_fiche (corrige_id) WHERE corrige_id IS NOT NULL;

-- Le domaine 0 référençait déjà l'agent qui saisit : l'ordre de création n'est pas
-- l'ordre des domaines.
ALTER TABLE identite.patients_identite
  ADD CONSTRAINT identite_saisi_par_agent FOREIGN KEY (saisi_par) REFERENCES recolte.agents (id);

-- ── L'acteur — commodité de saisie, jamais entité vivante (§5 du schéma) ───────
-- Les trois interdits (vue inversée, attribut porté, maintenance propre) sont tenus
-- par **absence** : rien ici ne les rend possibles, et aucune vue ne sera écrite.

CREATE TABLE recolte.acteurs (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  libelle      text NOT NULL,
  categorie    text,      -- amorce : idel · samsah · cmp · famille · psy_liberal · travail · structure · autre
  coordonnees  text,      -- joindre n'est pas noter — point interprété, veto d'Abtine réservé
  corrige_id   uuid REFERENCES recolte.acteurs (id),
  CONSTRAINT acteurs_pas_d_auto_correction CHECK (corrige_id IS DISTINCT FROM id)
);
CREATE UNIQUE INDEX acteurs_chaine_sans_fourche
  ON recolte.acteurs (corrige_id) WHERE corrige_id IS NOT NULL;
COMMENT ON TABLE recolte.acteurs IS
  'Aucune vue acteur → patients n''existe ni n''existera. Les FK restent joignables en SQL brut : assumé (invariant 11).';

-- ── Les événements de couture — vocabulaire contrôlé, liste ouverte ────────────
-- « Liste ouverte, corrigeable en récolte » : la récolte y ajoute un code (INSERT), elle
-- n'en retire jamais (aucun DELETE nulle part). Un vocabulaire s'allonge ; il ne se purge pas.

CREATE TABLE recolte.evenements_couture (
  code     text PRIMARY KEY,
  libelle  text NOT NULL
);
INSERT INTO recolte.evenements_couture (code, libelle) VALUES
  ('relai_engage',       'Relai engagé'),
  ('relai_effectif',     'Relai effectif'),
  ('synthese',           'Synthèse'),
  ('renouvellement_ordo','Renouvellement d''ordonnance'),
  ('hospitalisation',    'Hospitalisation'),
  ('fin_pec',            'Fin de prise en charge');
COMMENT ON TABLE recolte.evenements_couture IS
  'Faits d''actes, régime directif — jamais des dépôts. Le statut du parcours s''en projette (§3). Aucun code « clôturé ».';

-- ── Le journal d'actes ────────────────────────────────────────────────────────

CREATE TABLE recolte.journal_actes (
  id                 uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  ipp                text        NOT NULL REFERENCES identite.patients (ipp),
  date_acte          date        NOT NULL,
  modalite           text,
  acte_principal     text,
  agents_noms        text[],                          -- `agents` de schema.md, désambiguïsé de la table
  commentaire        text,
  evenement_couture  text        REFERENCES recolte.evenements_couture (code),
  corrige_id         uuid,
  saisi_par          uuid        NOT NULL REFERENCES recolte.agents (id),
  saisi_le           timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT actes_cle_composite UNIQUE (id, ipp),
  CONSTRAINT actes_pas_d_auto_correction CHECK (corrige_id IS DISTINCT FROM id),
  CONSTRAINT actes_corrige_meme_ipp
    FOREIGN KEY (corrige_id, ipp) REFERENCES recolte.journal_actes (id, ipp)
);
CREATE UNIQUE INDEX actes_chaine_sans_fourche
  ON recolte.journal_actes (corrige_id) WHERE corrige_id IS NOT NULL;

-- ── Paramètres, consentements, diagnostic léger ───────────────────────────────

CREATE TABLE recolte.parametres_patient (
  id                    uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  ipp                   text        NOT NULL REFERENCES identite.patients (ipp),
  date_entree           date,
  rythme_attendu_jours  integer CHECK (rythme_attendu_jours > 0),  -- borne b : relatif, jamais absolu
  corrige_id            uuid,
  saisi_le              timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT parametres_cle_composite UNIQUE (id, ipp),
  CONSTRAINT parametres_pas_d_auto_correction CHECK (corrige_id IS DISTINCT FROM id),
  CONSTRAINT parametres_corrige_meme_ipp
    FOREIGN KEY (corrige_id, ipp) REFERENCES recolte.parametres_patient (id, ipp)
);
CREATE UNIQUE INDEX parametres_chaine_sans_fourche
  ON recolte.parametres_patient (corrige_id) WHERE corrige_id IS NOT NULL;

CREATE TABLE recolte.consentements (
  id             uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  ipp            text        NOT NULL REFERENCES identite.patients (ipp),
  partage_infos  boolean,
  visites        boolean,
  date_recueil   date        NOT NULL,
  corrige_id     uuid,
  CONSTRAINT consentements_cle_composite UNIQUE (id, ipp),
  CONSTRAINT consentements_pas_d_auto_correction CHECK (corrige_id IS DISTINCT FROM id),
  CONSTRAINT consentements_corrige_meme_ipp
    FOREIGN KEY (corrige_id, ipp) REFERENCES recolte.consentements (id, ipp)
);
CREATE UNIQUE INDEX consentements_chaine_sans_fourche
  ON recolte.consentements (corrige_id) WHERE corrige_id IS NOT NULL;

CREATE TABLE recolte.diagnostic_leger (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  ipp         text NOT NULL REFERENCES identite.patients (ipp),
  code        text,
  libelle     text,
  corrige_id  uuid,
  CONSTRAINT diag_cle_composite UNIQUE (id, ipp),
  CONSTRAINT diag_pas_d_auto_correction CHECK (corrige_id IS DISTINCT FROM id),
  CONSTRAINT diag_corrige_meme_ipp
    FOREIGN KEY (corrige_id, ipp) REFERENCES recolte.diagnostic_leger (id, ipp)
);
CREATE UNIQUE INDEX diag_chaine_sans_fourche
  ON recolte.diagnostic_leger (corrige_id) WHERE corrige_id IS NOT NULL;
COMMENT ON TABLE recolte.diagnostic_leger IS
  'Fait tenu léger (§2). Il existe ; il n''organise rien. Aucun tri, aucun filtre, aucun affichage en tête de carte : tenu par absence d''interface.';

RESET ROLE;
