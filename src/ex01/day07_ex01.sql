SELECT p.name, COUNT(*) AS count_of_visits
FROM person p
    JOIN person_visits pv ON p.id = pv.person_id
GROUP BY
    p.name
ORDER BY count_of_visits DESC, name ASC
LIMIT 4;