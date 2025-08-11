-- dedupe_example.sql
SELECT normalized_name, COUNT(*)
FROM (
  SELECT LOWER(REGEXP_REPLACE(name,'[^a-zA-Z0-9]','','g')) as normalized_name
  FROM donors
) t
GROUP BY normalized_name
HAVING COUNT(*) > 1;
