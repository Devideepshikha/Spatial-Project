ALTER TABLE michiganhistorics DROP COLUMN markertype;
ALTER TABLE michiganhistorics DROP COLUMN nationalregistrydate;
ALTER TABLE michiganhistorics DROP COLUMN markerissues;
ALTER TABLE michiganhistorics DROP COLUMN markernameother;
ALTER TABLE michiganhistorics DROP COLUMN markertitleback;
ALTER TABLE michiganhistorics DROP COLUMN markerdescback;
ALTER TABLE michiganhistorics DROP COLUMN markerlocationzip;
ALTER TABLE michiganhistorics DROP COLUMN tagsconcatenate;
ALTER TABLE michiganhistorics DROP COLUMN tag1;
ALTER TABLE michiganhistorics DROP COLUMN tag2;
ALTER TABLE michiganhistorics DROP COLUMN tag3;
ALTER TABLE michiganhistorics DROP COLUMN tag4;
ALTER TABLE michiganhistorics DROP COLUMN significantdate;
ALTER TABLE michiganhistorics DROP COLUMN photoalttext;
ALTER TABLE michiganhistorics DROP COLUMN photocount;
ALTER TABLE michiganhistorics DROP COLUMN thumbnailphotoname;

SELECT COUNT(*) AS null_count
FROM michiganhistorics
WHERE markerlocationstate IS NULL;

SELECT COUNT(*) AS blank_count
FROM michiganhistorics
WHERE markerlocationstate = '';

DELETE FROM michiganhistorics
WHERE markerlocationstate IS NULL;

DELETE FROM michiganhistorics
WHERE markerlocationstate = '';


SELECT COUNT(*) AS MI_count
FROM michiganhistorics
WHERE markerlocationstate = 'MI';
SELECT markerlocationcity, COUNT(*) AS marker_count, latitude, longitude
FROM michiganhistorics
WHERE markerlocationstate = 'MI'
GROUP BY markerlocationcity, latitude, longitude
ORDER BY marker_count DESC;

SELECT DISTINCT markerlocationstate
FROM michiganhistorics;

SELECT markerlocationstate, markerlocationcity, COUNT(*) AS marker_count, latitude, longitude
FROM michiganhistorics
WHERE markerlocationstate IN ('IN', 'KY', 'MD', 'PA', 'TN')
GROUP BY markerlocationstate, markerlocationcity, latitude, longitude
ORDER BY marker_count DESC;
