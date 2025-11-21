# Análise de Dados PetShop: Receita, Performance e Fidelidade de Clientes

## Introdução ao Projeto

Este projeto consiste na minha primeira análise de dados completa, com o objetivo de transformar dados operacionais de um Pet Shop fictício em *insights* de negócio acionáveis.

Utilizando um banco de dados relacional e visualização de dados, a análise se concentra em três pilares principais: **receita e mix de serviços**, **eficiência operacional e perfil de gasto** e **comportamento/fidelidade de clientes**.

O projeto demonstra as habilidades de:
1.  **Modelagem de Dados:** Criação de um esquema de banco de dados do zero.
2.  **Consulta SQL:** Desenvolvimento de consultas complexas e analíticas.
3.  **Visualização de Dados:** Construção de um Dashboard interativo para apresentação de resultados.

---

## Conteúdo do Repositório

| Arquivo | Descrição | Tecnologia |
| :--- | :--- | :--- |
| `Banco de Dados - PetShop.sql` | O script completo para a criação das tabelas, chaves, stored procedures e inserção de dados iniciais do banco de dados (DDL e DML). | SQL (T-SQL) |
| `Modelo Conceitual - PetShop.brM3` | O diagrama de **Entidade-Relacionamento** que define a estrutura lógica do banco de dados.  | BrModelo |
| `Consultas_Analise_PetShop.sql` | Contém todas as consultas SQL utilizadas para extrair e agregar os dados brutos, gerando as métricas de negócio para a análise. | SQL (T-SQL) |
| `DashBoard - PetShop.pbix` | O arquivo do projeto **Power BI**, que inclui a conexão com a base de dados, transformações (Power Query) e o modelo final de visualização. | Power BI Desktop |

---

## Objetivos da Análise

O projeto foi guiado pelas seguintes perguntas de negócio, baseadas nas métricas visuais dos Dashboards:

### Otimização de Receita e Mix de Serviços
1.  Qual é o serviço com o **maior Ticket Médio** e como isso se relaciona com o **Faturamento Total** que ele gera?
2.  Clientes de qual **faixa etária** estão gastando mais por agendamento e como podemos direcionar ofertas de maior valor para eles?

### Eficiência Operacional e Comportamento do Cliente
3.  Qual é o **dia da semana com maior volume de agendamentos** e como otimizar a escala de funcionários para cobrir essa demanda?
4.  Qual é a **proporção de clientes com múltiplos pets** e como garantir a fidelidade desse grupo majoritário?

### Perfil Demográfico dos Pets
5.  Qual **espécie (Cachorro) e gênero (Masculino)** domina a base de clientes em termos de faturamento, e quais serviços ou produtos poderiam ser desenvolvidos para esse público?

---

## Tecnologias e Ferramentas

| Categoria | Tecnologia | Uso no Projeto |
| :--- | :--- | :--- |
| **Banco de Dados** | SQL Server | Modelagem, criação do esquema e armazenamento de dados. |
| **Modelagem** | BrModelo | Criação do Modelo Conceitual e Lógico. |
| **Análise de Dados** | T-SQL | Escrita de consultas complexas (`JOIN`, `GROUP BY`, `HAVING`, `Subconsultas`). |
| **Visualização/BI** | Power BI Desktop | Conexão de dados, modelagem DAX e construção do dashboard interativo. |

---

## Principais Insights e Resultados

A partir da análise das consultas e do Dashboard de BI, destacam-se os seguintes pontos, alinhados aos objetivos:

### Faturamento, Mix de Serviços e Clientes

| Objetivo de Negócio | Insight Chave | Ação Estratégica Sugerida |
| :--- | :--- | :--- |
| **1. Otimização de Receita** | O serviço de **Banho e Tosa** e **Banho** são os maiores pilares de faturamento (juntos, respondem por mais de R$ 900), apesar de terem um Ticket Médio menor do que **Hospedagem** (R$ 70,00). | Focar em aumentar o volume de serviços de alto Ticket Médio (Hospedagem, Creche) através de pacotes de fidelidade, sem despriorizar o volume de Banho e Tosa. |
| **5. Perfil de Pet** | **Cachorros** e pets de **Gênero Masculino** dominam o faturamento do Pet Shop, correspondendo a **88.06%** e **74.13%**, respectivamente. | Direcionar o estoque de produtos (brinquedos, rações, etc.) e o marketing digital para o perfil de Cachorros Machos, explorando o público principal. |
| **4. Valor do Cliente** | Clientes com **múltiplos pets** (Tipo Valiosa) representam **96.55%** da base de clientes. | Criar um programa de fidelidade exclusivo ou descontos progressivos para clientes que trazem mais de um pet, reconhecendo seu alto valor para o negócio. |

### Eficiência Operacional e Perfil de Gasto

| Objetivo de Negócio | Insight Chave | Evidência no Dashboard |
| :--- | :--- | :--- |
| **2. Cliente de Alto Valor** | A faixa etária **50+** possui o maior Ticket Médio por Faixa Etária (cerca de **R$ 80,00**), indicando maior poder de compra ou consumo de serviços premium. | Focar a comunicação de novos serviços (ex: Hidratação, Corte de Unhas) e produtos de maior valor agregado neste grupo demográfico. |
| **3. Distribuição de Demanda** | A **Quinta-feira** concentra o pico de agendamentos da semana (6 agendamentos), enquanto os outros dias da semana se mantêm estáveis (4 agendamentos). | O gráfico de Distribuição Total de Agendamentos por Dias da Semana mostra a barra da quinta-feira significativamente mais alta. |

<img width="1479" height="830" alt="Dashboard de Visão Geral do Negócio" src="https://github.com/user-attachments/assets/ad6a7843-1e56-4b93-b634-acad6cace88b" />
<img width="1473" height="819" alt="Dashboard de Análise de Eficiência e Valor do Cliente" src="https://github.com/user-attachments/assets/190b91ca-0f65-4896-b8d4-b8a52ee10e66" />

---

## Como Visualizar e Executar o Projeto Localmente

Siga os passos para configurar o ambiente e explorar o projeto:

### 1. Configurar o Banco de Dados

1.  Instale um SGBD de sua preferência (ex: SQL Server Management Studio, Azure Data Studio, DBeaver, etc.).
2.  Abra o script `Banco de Dados - PetShop.sql`.
3.  Execute o script para criar o banco de dados `db_PetShop`, todas as tabelas e popular com os dados iniciais.

### 2. Explorar as Consultas

1.  No seu SGBD, abra o script `Consultas_Analise_PetShop.sql`.
2.  Execute as consultas na ordem para ver como as métricas de negócio (Receita por Serviço, Performance, etc.) foram extraídas.

### 3. Acessar o Dashboard

1.  Instale o **Power BI Desktop**.
2.  Abra o arquivo `DashBoard - PetShop.pbix`.
3.  **Atenção:** Se o Power BI solicitar credenciais, pode ser necessário atualizar a fonte de dados para que aponte para o servidor local onde você configurou o `db_PetShop`.

---

## Autor

* **Eduardo de Carvalho**
* **LinkedIn:** https://www.linkedin.com/in/eduardo-carvalho-b19681306
* **GitHub:** https://github.com/LennOak
* **Email:** ec.eduardocarvalho14@gmail.com
