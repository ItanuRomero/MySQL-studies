SELECT SOBRENOME, SALARIO, CARGO, NIVELED FROM `empr` WHERE SALARIO > 40000 OR (CARGO = "Gerente" AND NIVELED < 16)