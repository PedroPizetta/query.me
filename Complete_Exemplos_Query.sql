---Consultas de Seleção de Dados: Escrever consultas SQL eficientes para extrair informações de bancos de dados, filtrando e ordenando dados conforme necessário.

SELECT Nome, Idade
FROM Clientes
WHERE Cidade = 'São Paulo'
ORDER BY Idade;

---Junções de Tabelas: Demonstrar habilidades em junções para combinar dados de várias tabelas.

SELECT Pedidos.ID, Clientes.Nome
FROM Pedidos
INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ID;
Agregação de Dados: Usar funções de agregação como COUNT, SUM, AVG, etc., para resumir dados.

SELECT Categoria, AVG(Preco) AS PrecoMedio
FROM Produtos
GROUP BY Categoria;

--Atualização de Dados: Atualizar registros existentes.

UPDATE Produtos
SET Preco = Preco * 1.1
WHERE Categoria = 'Eletrônicos';

---Inserção de Dados: Inserir novos registros em tabelas.
 
INSERT INTO Pedidos (ClienteID, DataPedido, Total)
VALUES (101, '2023-09-15', 500.00);

---Criação de Visualizações: Criar visualizações (views) para simplificar consultas complexas ou criar "tabelas virtuais".
 
CREATE VIEW VendasTotais AS
SELECT ClienteID, SUM(Total) AS TotalVendas
FROM Pedidos
GROUP BY ClienteID;

---Criação de Funções e Procedimentos Armazenados: Desenvolver funções escalares, funções de tabela e procedimentos armazenados para automação de tarefas e análises mais avançadas.

---Otimização de Consultas: Demonstrar a capacidade de otimizar consultas para melhorar o desempenho, por exemplo, ao adicionar índices ou otimizar planos de execução.

---Manipulação de Dados em Lotes: Usar operações de lote para realizar operações em vários registros de uma só vez.

--Manipulação de Dados JSON: Trabalhar com dados JSON, incluindo funções de consulta e manipulação de dados JSON.


SELECT JSON_VALUE(Dados, '$.Nome') AS Nome
FROM TabelaJSON;

----Converter uma coluna para um tipo de dados diferente:

  --Suponha que você tenha uma coluna que armazena valores numéricos como strings, e você deseja convertê-los em números inteiros. Você pode fazer isso com CAST da seguinte maneira:

SELECT CAST(NumeroComoString AS INT) AS NumeroInteiro
FROM SuaTabela;
Converter uma data para outro formato:

  ---Se você deseja formatar uma data de uma maneira específica, você pode usar CAST para fazer a conversão. Por exemplo, para formatar uma data no estilo "dd/mm/yyyy", você pode usar:

SELECT CAST(SuaData AS VARCHAR(10)) AS DataFormatada
FROM SuaTabela;

--Converter valores em tipos de dados decimais:

  --Suponha que você tenha uma coluna de números inteiros e deseje convertê-los em números decimais. Você pode fazer assim:


SELECT CAST(NumeroInteiro AS DECIMAL(10, 2)) AS NumeroDecimal
FROM SuaTabela;


--Converter uma string em data:

  --Se você tiver uma string que representa uma data, pode usar CAST para convertê-la em um tipo de dados de data:


SELECT CAST('2023-09-15' AS DATE) AS DataConvertida

  --Converter um valor em tipo de dados binário:
--A função CAST também pode ser usada para converter dados em formato binário:

SELECT CAST(123 AS BINARY(4)) AS ValorBinario


--CONVERT: Semelhante à função CAST, a função CONVERT é usada para converter valores de um tipo de dados em outro. Ela é mais flexível e permite especificar o formato de saída para tipos de dados como datas.

SELECT CONVERT(VARCHAR, SuaData, 103) AS DataFormatada
FROM SuaTabela;

---LEN: Esta função retorna o comprimento de uma cadeia de caracteres (string). Pode ser útil para verificar o tamanho de uma coluna de texto.

SELECT LEN(Texto) AS TamanhoTexto
FROM SuaTabela;

--UPPER e LOWER: Estas funções convertem todas as letras de uma cadeia de caracteres em maiúsculas (UPPER) ou minúsculas (LOWER).

SELECT UPPER(Nome) AS NomeMaiusculo
FROM SuaTabela;

--SUBSTRING: Usada para extrair uma parte de uma cadeia de caracteres com base em uma posição inicial e um comprimento.

SELECT SUBSTRING(Frase, 1, 10) AS ParteDaFrase
FROM SuaTabela;

--DATEPART: Usada para extrair uma parte de uma data (como dia, mês ou ano) para análise ou agregação.

SELECT DATEPART(YEAR, SuaData) AS Ano
FROM SuaTabela;

--COALESCE: Retorna o primeiro valor não nulo em uma lista de valores. É útil para substituir valores nulos por um valor padrão.

SELECT COALESCE(Valor, 'Nenhum') AS ValorNaoNulo
FROM SuaTabela;

---SUM, AVG, MAX, MIN: Essas funções agregam valores em uma coluna, permitindo calcular a soma, média, valor máximo ou mínimo.

SELECT AVG(Preco) AS PrecoMedio
FROM Produtos;

---DATEADD: Adiciona ou subtrai uma quantidade específica de tempo de uma data.

SELECT DATEADD(DAY, 7, SuaData) AS DataMais7Dias
FROM SuaTabela;

---GETDATE: Retorna a data e a hora atuais do sistema.

SELECT GETDATE() AS DataAtual;

---CASE: Usada para criar expressões condicionais. Pode ser usada para criar lógica condicional em consultas.

SELECT Nome,
       CASE
           WHEN Idade > 30 THEN 'Adulto'
           ELSE 'Jovem'
       END AS CategoriaIdade
FROM Pessoas;


-----CTE------

--Exemplo 1 - CTE Simples:


-- Definir uma CTE para listar clientes com mais de 30 anos

  WITH ClientesMaisVelhos AS (
    SELECT Nome, Idade
    FROM Clientes
    WHERE Idade > 30
)
-- Usar a CTE em uma consulta
   
SELECT Nome, Idade
FROM ClientesMaisVelhos;

--Neste exemplo, a CTE "ClientesMaisVelhos" é usada para listar clientes com mais de 30 anos. A consulta principal então seleciona dados dessa CTE.

---Exemplo 2 - CTE Recursiva:

---As CTEs recursivas são usadas quando você precisa fazer consultas hierárquicas, como a pesquisa em uma árvore de dados, como organogramas ou estruturas de produtos.


-- Exemplo de CTE recursiva para listar todos os gerentes em uma hierarquia

  WITH Hierarquia (ID, Nome, GerenteID, Nivel) AS (
    SELECT ID, Nome, GerenteID, 0
    FROM Funcionarios
    WHERE GerenteID IS NULL
    UNION ALL
    SELECT F.ID, F.Nome, F.GerenteID, H.Nivel + 1
    FROM Funcionarios F
    INNER JOIN Hierarquia H ON F.GerenteID = H.ID
)
SELECT ID, Nome, Nivel
FROM Hierarquia;

---Neste exemplo, a CTE recursiva "Hierarquia" é usada para listar todos os funcionários e seus níveis na hierarquia.

---Exemplo 3 - CTE Aninhada:

---CTEs também podem ser aninhadas em consultas. Aqui está um exemplo onde uma CTE aninhada é usada para calcular estatísticas com base em uma CTE principal.


WITH DadosClientes AS (
    SELECT ID, Nome, Compras
    FROM Clientes
),
Estatisticas AS (
    SELECT AVG(Compras) AS MediaCompras, MAX(Compras) AS MaiorCompra
    FROM DadosClientes
)
SELECT D.*, E.MediaCompras, E.MaiorCompra
FROM DadosClientes D
CROSS JOIN Estatisticas E;


--Exemplo 1 - Pivot Simples:

--Suponha que você tenha uma tabela que armazena dados de vendas por mês. Você pode usar PIVOT para transformar esses dados em colunas, mostrando as vendas para cada mês em colunas separadas.


SELECT *
FROM Vendas
PIVOT (
    SUM(ValorVenda)
    FOR Mes IN ([Janeiro], [Fevereiro], [Março])
) AS PivotTable;

--Neste exemplo, os valores de vendas por mês são transformados em colunas com a soma das vendas para cada mês.

--Exemplo 2 - Pivot com Valores Dinâmicos:

--Às vezes, você pode não saber quais valores específicos precisa para o PIVOT com antecedência. Nesse caso, você pode usar uma consulta dinâmica para construir a consulta PIVOT.


DECLARE @ColunasMeses NVARCHAR(MAX)
SELECT @ColunasMeses = STUFF((SELECT distinct ',' + QUOTENAME(Mes) 
            FROM Vendas
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

DECLARE @sql NVARCHAR(MAX)
SET @sql = N'
SELECT *
FROM Vendas
PIVOT (
    SUM(ValorVenda)
    FOR Mes IN (' + @ColunasMeses + ')
) AS PivotTable;'

EXEC sp_executesql @sql;

----Este exemplo constrói a lista de meses dinamicamente e, em seguida, executa a consulta PIVOT.

---Exemplo 3 - Pivot com Função de Agregação:

--Você pode usar funções de agregação, como SUM, COUNT, AVG, para resumir os dados enquanto faz a operação PIVOT.

SELECT *
FROM Vendas
PIVOT (
    SUM(ValorVenda) FOR Mes IN ([Janeiro], [Fevereiro], [Março])
) AS PivotTable;


-- Consulta complexa para análise de vendas por região e categoria de produto

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

-- Consulta utilizando PIVOT para análise de vendas mensais por produto

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
