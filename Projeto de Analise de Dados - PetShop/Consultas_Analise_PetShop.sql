USE db_PetShop;

-- 1. RECEITA TOTAL POR SERVIÇO
-- Objetivo: Determinar quais serviços geram mais receita para o Pet Shop.
-- Lógica: Seleciona todos os dados da VIEW 'vw_ReceitaPorServico', que já agrega a receita por tipo de serviço.
SELECT
    *
FROM
    vw_ReceitaPorServico
ORDER BY
    Receita_Total DESC; -- Ordena pela maior receita para ver o Top 1.


-- 2. PERFORMANCE DE FUNCIONÁRIOS
-- Objetivo: Avaliar o desempenho financeiro dos atendentes, medido pela receita que cada um processou.
-- Lógica: Seleciona todos os dados da VIEW 'vw_PerformanceFuncionarios', que totaliza os pagamentos por atendente.
SELECT
    *
FROM
    vw_PerformanceFuncionarios
ORDER BY
    Receita_Processada DESC; -- Ordena para identificar os funcionários com maior receita.


-- 3. DETALHES COMPLETOS DE TODOS OS PAGAMENTOS
-- Objetivo: Fornecer um histórico detalhado de todas as transações, ligando o pagamento ao cliente, método e atendente.
-- Lógica: Seleciona campos específicos da VIEW 'vw_DetalhesPagamentos', que já faz os JOINs necessários entre Pagamentos, Clientes, Métodos e Funcionários.
SELECT
    Cliente,
    Data_Pagamento,
	Metodo_Pagamento,
    Valor_Total,
    Atendente
FROM
    vw_DetalhesPagamentos
ORDER BY
    Data_Pagamento DESC; -- Mostra os pagamentos mais recentes primeiro.


-- 4. PRÓXIMOS 5 AGENDAMENTOS PENDENTES
-- Objetivo: Exibir a lista de pets e clientes que têm agendamentos marcados ('Agendado').
-- Lógica: Faz JOINs de AGENDAMENTOS com PETS e CLIENTES para obter nomes.
-- Filtra: Apenas agendamentos com Status = 'Agendado'.
SELECT TOP 5 -- Limita a 5 resultados para um painel rápido
	C.Nome_Cliente AS Dono_do_Pet,
    P.Nome_Pet,
    P.Especie_Pet,
	A.Data_Agendamento
FROM
    AGENDAMENTOS AS A
INNER JOIN
    PETS AS P ON A.Id_Pet = P.Id_Pet
INNER JOIN
    CLIENTES AS C ON A.Id_Cliente = C.Id_Cliente
WHERE
    A.Status_Agendamento = 'Agendado'
ORDER BY
    A.Data_Agendamento ASC; -- Ordena cronologicamente do mais próximo para o mais distante.


-- 5. SEGMENTAÇÃO DE CLIENTES POR PETS ESPECÍFICOS (GATOS NÃO CASTRADOS)
-- Objetivo: Identificar clientes que possuem gatos que ainda não foram castrados (possível alvo para campanha de castração).
-- Lógica: JOIN de CLIENTES com PETS.
-- Filtra: Pets onde Especie_Pet = 'Gato' E Castrado = 0 (falso).
SELECT DISTINCT -- Garante que o nome de cada cliente apareça apenas uma vez
    C.Nome_Cliente
FROM
    CLIENTES AS C
INNER JOIN
    PETS AS P ON C.Id_Cliente = P.Id_Cliente
WHERE
    P.Especie_Pet = 'Gato' AND P.Castrado = 0;


-- 6. SERVIÇO MAIS POPULAR POR PORTE DO PET (PETS GRANDES)
-- Objetivo: Entender qual serviço é mais procurado para pets de tamanho 'Grande'.
-- Lógica: JOINs entre AGENDAMENTOS, SERVICOS e PETS.
-- Agregação: Conta o total de vendas por Nome_Servico.
-- Filtra: Apenas pets de Tamanho_Pet = 'Grande'.
SELECT TOP 1
    S.Nome_Servico,
    COUNT(ASV.Id_Servico) AS Total_Vendas
FROM
    AGENDAMENTOS_SERVICOS AS ASV
INNER JOIN
    SERVICOS AS S ON ASV.Id_Servico = S.Id_Servico
INNER JOIN
    AGENDAMENTOS AS A ON ASV.Id_Agendamento = A.Id_Agendamento
INNER JOIN
    PETS AS P ON A.Id_Pet = P.Id_Pet
WHERE
    P.Tamanho_Pet = 'Grande'
GROUP BY
    S.Nome_Servico
ORDER BY
    Total_Vendas DESC; -- Mostra apenas o serviço mais vendido no Top 1.


-- 7. FUNCIONÁRIOS ANTIGOS COM SALÁRIO ACIMA DA MÉDIA
-- Objetivo: Identificar funcionários experientes que estão no topo da faixa salarial.
-- Lógica: Subconsulta para calcular a Média Salarial.
-- Filtra: Data_Contratacao antiga E Salario > Média.
SELECT
    Nome_Funcionario,
    Data_Contratacao,
    Salario
FROM
    FUNCIONARIOS
WHERE
    Data_Contratacao < '2021-01-01' -- Contratados antes de 2021
    AND Salario > (SELECT AVG(Salario) FROM FUNCIONARIOS) -- Salário acima da média geral
ORDER BY
    Data_Contratacao ASC;


-- 8. CLIENTES MAIS FIÉIS (COM MÚLTIPLOS PETS)
-- Objetivo: Identificar clientes que trazem mais de um pet, indicando alta fidelidade.
-- Lógica: JOIN de CLIENTES com PETS.
-- Agregação: Conta o total de pets por cliente.
-- Filtra (HAVING): Apenas grupos onde a contagem de pets é maior que 1.
SELECT
    C.Nome_Cliente,
    COUNT(P.Id_Pet) AS Total_Pets
FROM
    CLIENTES AS C
INNER JOIN
    PETS AS P ON C.Id_Cliente = P.Id_Cliente
GROUP BY
    C.Nome_Cliente
HAVING
    COUNT(P.Id_Pet) > 1
ORDER BY
    Total_Pets DESC;


-- 9. MÉTODOS DE PAGAMENTO MAIS POPULARES
-- Objetivo: Analisar quais métodos de pagamento são mais usados e qual a receita gerada por eles.
-- Lógica: JOIN de PAGAMENTOS com METODOS_PAGAMENTO.
-- Agregação: Conta o número de transações e soma a Receita_Gerada por método.
SELECT TOP 4 -- Limita aos 4 métodos mais usados
    MP.Nome_Metodo,
    COUNT(PAG.Id_Pagamento) AS Total_Transacoes,
    SUM(PAG.Valor_Total) AS Receita_Gerada
FROM
    PAGAMENTOS AS PAG
INNER JOIN
    METODOS_PAGAMENTO AS MP ON PAG.Id_Metodo_Pagamento = MP.Id_Metodo_Pagamento
GROUP BY
    MP.Nome_Metodo
ORDER BY
    Total_Transacoes DESC; -- Ordena pelo volume de transações.