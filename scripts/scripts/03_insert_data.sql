-- Seed data Zelda DB (PostgreSQL)
-- Ordre: competence -> ennemi -> evenement -> region -> personnage -> "qute" -> pouvoir -> objet -> avoir -> modifier -> participer -> roder

BEGIN;

-- 1) competence
INSERT INTO competence (nom, capacite, rarete) VALUES
('Tir l arc', 'Tireur prcis', 'Rare'),
('Matrise de l pe', 'Matre piste', 'Epique'),
('Alchimie', 'Cration de potions', 'Rare'),
('Discrtion', 'Dplacement silencieux', 'Lgendaire'),
('Magie de feu', 'Lancer de flammes', 'Epique'),
('Gurison', 'Rgnration de sant', 'Rare'),
('Magie de glace', 'Conglation instantane', 'Epique'),
('Magie de la lumire', 'Bouclier lumineux', 'Epique'),
('Invocation de fes', 'Appelle une fe', 'Lgendaire'),
('Saut hroque', 'Double saut avec rotation', 'Rare');

-- 2) ennemi
INSERT INTO ennemi (nom, niveau) VALUES
('Moblin', 1),
('Bokoblin', 2),
('Lizalfos', 5),
('Stalfos', 3),
('Ganondorf', 10),
('Dark Link', 9),
('ReDead', 6),
('Hinox', 8),
('Keese', 2),
('Gohma', 7);

-- 3) evenement
INSERT INTO evenement (titre, impacte) VALUES
('Lune de sang', 'Ressuscite les ennemis'),
('Eruption volcanique', 'Renforce la magie de feu'),
('Pluie torrentielle', 'Rduit l agilit'),
('Tremblement de terre', 'Affaiblit les structures'),
('Eclipse solaire', 'Rduit la magie'),
('Tempte de sable', 'Rduit la visibilit'),
('Aurore borale', 'Renforce la gurison'),
('Vagues gantes', 'Dsactive les ports'),
('Chute d toiles', 'Augmente les objets rares'),
('Jour sans fin', 'Renforce les comptences');

-- 4) region
INSERT INTO region (nom, climat, relief, nature) VALUES
('Plaine d Hyrule', 'Tempr', 'Plaines', 'Herbe'),
('Dsert Gerudo', 'Aride', 'Dunes', 'Cactus'),
('Montagne de la Mort', 'Chaud', 'Volcan', 'Lave'),
('Fort de Firone', 'Humide', 'Fort', 'Tropiques'),
('Valle de Zora', 'Froid', 'Cascade', 'Rivire'),
('Village Cocorico', 'Tempr', 'Colline', 'Prairies'),
('Marcages Korogu', 'Humide', 'Boues', 'Marcages'),
('le de l Eveil', 'Doux', 'Plage', 'Cocotiers'),
('Temple du Temps', 'Tempr', 'Ruines', 'Anciennes structures'),
('Forteresse Maudite', 'Sombre', 'Collines', 'Terrains hostiles');

-- 5) personnage
INSERT INTO personnage (nom, niveau, id_region) VALUES
('Link', 10, 1),
('Zelda', 9, 2),
('Mipha', 7, 3),
('Daruk', 6, 4),
('Revali', 8, 5),
('Urbosa', 9, 6),
('Impa', 7, 7),
('Tingle', 3, 8),
('Epona', 4, 9),
('Rauru', 8, 10);

-- 6) "qute" (attention au nom de table entre guillemets)
INSERT INTO "qute" (titre, description, niveau_diff, id_region) VALUES
('Sauver Zelda', 'Empcher Ganondorf d enlever Zelda.', 10, 1),
('Trouver l Epe de Lgende', 'Rcuprer l pe dans le Temple du Temps.', 9, 10),
('Vaincre le Roi Moblin', 'Eliminer le Roi Moblin dans la Forteresse Maudite.', 8, 9),
('Escorte de caravane', 'Amener des provisions au Village Cocorico.', 3, 6),
('Activer la Tour de Firone', 'Rparer la tour dans la Fort de Firone.', 5, 4),
('Apaiser Vah Ruta', 'Calmer la Bte Divine Vah Ruta.', 7, 3),
('Djouer l embuscade', 'Protger le Village des attaques.', 6, 7),
('Rallumer les flammes sacres', 'Rallumer les flammes du Mont de la Mort.', 9, 5),
('Traverser les marcages', 'Trouver un passage scuris.', 4, 7),
('Protger l Archipel', 'liminer les ennemis sur l le de l Eveil.', 4, 8);

-- 7) pouvoir
INSERT INTO pouvoir (nom, description, id_personnage) VALUES
('Bouclier Hylien', 'Augmente la dfense contre les projectiles.', 1),
('Pouvoir de lumire', 'Inflige des dgts massifs aux ennemis des tnbres.', 2),
('Bndiction aquatique', 'Soigne les blessures au contact de l eau.', 3),
('Force brute', 'Permet de soulever des rochers normes.', 4),
('Vitesse du vent', 'Augmente la vitesse de dplacement.', 5),
('Danse Gerudo', 'Distrait les ennemis proches.', 6),
('Lame spectrale', 'Frappe avec une lame fantomatique.', 7),
('Explosion magique', 'Inflige une onde de choc magique.', 8),
('Invocation d Epona', 'Invoque un cheval fidle.', 9),
('Rgnration sacre', 'Restaure lentement la vie.', 10);

-- 8) objet
INSERT INTO objet (nom, capacite, rarete, id_personnage, id_qute) VALUES
('Epe de Lgende', 'Augmente les dgts contre les ennemis des tnbres.', 'Lgendaire', 1, 2),
('Arc de Lumire', 'Tire des flches de lumire.', 'Epique', 2, 1),
('Trident Zora', 'Amliore les attaques sous l eau.', 'Rare', 3, 6),
('Bouclier des Gorons', 'Protge contre les ruptions volcaniques.', 'Rare', 4, 5),
('Plume Rito', 'Rduit les dgts des chutes.', 'Rare', 5, 9),
('Epe Gerudo', 'Augmente les dgts au corps
corps.', 'Epique', 6, 10),
('Grimoire Korogu', 'Permet d utiliser des pouvoirs forestiers.', 'Rare', 7, 8),
('Cape d ombre', 'Rend invisible pendant un court moment.', 'Lgendaire', 8, 3),
('Harnais d Epona', 'Augmente la vitesse du cheval.', 'Rare', 9, 4),
('Bracelet de force', 'Double la puissance physique.', 'Epique', 10, 7);

-- 9) avoir
INSERT INTO avoir (id_competence, id_personnage) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- 10) modifier
INSERT INTO modifier (id_region, id_evenement) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- 11) participer
INSERT INTO participer (id_qute, id_personnage, statue) VALUES
(1, 1, 'Termin'), (2, 2, 'En cours'), (3, 3, 'Echou'),
(4, 4, 'Termin'), (5, 5, 'Termin'), (6, 6, 'En cours'),
(7, 7, 'Echou'), (8, 8, 'Termin'), (9, 9, 'En cours'),
(10, 10, 'Termin');

-- 12) roder
INSERT INTO roder (id_region, id_ennemi) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

COMMIT;
