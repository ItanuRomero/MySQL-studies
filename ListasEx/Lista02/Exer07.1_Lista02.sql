SELECT DEPT, SUM(SALARIO) AS "Média Salarial", COUNT(NOME) AS "Quantidade Funcionário" FROM empr WHERE CARGO != "ATENDTE" GROUP BY DEPT;