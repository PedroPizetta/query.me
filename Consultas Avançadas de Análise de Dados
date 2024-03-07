-- Seleção de Dados
SELECT 
    Nome, Idade
FROM 
    Clientes
WHERE 
    Cidade = 'São Paulo'
ORDER BY 
    Idade;

-- Junções de Tabelas
SELECT 
    Pedidos.ID, Clientes.Nome
FROM 
    Pedidos
INNER JOIN 
    Clientes ON Pedidos.ClienteID = Clientes.ID;

-- Agregação de Dados
SELECT 
    Categoria, AVG(Preco) AS PrecoMedio
FROM 
    Produtos
GROUP BY 
    Categoria;

-- Atualização de Dados
UPDATE 
    Produtos
SET 
    Preco = Preco * 1.1
WHERE 
    Categoria = 'Eletrônicos';

-- Inserção de Dados
INSERT INTO 
    Pedidos (ClienteID, DataPedido, Total)
VALUES 
    (101, '2023-09-15', 500.00);

-- Criação de Visualizações
CREATE VIEW 
    VendasTotais AS
SELECT 
    ClienteID, SUM(Total) AS TotalVendas
FROM 
    Pedidos
GROUP BY 
    ClienteID;

-- Criação de Funções e Procedimentos Armazenados

-- Função Escalar para Calcular Idade com Base na Data de Nascimento
CREATE FUNCTION CalcularIdade (@DataNascimento DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Idade INT
    SET @Idade = DATEDIFF(YEAR, @DataNascimento, GETDATE())
    RETURN @Idade
END;

-- Procedimento Armazenado para Atualizar Preços de Produtos
CREATE PROCEDURE AtualizarPrecosProdutos
AS
BEGIN
    UPDATE Produtos
    SET Preco = Preco * 1.1
    WHERE Categoria = 'Eletrônicos'
END;

-- Otimização de Consultas

-- Exemplo de Índice para Melhorar o Desempenho da Consulta
CREATE INDEX idx_Clientes_Cidade ON Clientes (Cidade);

-- Manipulação de Dados em Lotes

-- Exemplo de Transação para Manipulação de Dados em Lotes
BEGIN TRANSACTION;
UPDATE Produtos
SET Estoque = Estoque - 1
WHERE Categoria = 'Eletrônicos';

DELETE FROM Pedidos
WHERE DataPedido < DATEADD(MONTH, -6, GETDATE());
COMMIT TRANSACTION;

-- Manipulação de Dados JSON

-- Exemplo de Consulta e Manipulação de Dados JSON
SELECT JSON_VALUE(Dados, '$.Nome') AS Nome
FROM TabelaJSON;

-- Consultas Avançadas

-- Consulta Complexa para Análise de Vendas por Região e Categoria de Produto
WITH VendasPorRegiao AS (
    SELECT
        R.Nome AS Regiao,
        P.Categoria,
        SUM(V.Quantidade * V.PrecoUnitario) AS TotalVendas
    FROM Vendas V
    JOIN Produtos P ON V.ProdutoID = P.ProdutoID
    JOIN Regioes R ON V.RegiaoID = R.RegiaoID
    WHERE V.DataVenda BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY R.Nome, P.Categoria
),
RankingPorRegiao AS (
    SELECT
        Regiao,
        Categoria,
        TotalVendas,
        ROW_NUMBER() OVER (PARTITION BY Regiao ORDER BY TotalVendas DESC) AS Ranking
    FROM VendasPorRegiao
)
SELECT
    Regiao,
    Categoria,
    TotalVendas,
    CASE
        WHEN Ranking = 1 THEN 'Melhor Categoria'
        WHEN Ranking = 2 THEN 'Segunda Melhor Categoria'
        WHEN Ranking = 3 THEN 'Terceira Melhor Categoria'
        ELSE 'Outras Categorias'
    END AS PosicaoRanking
FROM RankingPorRegiao
WHERE Ranking <= 3;

-- Consulta Utilizando PIVOT para Análise de Vendas Mensais por Produto
SELECT *
FROM (
    SELECT
        P.Nome AS Produto,
        MONTH(V.DataVenda) AS Mes,
        SUM(V.Quantidade * V.PrecoUnitario) AS TotalVendas
    FROM Vendas V
    JOIN Produtos P ON V.ProdutoID = P.ProdutoID
    WHERE YEAR(V.DataVenda) = 2023
    GROUP BY P.Nome, MONTH(V.DataVenda)
) AS VendasMensais
PIVOT (
    SUM(TotalVendas)
    FOR Mes IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
) AS PivotVendasPorMes;

-- Análise de Cohort
SELECT
    cohort_date,
    COUNT(DISTINCT customer_id) AS num_customers
FROM
    (
    SELECT
        customer_id,
        MIN(order_date) AS cohort_date,
        DATEDIFF(MONTH, MIN(order_date), order_date) AS cohort_month
    FROM
        orders
    GROUP BY
        customer_id
    ) AS cohorts
GROUP BY
    cohort_date
ORDER BY
    cohort_date;

-- Análise de Funil de Vendas
WITH funnel AS (
    SELECT
        status,
        COUNT(*) AS num_leads
    FROM
        leads
    GROUP BY
        status
)
SELECT
    status,
    num_leads,
    SUM(num_leads) OVER (ORDER BY status) AS total_leads
FROM
    funnel;

-- Segmentação de Clientes
SELECT
    CASE
        WHEN revenue > 1000 THEN 'High Value'
        WHEN revenue > 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    COUNT(*) AS num_customers
FROM
    customers
GROUP BY
    CASE
        WHEN revenue > 1000 THEN 'High Value'
        WHEN revenue > 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END;

-- Previsão de Demanda
SELECT
    date,
    SUM(quantity_sold) AS total_sales
FROM
    sales
GROUP BY
    date
ORDER BY
    date;

-- Análise de Redes Sociais
SELECT
    user_id,
    COUNT(*) AS num_connections
FROM
    connections
GROUP BY
    user_id
ORDER BY
    num_connections DESC;

-- Análise de Séries Temporais
SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS num_orders
FROM
    orders
GROUP BY
    month
ORDER BY
    month;
