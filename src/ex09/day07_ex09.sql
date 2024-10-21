SELECT
    p.address,
    ROUND(
        MAX(p.age) - (
            MIN(p.age) / MAX(p.age::NUMERIC)
        ),
        2
    ) AS formula,
    ROUND(AVG(p.age), 2) AS average,
    CASE
        WHEN MAX(p.age) - (MIN(p.age) / MAX(p.age)) > AVG(p.age) THEN TRUE
        ELSE FALSE
    END AS comparison
FROM person p
GROUP BY
    p.address
ORDER BY p.address;