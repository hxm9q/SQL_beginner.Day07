WITH
    PizzeriaVisit AS (
        SELECT pz.name AS pizzeria_name, COUNT(*) AS visit_count
        FROM person_visits pv
            JOIN pizzeria pz ON pv.pizzeria_id = pz.id
        GROUP BY
            pz.name
    ),
    PizzeriaOrder AS (
        SELECT pz.name AS pizzeria_name, COUNT(*) AS order_count
        FROM
            person_order po
            JOIN menu m ON po.menu_id = m.id
            JOIN pizzeria pz ON m.pizzeria_id = pz.id
        GROUP BY
            pz.name
    )
SELECT 
    COALESCE(pv.pizzeria_name, po.pizzeria_name) AS name, 
    COALESCE(visit_count, 0) + COALESCE(order_count, 0) AS total_count
FROM PizzeriaVisit pv
    FULL JOIN PizzeriaOrder po ON pv.pizzeria_name = po.pizzeria_name
ORDER BY total_count DESC, name ASC;