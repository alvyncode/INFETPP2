--1. Comment evolue l'effectif des retraités de 2004 à 2022
SELECT annee, nombre_total
FROM nombre_de_retraite_hf_de_2002_a_2022_en_milliers;

--2. Equation de la droite témoignant de l'évolution des effectifs de retraités
SELECT 
    t1.annee AS annee1,
    t2.annee AS annee2,
    (t2.nombre_total - t1.nombre_total) / (t2.annee - t1.annee) AS pente
FROM nombre_de_retraite_hf_de_2002_a_2022 t1
JOIN nombre_de_retraite_hf_de_2002_a_2022 t2
    ON t2.annee = t1.annee + 1
WHERE t1.annee BETWEEN 2004 AND 2022   -- 2013 → dernière année avant 2014
ORDER BY t1.annee;
SELECT 
    AVG(pente) AS moyenne_des_pentes
FROM (
    SELECT 
        (t2.nombre_total - t1.nombre_total) / (t2.annee - t1.annee) AS pente
    FROM nombre_de_retraite_hf_de_2002_a_2022 t1
    JOIN nombre_de_retraite_hf_de_2002_a_2022 t2
        ON t2.annee = t1.annee + 1
    WHERE t1.annee BETWEEN 2004 AND 2013
) AS sous;
-- Deduction de l'equation de la droite 
-- y = 286.5x + b
-- b = y - 286.5x
-- (en 2004) b = -560078
-- y = 286.5x - 560 078
SELECT annee, age_moyen_ensemble
FROM infetppt2.age_moyen_de_depart_en_retraite;