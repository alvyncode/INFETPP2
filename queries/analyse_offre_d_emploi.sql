-- 1.Quelles sont les périodes les plus dynamiques en terme de recrutement et pourquoi ?
SELECT
    annee,
    SUM(CASE WHEN trimestre = '1' THEN 
        dpae_csv
    END) AS T1,
    SUM(CASE WHEN trimestre = '2' THEN 
        dpae_csv
    END) AS T2,
    SUM(CASE WHEN trimestre = '3' THEN 
        dpae_csv
    END) AS T3,
    SUM(CASE WHEN trimestre = '4' THEN 
        dpae_csv
    END) AS T4
FROM declaration_prealable_a_l_emboche
GROUP BY annee
ORDER BY annee;

--2. Evolution du recrutement
SELECT  annee,
SUM(dpae_csv)
FROM declaration_prealable_a_l_emboche
GROUP BY annee;
-- 3.Observation de l'évolution de la tension globale par année
SELECT 
    o.annee,
    SUM(d.dpae_csv) AS declaration_de_recrutement,
    SUM(o.cdi 
     + o.cdd_de_plus_de_six_mois 
     + o.cdd_de_un_a_six_mois 
     + o.cdd_de_moins_d_un_mois 
     + o.autre_contrat) AS offre_d_emploi_globale
FROM offre_d_emploi_diffuse AS o
JOIN declaration_prealable_a_l_emboche AS d
    ON d.annee = o.annee
GROUP BY annee;

