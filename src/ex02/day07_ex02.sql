WITH
    PizzeriaVisit AS (
        SELECT pz.name, COUNT(*) AS count, 'visit' AS action_type
        FROM person_visits pv
            JOIN pizzeria pz ON pv.pizzeria_id = pz.id
        GROUP BY
            pz.name
        ORDER BY count DESC
        LIMIT 3
    ),
    PizzeriaOrder AS (
        SELECT pz.name, COUNT(*) AS count, 'order' AS action_type
        FROM
            person_order po
            JOIN menu m ON po.menu_id = m.id
            JOIN pizzeria pz ON m.pizzeria_id = pz.id
        GROUP BY
            pz.name
        ORDER BY count DESC
        LIMIT 3
    )
SELECT name, count, action_type
FROM PizzeriaVisit
UNION ALL
SELECT name, count, action_type
FROM PizzeriaOrder
ORDER BY action_type ASC, count DESC;