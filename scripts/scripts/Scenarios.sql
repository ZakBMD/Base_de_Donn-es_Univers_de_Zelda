-- 1. Listez tous les personnages et leurs niveaux
SELECT nom, niveau FROM personnage;

-- 2. Compétences et rareté
SELECT nom, rarete FROM competence;

-- 3. Ennemis triés par niveau décroissant
SELECT nom, niveau FROM ennemi ORDER BY niveau DESC;

-- 4. Titres et impacts des événements
SELECT titre, impacte FROM evenement;

-- 5. Objets de rareté 'Rare'
SELECT nom, capacite FROM objet WHERE rarete = 'Rare';

-- 6. Personnages qui participent aux quêtes avec le titre de la quête
SELECT p.nom AS personnage, q.titre AS qute
FROM participer pa
JOIN personnage p ON pa.id_personnage = p.id_personnage
JOIN "qute" q ON pa.id_qute = q.id_qute;

-- 7. Objets possédés par 'Link'
SELECT o.nom, o.capacite
FROM objet o
JOIN personnage p ON o.id_personnage = p.id_personnage
WHERE p.nom = 'Link';

-- 8. Compétences 'Légendaires' et personnages
SELECT p.nom AS personnage, c.nom AS competence
FROM avoir a
JOIN personnage p ON a.id_personnage = p.id_personnage
JOIN competence c ON a.id_competence = c.id_competence
WHERE c.rarete = 'Lgendaire';

-- 9. Quêtes disponibles dans 'Plaine d Hyrule'
SELECT q.titre, q.description
FROM "qute" q
JOIN region r ON q.id_region = r.id_region
WHERE r.nom = 'Plaine d Hyrule';

-- 10. Ennemis présents dans chaque région
SELECT r.nom AS region, e.nom AS ennemi
FROM roder ro
JOIN region r ON ro.id_region = r.id_region
JOIN ennemi e ON ro.id_ennemi = e.id_ennemi;

-- 11. Augmenter de 1 le niveau des personnages en sous-niveau par rapport aux quêtes
UPDATE personnage
SET niveau = niveau + 1
WHERE id_personnage IN (
  SELECT p.id_personnage
  FROM participer p
  JOIN "qute" q ON p.id_qute = q.id_qute
  WHERE q.niveau_diff > (SELECT niveau FROM personnage WHERE id_personnage = p.id_personnage)
);

-- 12. Régions où des événements 'Renforcent'
SELECT r.nom, e.titre
FROM modifier m
JOIN region r ON m.id_region = r.id_region
JOIN evenement e ON m.id_evenement = e.id_evenement
WHERE e.impacte LIKE 'Renforce%';

-- 13. Personnages et leurs pouvoirs
SELECT p.nom AS personnage, po.nom AS pouvoir, po.description
FROM pouvoir po
JOIN personnage p ON po.id_personnage = p.id_personnage;

-- 14. Quêtes associées à des objets 'Légendaires'
SELECT q.titre, o.nom AS objet
FROM "qute" q
JOIN objet o ON q.id_qute = o.id_qute
WHERE o.rarete = 'Lgendaire';

-- 15. Personnages avec compétences 'Épiques' ou 'Légendaires'
SELECT DISTINCT p.nom
FROM personnage p
JOIN avoir a ON p.id_personnage = a.id_personnage
JOIN competence c ON a.id_competence = c.id_competence
WHERE c.rarete IN ('Epique', 'Lgendaire');

-- 16. Personnages possédant un objet que 'Zelda' possède aussi
SELECT DISTINCT p1.nom
FROM personnage p1
JOIN objet o1 ON p1.id_personnage = o1.id_personnage
WHERE o1.nom IN (
  SELECT o2.nom
  FROM objet o2
  JOIN personnage p2 ON o2.id_personnage = p2.id_personnage
  WHERE p2.nom = 'Zelda'
);

-- 17. Supprimer les participations échouées à des quêtes trop difficiles
DELETE FROM participer
WHERE statue = 'Echou'
AND id_personnage IN (
  SELECT p.id_personnage
  FROM participer p
  JOIN "qute" q ON p.id_qute = q.id_qute
  WHERE q.niveau_diff > (SELECT niveau FROM personnage WHERE id_personnage = p.id_personnage)
);

-- 18. Régions sans aucune quête
SELECT r.nom
FROM region r
WHERE NOT EXISTS (
  SELECT 1 FROM "qute" q WHERE q.id_region = r.id_region
);

-- 19. Personnages et leurs objets, triés par rareté décroissante
SELECT p.nom AS personnage, o.nom AS objet, o.rarete
FROM objet o
JOIN personnage p ON o.id_personnage = p.id_personnage
ORDER BY o.rarete DESC;

-- 20. Personnages et leurs compétences, triées par rareté décroissante
SELECT p.nom AS personnage, c.nom AS competence, c.rarete
FROM avoir a
JOIN personnage p ON a.id_personnage = p.id_personnage
JOIN competence c ON a.id_competence = c.id_competence
ORDER BY c.rarete DESC;

-- 21. Noms de tous les personnages
SELECT nom FROM personnage;

-- 22. Ajouter un objet 'Potion de Mana' (restauration de magie)
INSERT INTO objet (nom, capacite, rarete, id_personnage, id_qute)
VALUES ('Potion de Mana', 'restauration de magie', 'Rare', 1, 1);

-- 23. Supprimer l’ennemi 'Gobelin'
DELETE FROM ennemi WHERE nom = 'Gobelin';

-- 24. Augmenter de 1 le niveau de 'Link'
UPDATE personnage SET niveau = niveau + 1 WHERE nom = 'Link';

-- 25. Personnages avec leur région de résidence
SELECT p.nom AS personnage, r.nom AS region
FROM personnage p
JOIN region r ON p.id_region = r.id_region;

-- 26. Ajouter la région 'Chteau d Hyrule'
INSERT INTO region (nom, climat, relief, nature)
VALUES ('Chteau d Hyrule', 'Tempr', 'Montagneux', 'Chteau');

-- 27. Objets rares possédés par 'Link'
SELECT o.nom, o.rarete
FROM objet o
JOIN personnage p ON o.id_personnage = p.id_personnage
WHERE p.nom = 'Link' AND o.rarete = 'Rare';

-- 28. Augmenter le niveau des participants à des quêtes trop difficiles
UPDATE personnage
SET niveau = niveau + 1
WHERE id_personnage IN (
  SELECT p.id_personnage
  FROM participer p
  JOIN "qute" q ON p.id_qute = q.id_qute
  WHERE q.niveau_diff > (SELECT niveau FROM personnage WHERE id_personnage = p.id_personnage)
);

-- 29. Personnages possédant un objet que 'Zelda' possède aussi (variante avec alias)
SELECT DISTINCT p1.nom AS personnage
FROM personnage p1
JOIN objet o1 ON p1.id_personnage = o1.id_personnage
WHERE o1.nom IN (
  SELECT o2.nom
  FROM objet o2
  JOIN personnage p2 ON o2.id_personnage = p2.id_personnage
  WHERE p2.nom = 'Zelda'
);

-- 30. Supprimer toutes les participations échouées à des quêtes trop difficiles
DELETE FROM participer
WHERE statue = 'Echou'
AND id_personnage IN (
  SELECT p.id_personnage
  FROM participer p
  JOIN "qute" q ON p.id_qute = q.id_qute
  WHERE q.niveau_diff > (SELECT niveau FROM personnage WHERE id_personnage = p.id_personnage)
);
