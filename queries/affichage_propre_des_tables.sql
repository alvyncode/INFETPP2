-- Active: 1764079362002@@localhost@3306@infetppt2
-- Affichage de la liaison nombre de retraite et age moyen de départ en retraite
SELECT 
    n.annee,
    n.nombre_total,
    a.age_moyen_ensemble
FROM nombre_de_retraite_hf_de_2002_a_2022 AS n
INNER JOIN age_moyen_de_depart_en_retraite AS a
    ON a.annee = n.age_moyen_de_la_retraite_annee;

-- Total d'offre d'emploi (CDI) par année 
SELECT 
    annee,
    SUM(cdi) AS offre_cdi_total
FROM offre_d_emploi_diffuse
GROUP BY annee;

-- Total d'offre d'emploi (CDD) par année 
SELECT
    annee,
    sum(cdd_de_plus_de_six_mois + cdd_de_un_a_six_mois + cdd_de_moins_d_un_mois)
    AS offre_total_cdd
FROM offre_d_emploi_diffuse
GROUP BY annee;

-- Comparatif cdi et cdd sur la même année
SELECT 
    annee,
    SUM(cdi) AS offre_total_cdi,
    SUM(cdd_de_moins_d_un_mois + cdd_de_plus_de_six_mois + cdd_de_un_a_six_mois) AS offre_cdd_total
FROM offre_d_emploi_diffuse
GROUP BY annee;

--Total de personne embochée en cdi par année
SELECT 
    annee,
    sum(dpae_csv) AS total_emboche_cdi
FROM declaration_prealable_a_l_emboche
WHERE nature_du_contract LIKE'CDI'
GROUP BY annee

--Total de personnes embochées en cdd par année
SELECT 
    annee,
    sum(dpae_csv) AS total_emboche_cdd
FROM declaration_prealable_a_l_emboche
WHERE nature_du_contract LIKE'CDD%'
GROUP BY annee

-- Comparatif emboche cdi et cdd par année
SELECT 
    annee,
    SUM(CASE WHEN nature_du_contract = 'CDI' THEN dpae_csv ELSE 0 END) AS total_embauche_cdi,
    SUM(CASE WHEN nature_du_contract LIKE 'CDD%' THEN dpae_csv ELSE 0 END) AS total_embauche_cdd
FROM declaration_prealable_a_l_emboche
GROUP BY annee
