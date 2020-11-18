SELECT dept.DCODIGO, dept.DNOME, Avg(empr.SALARIO) AS "Salário Médio", empr.SEXO FROM dept INNER JOIN empr ON (empr.DEPT = dept.DCODIGO) GROUP BY dept.DCODIGO, dept.DNOME, empr.SEXO;
