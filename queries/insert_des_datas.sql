-- Active: 1764079362002@@localhost@3306@infetppt2

-- Insertion du csv age_moyen_de_depart_en_retraite.csv
LOAD DATA INFILE 'C:/Users/alvyn/OneDrive/Documents/INFETPP2/jeu_de_donnee/etude_de_la_retraite/age_moyen_de_depart_en_retraite.csv'
INTO TABLE age_moyen_de_depart_en_retraite
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Insertion du csv effectif_de_retraite_hf_de_2004_a_2022.csv en bdd
LOAD DATA INFILE 'C:/Users/alvyn/OneDrive/Documents/INFETPP2/jeu_de_donnee/etude_de_la_retraite/effectif_de_retraite_hf_de_2004_a_2022.csv'
INTO TABLE nombre_de_retraite_hf_de_2002_a_2022
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Insertion du csv tension_dans_le_secteur_de_l_IT.csv en bdd
LOAD DATA INFILE 'C:/Users/alvyn/OneDrive/Documents/INFETPP2/jeu_de_donnee/tension_dans_le_secteur_de_l_IT/tension_dans_le_secteur_de_l_IT.csv'
INTO TABLE tension_dans_le_secteur_de_l_IT
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Insertion du csv evolution_des_contract.csv en bdd
LOAD DATA INFILE 'C:/Users/alvyn/OneDrive/Documents/INFETPP2/jeu_de_donnee/offre_d_emploi_et_evolution_temporelle/evolution_des_contract.csv'
INTO TABLE age_moyen_de_depart_en_retraite
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Insertion du csv relatif au déclaration_préalables_a_l_emploi_en_france en bdd
LOAD DATA INFILE 'C:/Users/alvyn/OneDrive/Documents/INFETPP2/jeu_de_donnee/offre_d_emploi_et_evolution_temporelle/dpae-mensuelles-france-entiere.csv'
INTO TABLE declaration_prealable_a_l_emboche
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;