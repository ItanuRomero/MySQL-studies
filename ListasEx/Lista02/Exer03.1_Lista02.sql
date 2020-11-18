SELECT COUNT(DISTINCT dept.DCODIGO) AS "Quantidade de Departamentos com Empregados" FROM dept
    INNER JOIN empr on dept.DCODIGO = empr.DEPT;