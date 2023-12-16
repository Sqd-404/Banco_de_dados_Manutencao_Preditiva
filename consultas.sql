USE Predictive_Maintence;

-- Retorna o(s) modelo(s) com maior número de falhas
SELECT modelo_maquina.nome , total_falhas
FROM (
    SELECT maquina.modelID, COUNT(*) AS total_falhas
    FROM maquina
    JOIN falha ON maquina.machineID = falha.machineID
    GROUP BY maquina.modelID
) AS subquery
JOIN modelo_maquina ON subquery.modelID = modelo_maquina.modelID
WHERE total_falhas = (
    SELECT MAX(total_falhas)
    FROM (
        SELECT COUNT(*) AS total_falhas
        FROM maquina
        JOIN falha ON maquina.machineID = falha.machineID
        GROUP BY maquina.modelID
    ) AS subquery_max
);

-- Retorna o número de falhas por idade
SELECT maquina.age, COUNT(falha.date_time) AS total_falhas 
FROM maquina
LEFT JOIN falha ON maquina.machineID = falha.machineID
GROUP BY maquina.age
ORDER BY maquina.age;

-- Retorna os componentes que maior número de falhas por máquina
SELECT maquina.machineID, maquina.modelID, falha.failure_comp, comp.nome AS nome_componente, COUNT(*) AS total_falhas
FROM maquina
JOIN falha ON maquina.machineID = falha.machineID
JOIN comp ON falha.failure_comp = comp.compID
GROUP BY maquina.machineID, falha.failure_comp
ORDER BY maquina.machineID, total_falhas DESC;

-- Retorna a idade média das máquinas por modelo
SELECT modelID, AVG(age) AS media_idade
FROM maquina
GROUP BY modelID;

-- Retorna a quantidade de erro por tipo de erro e modelo da máquina
SELECT maquina.modelID, erro_tipo.nome AS tipo_erro, COUNT(*) AS quantidade_erros
FROM maquina
JOIN erro ON maquina.machineID = erro.machineID
JOIN erro_tipo ON erro.errorID = erro_tipo.errorID
GROUP BY maquina.modelID, erro_tipo.nome
ORDER BY maquina.modelID, quantidade_erros DESC;