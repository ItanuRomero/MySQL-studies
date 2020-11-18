DELETE FROM dept
WHERE DCODIGO in (
    SELECT * FROM (SELECT DCODIGO FROM dept
        INNER JOIN empr on dept.DCODIGO = empr.DEPT
        GROUP BY DCODIGO
        having count(DCODIGO) < 4
    ) AS t
);