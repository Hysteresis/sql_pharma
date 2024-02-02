--? SELECT * FROM POPULATION_DATA;


--? SELECT "LOCID", "Time" FROM POPULATION_DATA FETCH FIRST 10 ROWS ONLY;


-- Recuoerer une ligne précise
--? SELECT "LOCID", "Time" FROM POPULATION_DATA OFFSET 4 ROWS FETCH NEXT 2 ROWS ONLY;

-- WHERE
--? SELECT * FROM POPULATION_DATA 
--? WHERE "Location" = 'Algeria';

-- Distinct
--? SELECT DISTINCT("Location") FROM POPULATION_DATA
--? WHERE "Location" LIKE 'A%';

--? SELECT DISTINCT("Location") FROM POPULATION_DATA
--? WHERE "Location" LIKE '%A%';

--? SELECT DISTINCT("Location") FROM POPULATION_DATA
--? WHERE "Location" LIKE '%A';

-- Different
--? SELECT DISTINCT("Location") FROM POPULATION_DATA
--? WHERE "Location" <> 'Angola';

-- IN et NOT IN
--? SELECT DISTINCT("Location") FROM POPULATION_DATA
--? WHERE "Location" IN ('Angola', 'Algeria', 'France');

--? SELECT DISTINCT("Location") FROM POPULATION_DATA
--? WHERE "Location" NOT IN ('Angola', 'Algeria', 'France');

--! UNION, ALIAS, Création de colonne

    -- SELECT COUNT(*) AS nb_lignes
    --     FROM (
    --     SELECT "LOCID", "PopMale" AS "Population_count",
    --             'M' as "Sex_FK"
    --             FROM POPULATION_DATA
    --     UNION
    --     SELECT "LOCID", "PopFemale" AS "Population_count",
    --         'F' as "Sex_FK"
    --         FROM POPULATION_DATA
    -- );


--TODO ECRIRE UNE REQUETE SQL pour :
-- Afficher le nombre d'homme de 10 - 14 ans, en Albanie, en 2013 : 1991
SELECT "PopMale"
FROM POPULATION_DATA
WHERE "Location" = 'Albania' AND "Time" = 2013 AND "AgeGrp" = 'Okt 14';
 
-- Afficher le nombre de femme de 10 - 14 ans, en Albanie, en 2013 : 1990
SELECT "PopFemale"
FROM POPULATION_DATA
WHERE "Location" = 'Albania' AND "Time" = 2013 AND "AgeGrp" = 'Okt 14';


-- Afficher le nombre de français de 10 - 14 ans, en 2013
SELECT SUM("PopMale" + "PopFemale") AS TotalPopulation
FROM POPULATION_DATA
WHERE "Location" = 'France' AND "Time" = 2013 AND "AgeGrp" = 'Okt 14'
GROUP BY ();

-- Trier la population de ces deux précédant pays, selon leur population totale (order by)
select cast(replace(
    "PopTotal",'.',''
    ) as numeric),
       "Location",
       "Time"
    from POPULATION_DATA
    where "Location" in ( 'France','Albania' )
    order by cast(replace(
    "PopTotal",'.',''
    ) as numeric) desc;


-- CASE
SELECT 
DISTINCT
CASE "Location"
    WHEN 'France' THEN 'Paris'
    WHEN 'Spain' THEN 'Madrid'
    ELSE 'No Location'
END AS "Location"
FROM POPULATION_DATA;

SELECT CAST("PopTotal" AS NUMERIC(10, 3)) FROM POPULATION_DATA;
SELECT ROUND(CAST("PopTotal" AS NUMERIC(10, 3)), 2) FROM POPULATION_DATA;

SELECT CONCAT('BLABLA-', "Location") as blabla_col FROM POPULATION_DATA;

SELECT "Location", "Time", SUM(CAST(REPLACE("PopTotal", '.', '') AS NUMERIC)) AS "Somme"
FROM POPULATION_DATA
GROUP BY "Location", "Time"
HAVING "Location" = 'France'
ORDER BY "Location";

