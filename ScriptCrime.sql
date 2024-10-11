USE BerlinStats;

# H2: Where are the key crime hotspots in Berlin?
CREATE VIEW crime_hotspots AS
SELECT location, 
       SUM(robbery) AS total_robbery,
       SUM(street_robbery) AS total_street_robbery,
       SUM(injury) AS total_injury, 
       SUM(agg_assault) AS total_agg_assault,
       SUM(threat) AS total_threat,
       SUM(theft) AS total_theft,
       SUM(car) AS total_car,
       SUM(from_car) AS total_from_car,
       SUM(bike) AS total_bike,
       SUM(bulgary) AS total_bulgary,
       SUM(fire) AS total_fire,
       SUM(arson) AS total_arson,
       SUM(damage) AS total_damage,
       SUM(grafitti) AS total_graffiti,
       SUM(drugs) AS total_drugs
FROM crime_stats
GROUP BY location
ORDER BY SUM(robbery + street_robbery + injury + agg_assault + threat + theft + car + from_car + bike + bulgary + fire + arson + damage + grafitti + drugs) DESC;

SELECT * FROM BerlinStats.crime_hotspots;


# Q1: Are certain types of crimes more common in specific districts of Berlin?
#CREATE VIEW districts_and_types AS
SELECT name, 
		SUM(robbery) AS toal_robbery,
        SUM(street_robbery) AS total_street_robbery,
       SUM(injury) AS total_injury, 
       SUM(agg_assault) AS agg_assault,
       SUM(threat) AS total_threat,
       SUM(theft) AS total_theft,
       SUM(car) AS total_car,
       SUM(from_car) AS total_from_car,
       SUM(bike) AS total_bike,
       SUM(bulgary) AS total_bulgary,
       SUM(fire) AS total_fire,
       SUM(arson) AS total_arson,
       SUM(damage) AS total_damage,
       SUM(grafitti) AS total_grafitti,
       SUM(drugs) AS total_drugs
FROM crime_stats 
JOIN district
ON Crime_stats.District_District_id = District.District_id
GROUP BY name;


#Q3: How have crime trends in berlin developed over time?
CREATE VIEW crime_developement AS
SELECT year AS year,
       SUM(robbery) AS total_robbery,
       SUM(street_robbery) AS total_street_robbery,
       SUM(injury) AS total_injury, 
       SUM(agg_assault) AS total_agg_assault,
       SUM(threat) AS total_threat,
       SUM(theft) AS total_theft,
       SUM(car) AS total_car,
       SUM(from_car) AS total_from_car,
       SUM(bike) AS total_bike,
       SUM(bulgary) AS total_bulgary,
       SUM(fire) AS total_fire,
       SUM(arson) AS total_arson,
       SUM(damage) AS total_damage,
       SUM(grafitti) AS total_grafitti,
       SUM(drugs) AS total_drugs,
       SUM(robbery + street_robbery + injury + agg_assault + threat + theft + car + from_car + bike + bulgary + fire + arson + damage + grafitti + drugs) AS total_crimes
FROM crime_stats 
JOIN year ON Crime_stats.year_year_id = year_id
GROUP BY year
ORDER BY year;
