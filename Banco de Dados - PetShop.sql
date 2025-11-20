-- Criação do Banco de Dados
CREATE DATABASE db_PetShop;
GO

-- Ativa o banco de dados
USE db_PetShop;
GO

--- Criação das Tabelas ---

-- Tabela para gerenciar informações dos funcionários
CREATE TABLE FUNCIONARIOS (
    Id_Funcionario INT IDENTITY(1,1) PRIMARY KEY,
    CPF_Funcionario VARCHAR(11) UNIQUE NOT NULL,
    Nome_Funcionario VARCHAR(180) NOT NULL,
    Email_Funcionario VARCHAR(255) UNIQUE NOT NULL,
    Data_Nascimento_Funcionario DATE NOT NULL,
    Data_Contratacao DATE NOT NULL,
    Genero_Funcionario VARCHAR(30) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL,
    Status_Funcionario VARCHAR(30) NOT NULL
);

-- Tabela para armazenar os dados dos clientes
CREATE TABLE CLIENTES (
    Id_Cliente INT IDENTITY(1,1) PRIMARY KEY,
    CPF_Cliente VARCHAR(11) UNIQUE NOT NULL,
    Nome_Cliente VARCHAR(180) NOT NULL,
    Email_Cliente VARCHAR(255) UNIQUE NOT NULL,
    Data_Nascimento_Cliente DATE NOT NULL,
    Genero_Cliente VARCHAR(30) NOT NULL
);

-- Tabela para registrar os métodos de pagamento aceitos
CREATE TABLE METODOS_PAGAMENTO (
    Id_Metodo_Pagamento INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Metodo VARCHAR(30) UNIQUE NOT NULL
);

-- Tabela com os serviços oferecidos pelo pet shop
CREATE TABLE SERVICOS (
    Id_Servico INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Servico VARCHAR(100) UNIQUE NOT NULL
);

-- Tabela para os pets dos clientes
CREATE TABLE PETS (
    Id_Pet INT IDENTITY(1,1) PRIMARY KEY,
    Id_Cliente INT NOT NULL,
    Nome_Pet VARCHAR(100) NOT NULL,
    Raca_Pet VARCHAR(80) NOT NULL,
    Especie_Pet VARCHAR(60) NOT NULL,
	Genero_Pet VARCHAR(30) NOT NULL,
    Tamanho_Pet VARCHAR(50) NOT NULL,
    Idade_Pet DECIMAL(10, 2) NOT NULL,
    Vacinado BIT NOT NULL,
    Castrado BIT NOT NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES CLIENTES(Id_Cliente)
);

-- Tabela de preços por serviço e tamanho do pet
CREATE TABLE PRECOS (
    Id_Preco INT IDENTITY(1,1) PRIMARY KEY,
    Id_Servico INT NOT NULL,
    Tamanho_Pet VARCHAR(30) NOT NULL,
    Valor_Tamanho DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_Servico) REFERENCES SERVICOS(Id_Servico)
);

-- Tabela para registrar os agendamentos de serviços
CREATE TABLE AGENDAMENTOS (
    Id_Agendamento INT IDENTITY(1,1) PRIMARY KEY,
    Id_Cliente INT NOT NULL,
    Id_Pet INT NOT NULL,
    Data_Agendamento DATETIME NOT NULL,
    Status_Agendamento VARCHAR(30) NOT NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES CLIENTES(Id_Cliente),
    FOREIGN KEY (Id_Pet) REFERENCES PETS(Id_Pet)
);

-- Tabela que conecta agendamentos aos serviços realizados
CREATE TABLE AGENDAMENTOS_SERVICOS (
    Id_Agendamento_Servico INT IDENTITY(1,1) PRIMARY KEY,
    Id_Agendamento INT NOT NULL,
    Id_Servico INT NOT NULL,
    Observacoes_Servico VARCHAR(255),
    Valor_Cobrado DECIMAL(10, 2),
    FOREIGN KEY (Id_Agendamento) REFERENCES AGENDAMENTOS(Id_Agendamento),
    FOREIGN KEY (Id_Servico) REFERENCES SERVICOS(Id_Servico)
);

-- Tabela para registrar todos os pagamentos
CREATE TABLE PAGAMENTOS (
    Id_Pagamento INT IDENTITY(1,1) PRIMARY KEY,
    Id_Agendamento INT NOT NULL,
    Id_Cliente INT NOT NULL,
    Id_Funcionario INT NOT NULL,
    Id_Metodo_Pagamento INT NOT NULL,
    Valor_Total DECIMAL(10, 2) NOT NULL,
    Data_Pagamento DATETIME NOT NULL,
    Status_Pagamento VARCHAR(30) NOT NULL,
    Observacoes VARCHAR(255),
    FOREIGN KEY (Id_Agendamento) REFERENCES AGENDAMENTOS(Id_Agendamento),
    FOREIGN KEY (Id_Cliente) REFERENCES CLIENTES(Id_Cliente),
    FOREIGN KEY (Id_Funcionario) REFERENCES FUNCIONARIOS(Id_Funcionario),
    FOREIGN KEY (Id_Metodo_Pagamento) REFERENCES METODOS_PAGAMENTO(Id_Metodo_Pagamento)
);

--- Inserção de dados ---

-- Inserção de Funcionários --
INSERT INTO FUNCIONARIOS (CPF_Funcionario, Nome_Funcionario, Email_Funcionario, Data_Nascimento_Funcionario, Data_Contratacao, Genero_Funcionario, Salario, Status_Funcionario) VALUES
('11111111111', 'Ana Paula Souza', 'ana.souza@petshop.com', '1990-03-15', '2020-01-10', 'Feminino', 3200.00, 'ATIVO'),
('22222222222', 'Bruno Lima Costa', 'bruno.costa@petshop.com', '1985-07-20', '2019-05-22', 'Masculino', 3500.00, 'ATIVO'),
('33333333333', 'Carla Mendes Alves', 'carla.alves@petshop.com', '1992-11-25', '2021-08-01', 'Feminino', 2900.00, 'ATIVO'),
('44444444444', 'Daniel Oliveira Rocha', 'daniel.rocha@petshop.com', '1988-04-10', '2022-03-18', 'Masculino', 3100.00, 'ATIVO'),
('55555555555', 'Erica Fernandes Reis', 'erica.reis@petshop.com', '1995-09-05', '2023-01-05', 'Feminino', 2800.00, 'ATIVO'),
('66666666666', 'Fernanda Martins', 'fernanda.m@petshop.com', '1991-02-12', '2023-08-15', 'Feminino', 3000.00, 'ATIVO'),
('77777777777', 'Gabriel Rocha', 'gabriel.r@petshop.com', '1987-11-30', '2022-06-20', 'Masculino', 3300.00, 'ATIVO'),
('88888888888', 'Isabel Oliveira', 'isabel.o@petshop.com', '1993-06-08', '2023-03-10', 'Feminino', 2950.00, 'ATIVO'),
('99999999999', 'Julio Cezar Paes', 'julio.p@petshop.com', '1986-09-22', '2021-11-05', 'Masculino', 3400.00, 'ATIVO'),
('00000000000', 'Luciana Ribeiro', 'luciana.r@petshop.com', '1994-01-19', '2022-05-01', 'Feminino', 3000.00, 'ATIVO'),
('11111111112', 'Paulo Henrique Silva', 'paulo.s@petshop.com', '1990-10-10', '2020-03-01', 'Masculino', 3150.00, 'ATIVO'),
('22222222223', 'Mariana Santos', 'mariana.s@petshop.com', '1988-04-25', '2019-09-15', 'Feminino', 3600.00, 'ATIVO'),
('33333333334', 'Ricardo Torres', 'ricardo.t@petshop.com', '1995-07-07', '2021-02-20', 'Masculino', 3050.00, 'ATIVO'),
('44444444445', 'Sandra Martins', 'sandra.m@petshop.com', '1991-05-12', '2022-11-01', 'Feminino', 2900.00, 'ATIVO'),
('55555555556', 'Vinicius Costa', 'vinicius.c@petshop.com', '1987-08-30', '2023-05-08', 'Masculino', 3200.00, 'ATIVO');

-- Inserção de Clientes --
INSERT INTO CLIENTES (CPF_Cliente, Nome_Cliente, Email_Cliente, Data_Nascimento_Cliente, Genero_Cliente) VALUES
('11122233344', 'Fabiana Guedes', 'fabiana.g@email.com', '1987-10-20', 'Feminino'),
('22233344455', 'Gustavo Henrique Silva', 'gustavo.s@email.com', '1991-02-12', 'Masculino'),
('33344455566', 'Helena Torres', 'helena.t@email.com', '1993-06-30', 'Feminino'),
('44455566677', 'Igor Santos', 'igor.s@email.com', '1980-08-08', 'Masculino'),
('55566677788', 'Juliana Lima', 'juliana.l@email.com', '1995-11-03', 'Feminino'),
('66677788899', 'Kleber Faria', 'kleber.f@email.com', '1975-01-28', 'Masculino'),
('77788899900', 'Laura Pires', 'laura.p@email.com', '1998-05-19', 'Feminino'),
('88899900011', 'Marcos Vinicius Borges', 'marcos.b@email.com', '1982-12-11', 'Masculino'),
('99900011122', 'Patrícia Oliveira', 'patricia.o@email.com', '1990-07-22', 'Feminino'),
('00011122233', 'Roberto Almeida', 'roberto.a@email.com', '1985-04-05', 'Masculino'),
('11122233300', 'Sofia Ferreira', 'sofia.f@email.com', '1994-09-18', 'Feminino'),
('22233344400', 'Victor Hugo Cunha', 'victor.c@email.com', '1989-03-03', 'Masculino'),
('33344455500', 'Amanda Rodrigues', 'amanda.r@email.com', '1992-12-12', 'Feminino'),
('44455566600', 'Carlos Eduardo Silva', 'carlos.s@email.com', '1984-07-21', 'Masculino'),
('55566677700', 'Bianca Santos', 'bianca.s@email.com', '1996-01-09', 'Feminino'),
('66677788800', 'Fernando Costa', 'fernando.c@email.com', '1981-05-15', 'Masculino'),
('77788899911', 'Gabriela Fernandes', 'gabriela.f@email.com', '1997-08-28', 'Feminino'),
('88899900022', 'Hugo Pereira', 'hugo.p@email.com', '1983-04-01', 'Masculino'),
('99900011133', 'Larissa Gomes', 'larissa.g@email.com', '1999-02-14', 'Feminino'),
('00011122244', 'Lucas Martins', 'lucas.m@email.com', '1994-11-20', 'Masculino'),
('11111111113', 'Cintia Ferreira', 'cintia.f@email.com', '1988-06-03', 'Feminino'),
('22222222224', 'Felipe Nunes', 'felipe.n@email.com', '1991-09-25', 'Masculino'),
('33333333335', 'Débora Almeida', 'debora.a@email.com', '1993-01-18', 'Feminino'),
('44444444446', 'Sergio Mendes', 'sergio.m@email.com', '1979-05-10', 'Masculino'),
('55555555557', 'Vitória Lima', 'vitoria.l@email.com', '1996-08-07', 'Feminino'),
('66666666668', 'Rafael Gomes', 'rafael.g@email.com', '1984-02-28', 'Masculino'),
('77777777779', 'Camila Ribeiro', 'camila.r@email.com', '1990-12-19', 'Feminino'),
('88888888880', 'Eduardo Costa', 'eduardo.c@petshop.com', '1986-04-04', 'Masculino'),
('99999999991', 'Isabela Pires', 'isabela.p@petshop.com', '1995-10-30', 'Feminino'),
('00000000002', 'João Victor', 'joao.v@petshop.com', '1998-03-21', 'Masculino'),
('11111111103', 'Karla Oliveira', 'karla.o@petshop.com', '1982-07-16', 'Feminino');

-- Inserção de Métodos de Pagamento --
INSERT INTO METODOS_PAGAMENTO (Nome_Metodo) VALUES
('Cartão de Crédito'),
('Dinheiro'),
('PIX'),
('Cartão de Débito');

-- Inserção de Serviços --
INSERT INTO SERVICOS (Nome_Servico) VALUES
('Banho'),
('Tosa'),
('Banho e Tosa'),
('Corte de Unhas'),
('Hospedagem'),
('Creche'),
('Hidratação de Pelos'),
('Penteado'),
('Escovação de Dentes'),
('Tratamento de Pulgas e Carrapatos');

-- Inserção de Pets --
INSERT INTO PETS (Id_Cliente, Nome_Pet, Raca_Pet, Especie_Pet, Genero_Pet, Tamanho_Pet, Idade_Pet, Vacinado, Castrado) VALUES
(1, 'Bilu', 'Vira-Lata', 'Cachorro', 'Masculino', 'Médio', 5.0, 1, 1),
(1, 'Lulu', 'Persa', 'Gato', 'Feminino', 'Pequeno', 2.0, 1, 0),
(2, 'Thor', 'Golden Retriever', 'Cachorro', 'Masculino', 'Grande', 3.0, 1, 1),
(3, 'Mimi', 'Siames', 'Gato', 'Feminino', 'Pequeno', 1.5, 1, 0),
(4, 'Bolt', 'Pastor Alemão', 'Cachorro', 'Masculino', 'Grande', 4.0, 1, 1),
(5, 'Princesa', 'Shih Tzu', 'Cachorro', 'Feminino', 'Pequeno', 1.0, 1, 1),
(6, 'Paco', 'Pitbull', 'Cachorro', 'Masculino', 'Grande', 6.0, 1, 1),
(7, 'Fifi', 'Poodle', 'Cachorro', 'Feminino', 'Médio', 2.5, 1, 0),
(8, 'Zeus', 'Labrador', 'Cachorro', 'Masculino', 'Grande', 3.5, 1, 1),
(9, 'Max', 'Pug', 'Cachorro', 'Masculino', 'Pequeno', 4.0, 1, 1),
(10, 'Mel', 'Scottish Fold', 'Gato', 'Feminino', 'Pequeno', 3.0, 1, 0),
(11, 'Buddy', 'Border Collie', 'Cachorro', 'Masculino', 'Grande', 2.0, 1, 1),
(12, 'Spike', 'Husky Siberiano', 'Cachorro', 'Masculino', 'Grande', 1.0, 1, 0),
(13, 'Nina', 'Salsicha', 'Cachorro', 'Feminino', 'Pequeno', 7.0, 1, 1),
(14, 'Frederico', 'Maine Coon', 'Gato', 'Masculino', 'Grande', 4.5, 1, 0),
(15, 'Luna', 'Beagle', 'Cachorro', 'Feminino', 'Médio', 2.0, 1, 1),
(16, 'Tom', 'Vira-Lata', 'Gato', 'Masculino', 'Médio', 3.0, 1, 0),
(17, 'Rex', 'Rottweiler', 'Cachorro', 'Masculino', 'Grande', 5.0, 1, 1),
(18, 'Pingo', 'Bulldog', 'Cachorro', 'Masculino', 'Médio', 6.0, 1, 1),
(19, 'Estrela', 'Poodle', 'Cachorro', 'Feminino', 'Pequeno', 2.0, 1, 1),
(20, 'Frajola', 'Vira-Lata', 'Gato', 'Masculino', 'Pequeno', 1.0, 1, 0),
(21, 'Simba', 'Lulu da Pomerânia', 'Cachorro', 'Masculino', 'Pequeno', 3.0, 1, 1),
(22, 'Milo', 'Shih Tzu', 'Cachorro', 'Masculino', 'Pequeno', 2.5, 1, 0),
(23, 'Fiona', 'Bulldog Francês', 'Cachorro', 'Feminino', 'Médio', 4.0, 1, 1),
(24, 'Romeu', 'Pastor Alemão', 'Cachorro', 'Masculino', 'Grande', 5.0, 1, 1),
(25, 'Julie', 'Vira-Lata', 'Gato', 'Feminino', 'Pequeno', 2.0, 1, 0),
(26, 'Tobby', 'Cocker Spaniel', 'Cachorro', 'Masculino', 'Médio', 3.0, 1, 1),
(27, 'Cleo', 'Sphynx', 'Gato', 'Feminino', 'Pequeno', 1.0, 1, 0),
(28, 'Biscoito', 'Basset Hound', 'Cachorro', 'Masculino', 'Médio', 7.0, 1, 1),
(29, 'Bella', 'Golden Retriever', 'Cachorro', 'Feminino', 'Grande', 4.0, 1, 1),
(30, 'Kiwi', 'Pug', 'Cachorro', 'Feminino', 'Pequeno', 1.0, 1, 0),
(31, 'Bob', 'Labrador', 'Cachorro', 'Masculino', 'Grande', 3.0, 1, 1);

-- Inserção de Preços --
INSERT INTO PRECOS (Id_Servico, Tamanho_Pet, Valor_Tamanho) VALUES
(1, 'Pequeno', 40.00), (1, 'Médio', 50.00), (1, 'Grande', 60.00),
(2, 'Pequeno', 30.00), (2, 'Médio', 40.00), (2, 'Grande', 50.00),
(3, 'Pequeno', 60.00), (3, 'Médio', 75.00), (3, 'Grande', 90.00),
(4, 'Pequeno', 15.00), (4, 'Médio', 15.00), (4, 'Grande', 20.00),
(5, 'Pequeno', 50.00), (5, 'Médio', 65.00), (5, 'Grande', 80.00),
(6, 'Pequeno', 45.00), (6, 'Médio', 55.00), (6, 'Grande', 70.00),
(7, 'Pequeno', 30.00), (7, 'Médio', 40.00), (7, 'Grande', 50.00),
(8, 'Pequeno', 25.00), (8, 'Médio', 30.00), (8, 'Grande', 35.00),
(9, 'Pequeno', 10.00), (9, 'Médio', 10.00), (9, 'Grande', 15.00),
(10, 'Pequeno', 60.00), (10, 'Médio', 70.00), (10, 'Grande', 85.00);

-- Inserção de Agendamentos --
INSERT INTO AGENDAMENTOS (Id_Cliente, Id_Pet, Data_Agendamento, Status_Agendamento) VALUES
(1, 1, CONVERT(DATETIME, '2024-08-01 09:00:00', 120), 'Concluído'),
(2, 3, CONVERT(DATETIME, '2024-08-01 10:30:00', 120), 'Concluído'),
(3, 4, CONVERT(DATETIME, '2024-08-02 11:00:00', 120), 'Concluído'),
(4, 5, CONVERT(DATETIME, '2024-08-02 14:00:00', 120), 'Concluído'),
(5, 6, CONVERT(DATETIME, '2024-08-03 09:30:00', 120), 'Concluído'),
(6, 7, CONVERT(DATETIME, '2024-08-03 16:00:00', 120), 'Concluído'),
(7, 8, CONVERT(DATETIME, '2024-08-04 10:00:00', 120), 'Agendado'),
(8, 9, CONVERT(DATETIME, '2024-08-04 15:00:00', 120), 'Concluído'),
(1, 2, CONVERT(DATETIME, '2024-08-05 11:00:00', 120), 'Cancelado'),
(9, 10, CONVERT(DATETIME, '2024-08-05 14:00:00', 120), 'Agendado'),
(10, 11, CONVERT(DATETIME, '2024-08-06 10:00:00', 120), 'Agendado'),
(11, 12, CONVERT(DATETIME, '2024-08-06 16:00:00', 120), 'Agendado'),
(12, 13, CONVERT(DATETIME, '2024-08-07 09:30:00', 120), 'Concluído'),
(13, 14, CONVERT(DATETIME, '2024-08-07 14:00:00', 120), 'Concluído'),
(14, 15, CONVERT(DATETIME, '2024-08-08 11:00:00', 120), 'Concluído'),
(15, 16, CONVERT(DATETIME, '2024-08-08 15:30:00', 120), 'Concluído'),
(16, 17, CONVERT(DATETIME, '2024-08-09 10:00:00', 120), 'Agendado'),
(17, 18, CONVERT(DATETIME, '2024-08-09 13:30:00', 120), 'Agendado'),
(18, 19, CONVERT(DATETIME, '2024-08-10 09:00:00', 120), 'Concluído'),
(19, 20, CONVERT(DATETIME, '2024-08-10 12:00:00', 120), 'Concluído'),
(20, 21, CONVERT(DATETIME, '2024-08-11 14:00:00', 120), 'Concluído'),
(21, 22, CONVERT(DATETIME, '2024-08-11 16:00:00', 120), 'Concluído'),
(22, 23, CONVERT(DATETIME, '2024-08-12 09:00:00', 120), 'Agendado'),
(23, 24, CONVERT(DATETIME, '2024-08-12 11:00:00', 120), 'Agendado'),
(24, 25, CONVERT(DATETIME, '2024-08-13 13:00:00', 120), 'Concluído'),
(25, 26, CONVERT(DATETIME, '2024-08-13 15:30:00', 120), 'Concluído'),
(26, 27, CONVERT(DATETIME, '2024-08-14 10:00:00', 120), 'Agendado'),
(27, 28, CONVERT(DATETIME, '2024-08-14 14:00:00', 120), 'Concluído'),
(28, 29, CONVERT(DATETIME, '2024-08-15 09:30:00', 120), 'Agendado'),
(29, 30, CONVERT(DATETIME, '2024-08-15 12:00:00', 120), 'Cancelado');

-- Inserção de Agendamentos_Servicos --
INSERT INTO AGENDAMENTOS_SERVICOS (Id_Agendamento, Id_Servico, Valor_Cobrado, Observacoes_Servico) VALUES
(1, 1, 50.00, 'Banho de rotina, sem intercorrências.'),
(2, 3, 90.00, 'Tosa higiênica e banho completo.'),
(3, 1, 40.00, 'Banho de gato, com secagem.'),
(4, 3, 90.00, 'Banho e tosa para cão de grande porte.'),
(5, 1, 40.00, 'Banho simples.'),
(6, 5, 80.00, 'Hospedagem por 1 dia.'),
(8, 6, 70.00, 'Creche para cão de grande porte.'),
(9, 1, 50.00, 'Banho e secagem de gato.'),
(10, 3, 90.00, 'Banho e tosa de rotina.'),
(11, 2, 50.00, 'Apenas tosa para cão de grande porte.'),
(13, 1, 50.00, 'Banho de rotina, sem intercorrências.'),
(14, 7, 40.00, 'Hidratação de pelos.'),
(15, 2, 40.00, 'Tosa completa.'),
(16, 1, 60.00, 'Banho de cachorro grande.'),
(18, 4, 15.00, 'Corte de unhas de gato.'),
(19, 3, 75.00, 'Banho e tosa para cão médio.'),
(20, 1, 40.00, 'Banho de rotina.'),
(21, 1, 40.00, 'Banho para cão pequeno.'),
(22, 3, 75.00, 'Banho e tosa de cachorro médio.'),
(24, 1, 40.00, 'Banho de gato, sem tosa.'),
(25, 2, 40.00, 'Tosa para cão de porte médio.'),
(27, 4, 15.00, 'Corte de unhas de cão pequeno.'),
(29, 3, 90.00, 'Banho e tosa de cão grande.');

-- Inserção de Pagamentos --
INSERT INTO PAGAMENTOS (Id_Agendamento, Id_Cliente, Id_Funcionario, Id_Metodo_Pagamento, Valor_Total, Data_Pagamento, Status_Pagamento, Observacoes) VALUES
(1, 1, 1, 3, 50.00, CONVERT(DATETIME, '2024-08-01 09:05:00', 120), 'Pago', 'Pagamento via PIX, sem troco.'),
(2, 2, 2, 1, 90.00, CONVERT(DATETIME, '2024-08-01 10:40:00', 120), 'Pago', 'Pagamento com cartão de crédito.'),
(3, 3, 3, 3, 40.00, CONVERT(DATETIME, '2024-08-02 11:05:00', 120), 'Pago', 'Pagamento via PIX.'),
(4, 4, 4, 4, 90.00, CONVERT(DATETIME, '2024-08-02 14:05:00', 120), 'Pago', 'Pagamento com cartão de débito.'),
(5, 5, 5, 2, 40.00, CONVERT(DATETIME, '2024-08-03 09:35:00', 120), 'Pago', 'Pagamento em dinheiro.'),
(6, 6, 1, 1, 80.00, CONVERT(DATETIME, '2024-08-03 16:05:00', 120), 'Pago', 'Pagamento com cartão de crédito.'),
(8, 8, 2, 3, 70.00, CONVERT(DATETIME, '2024-08-04 15:05:00', 120), 'Pago', 'Pagamento via PIX.'),
(13, 12, 4, 3, 50.00, CONVERT(DATETIME, '2024-08-07 09:35:00', 120), 'Pago', 'Pagamento via PIX, referente a banho.'),
(14, 13, 5, 1, 40.00, CONVERT(DATETIME, '2024-08-07 14:05:00', 120), 'Pago', 'Pagamento com cartão de crédito.'),
(15, 14, 6, 4, 40.00, CONVERT(DATETIME, '2024-08-08 11:05:00', 120), 'Pago', 'Pagamento com cartão de débito.'),
(16, 15, 7, 2, 60.00, CONVERT(DATETIME, '2024-08-08 15:35:00', 120), 'Pago', 'Pagamento em dinheiro.'),
(18, 17, 8, 2, 15.00, CONVERT(DATETIME, '2024-08-09 13:35:00', 120), 'Pago', 'Pagamento em dinheiro.'),
(19, 18, 9, 3, 75.00, CONVERT(DATETIME, '2024-08-10 09:05:00', 120), 'Pago', 'Pagamento via PIX.'),
(20, 19, 10, 1, 40.00, CONVERT(DATETIME, '2024-08-10 12:05:00', 120), 'Pago', 'Pagamento com cartão de crédito.'),
(21, 20, 1, 3, 40.00, CONVERT(DATETIME, '2024-08-11 14:05:00', 120), 'Pago', 'Pagamento via PIX.'),
(24, 23, 3, 1, 40.00, CONVERT(DATETIME, '2024-08-13 13:05:00', 120), 'Pago', 'Pagamento com cartão de crédito.'),
(25, 24, 4, 4, 40.00, CONVERT(DATETIME, '2024-08-13 15:40:00', 120), 'Pago', 'Pagamento com cartão de débito.'),
(27, 26, 5, 2, 15.00, CONVERT(DATETIME, '2024-08-14 14:05:00', 120), 'Pago', 'Pagamento em dinheiro.'),
(29, 28, 6, 1, 90.00, CONVERT(DATETIME, '2024-08-16 10:05:00', 120), 'Pago', 'Pagamento com cartão de crédito.');

--- Criação das Views ---

-- View que simplifica a consulta de todos os detalhes de um pagamento.
CREATE VIEW vw_DetalhesPagamentos AS
SELECT
    PAG.Id_Pagamento,
    A.Data_Agendamento AS Data_Servico,
    C.Nome_Cliente AS Cliente,
    F.Nome_Funcionario AS Atendente,
    MP.Nome_Metodo AS Metodo_Pagamento,
    PAG.Valor_Total,
    PAG.Data_Pagamento,
    PAG.Status_Pagamento
FROM
    PAGAMENTOS AS PAG
INNER JOIN
    AGENDAMENTOS AS A ON PAG.Id_Agendamento = A.Id_Agendamento
INNER JOIN
    CLIENTES AS C ON PAG.Id_Cliente = C.Id_Cliente
INNER JOIN
    FUNCIONARIOS AS F ON PAG.Id_Funcionario = F.Id_Funcionario
INNER JOIN
    METODOS_PAGAMENTO AS MP ON PAG.Id_Metodo_Pagamento = MP.Id_Metodo_Pagamento;


-- View que calcula a receita total e a quantidade de serviços vendidos por tipo.
CREATE VIEW vw_ReceitaPorServico AS
SELECT
    S.Nome_Servico,
    COUNT(ASV.Id_Servico) AS Total_Servicos,
    SUM(ASV.Valor_Cobrado) AS Receita_Total
FROM
    AGENDAMENTOS_SERVICOS AS ASV
INNER JOIN
    SERVICOS AS S ON ASV.Id_Servico = S.Id_Servico
GROUP BY
    S.Nome_Servico;

-- View para avaliar a performance de cada funcionário.
CREATE VIEW vw_PerformanceFuncionarios AS
SELECT
    F.Nome_Funcionario,
    COUNT(PAG.Id_Pagamento) AS Pagamentos_Processados,
    SUM(PAG.Valor_Total) AS Receita_Processada
FROM
    FUNCIONARIOS AS F
INNER JOIN
    PAGAMENTOS AS PAG ON F.Id_Funcionario = PAG.Id_Funcionario
GROUP BY
    F.Nome_Funcionario;

-- View que lista os pets de cada cliente.
CREATE VIEW vw_ClientesPets AS
SELECT
    C.Nome_Cliente AS Dono,
    P.Nome_Pet AS Pet,
    P.Especie_Pet AS Especie,
    P.Raca_Pet AS Raça,
    P.Tamanho_Pet AS Tamanho,
    P.Idade_Pet AS Idade,
    P.Vacinado,
    P.Castrado
FROM
    PETS AS P
INNER JOIN
    CLIENTES AS C ON P.Id_Cliente = C.Id_Cliente;

--- Criação de Procedures ---

-- Procedure para criar um novo agendamento.
CREATE PROCEDURE sp_AgendarServico
	@Id_Cliente INT,
	@Id_Pet INT,
	@Data_Agendamento DATETIME,
	@Status_Agendamento VARCHAR(30)
AS
BEGIN
	SET NOCOUNT ON;
		
	BEGIN TRY
		-- Valida se o ID do cliente é válido.
		IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE Id_Cliente = @Id_Cliente)
		BEGIN	
			RAISERROR ('ERRO: O cliente com o ID fornecido não existe.', 16, 1)
			RETURN;
		END

		-- Valida se o ID do pet é válido.
		IF NOT EXISTS (SELECT 1 FROM PETS WHERE Id_Pet = @Id_Pet)
		BEGIN	
			RAISERROR ('ERRO: O pet com o ID fornecido não existe.', 16, 1)
			RETURN;
		END;

		-- Insere o novo agendamento com as informações fornecidas.
		INSERT INTO AGENDAMENTOS (
			Id_Cliente,
			Id_Pet,
			Data_Agendamento,
			Status_Agendamento
		)
		VALUES (
			@Id_Cliente,
			@Id_Pet,
			@Data_Agendamento,
			@Status_Agendamento
		);

		PRINT 'Um agendamento inserido com sucesso!';
	END TRY
	BEGIN CATCH
	
		-- Em caso de erro, captura e exibe a mensagem detalhada.
		DECLARE @ErrorMessage VARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;

EXEC sp_AgendarServico 
	@Id_Cliente = 12, 
	@Id_Pet = 13, 
	@Data_Agendamento = '20250115 11:30:00',
	@Status_Agendamento = 'Agendado';


-- Procedure para atualizar a data e/ou o status de um agendamento existente.
CREATE PROCEDURE sp_AtualizarAgendamento
	@Id_Agendamento INT,
	@Nova_Data_Agendamento DATETIME = NULL,
	@Novo_Status_Agendamento VARCHAR(30) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
	DECLARE @Agendamento_existe INT;

	-- Primeiro, verifica se o agendamento existe.
	SELECT @Agendamento_existe = Id_Agendamento FROM AGENDAMENTOS WHERE Id_Agendamento = @Id_Agendamento;

	IF @Agendamento_existe IS NULL
	BEGIN
		RAISERROR ('ERRO: Agendamento com o ID fornecido não encontrado.', 16, 1)
		RETURN;
	END;

	-- Atualiza os campos. O uso de ISNULL garante que apenas os parâmetros fornecidos sejam alterados.
	UPDATE AGENDAMENTOS
	SET 
		Data_Agendamento = ISNULL(@Nova_Data_Agendamento, Data_Agendamento),
		Status_Agendamento = ISNULL(@Novo_Status_Agendamento, Status_Agendamento)
	WHERE
		Id_Agendamento = @Id_Agendamento;


	PRINT 'Agendamento atualizado com sucesso!';
    END TRY
    BEGIN CATCH
  
        -- Em caso de erro, exibe a mensagem detalhada.
        DECLARE @ErrorMessage VARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;

EXEC sp_AtualizarAgendamento 
	@Id_Agendamento = 7,
	@Nova_Data_Agendamento = '20240804 11:00:00',
	@Novo_Status_Agendamento = 'Confirmado';

-- Procedure para cancelar um agendamento.
-- Altera o status do agendamento para 'Cancelado', garantindo um registro claro.
CREATE PROCEDURE sp_CancelarAgendamento
	@Id_Agendamento INT
AS
BEGIN		
	SET NOCOUNT ON;

	BEGIN TRY
	DECLARE @Agendamento_existe INT;

	-- Verifica se o agendamento a ser cancelado existe.
	SELECT @Agendamento_existe = Id_Agendamento FROM AGENDAMENTOS WHERE Id_Agendamento = @Id_Agendamento;

	IF @Agendamento_existe IS NULL
	BEGIN
		RAISERROR('ERRO: Agendamento com o ID fornecido não encontrado.', 16, 1)
		RETURN;
	END;

    -- Altera o status do agendamento para 'Cancelado'.
	UPDATE AGENDAMENTOS
	SET
		Status_Agendamento = 'Cancelado'
	WHERE
		Id_Agendamento = @Id_Agendamento;

	PRINT 'Agendamento Cancelado com sucesso!'
	END TRY
	BEGIN CATCH

        -- Em caso de falha, exibe a mensagem de erro.		
		DECLARE @ErrorMessage VARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
		DECLARE @ErrorState INT = ERROR_STATE();

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH;
END;

EXEC sp_CancelarAgendamento 
	@Id_Agendamento = 10;

-- Procedure para gerenciar dados de clientes.
CREATE PROCEDURE sp_GerenciarCliente
	@Id_Cliente INT,
	@CPF_Cliente VARCHAR(11),
	@Nome_Cliente VARCHAR(150),
	@Email_Cliente VARCHAR(200),
	@Data_Nascimento_Cliente DATETIME,
	@Genero_Cliente VARCHAR(20)
AS BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		DECLARE @Cliente_existe INT;

        -- Lógica de inserção: se o Id_Cliente não for fornecido, cria um novo cliente.
		IF @Id_Cliente IS NULL
		BEGIN
			INSERT INTO CLIENTES (Id_Cliente, CPF_Cliente, Nome_Cliente, Email_Cliente, Data_Nascimento_Cliente, Genero_Cliente)
			VALUES (@Id_Cliente, @CPF_Cliente, @Nome_Cliente, @Email_Cliente, @Data_Nascimento_Cliente, @Genero_Cliente);

			PRINT 'Novo cliente Inserido com sucesso!';
		END
		ELSE
		BEGIN
		
		-- Lógica de atualização: verifica se o cliente com o ID fornecido existe.
			SELECT @Cliente_existe = COUNT(*) FROM CLIENTES WHERE Id_Cliente = @Id_Cliente;

			IF @Cliente_existe = 0
			BEGIN
				RAISERROR('Erro: Cliente com o ID fornecido não encontrado. O registro não pode ser atualizado.', 16, 1);
                RETURN;
            END;
			
			-- Se o cliente existir, atualiza suas informações.
			UPDATE CLIENTES
            SET
                Nome_Cliente = @Nome_Cliente,
                CPF_Cliente = @CPF_Cliente,
                Email_Cliente = @Email_Cliente,
                Data_Nascimento_Cliente = @Data_Nascimento_Cliente,
                Genero_Cliente = @Genero_Cliente
            WHERE
                Id_Cliente = @Id_Cliente;

			PRINT 'Cliente atualizado com sucesso!';     
		END;
    END TRY
    BEGIN CATCH
        
        -- Captura e exibe a mensagem de erro.
        DECLARE @ErrorMessage VARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;

EXEC sp_GerenciarCliente
	@Id_Cliente = 5,
	@CPF_Cliente = '55566677788',
	@Nome_Cliente = 'Juliana Lima',
	@Email_Cliente = 'juliana.lima.nova@email.com',
	@Data_Nascimento_Cliente = '19951103',
	@Genero_Cliente = 'Feminino';

-- Procedure para gerenciar dados de pets.
CREATE PROCEDURE sp_GerenciarPet
    @Id_Pet INT,
    @Id_Cliente INT,
    @Nome_Pet VARCHAR(180),
    @raca_Pet VARCHAR(50),
	@Especie_Pet VARCHAR(50),
    @Tamanho_Pet VARCHAR(50),
    @Idade_Pet DECIMAL(10,2),
	@Vacinado BIT,
	@Castrado BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        
        DECLARE @Cliente_existe INT;

        -- Primeiro, valida se o cliente associado ao pet existe, para manter a integridade referencial.
        SELECT @Cliente_existe = COUNT(*) FROM CLIENTES WHERE Id_Cliente = @Id_Cliente;

        IF @Cliente_existe = 0
        BEGIN
            RAISERROR('Erro: O cliente com o ID fornecido não foi encontrado. O pet não pode ser associado.', 16, 1);
            RETURN;
        END;

        -- Lógica de inserção: se o Id_Pet não for fornecido, cria um novo pet.
        IF @Id_Pet IS NULL
        BEGIN

            INSERT INTO PETS (Id_Cliente, Nome_Pet, Raca_Pet, Especie_Pet, Tamanho_Pet, Idade_Pet, Vacinado, Castrado)
            VALUES (@Id_Cliente, @Nome_Pet, @raca_Pet, @Especie_Pet, @Tamanho_Pet, @Idade_Pet, @Vacinado, @Castrado);
            
            PRINT 'Novo pet inserido com sucesso!';
        END;
        ELSE
        BEGIN

            -- Lógica de atualização: verifica se o pet com o ID fornecido existe.
            DECLARE @Pet_existe INT;
            SELECT @Pet_existe = COUNT(*) FROM PETS WHERE Id_Pet = @Id_Pet;

            IF @Pet_existe = 0
            BEGIN
                RAISERROR('Erro: Pet com o ID fornecido não encontrado. O registro não pode ser atualizado.', 16, 1);
                RETURN;
            END;

			-- Se o pet existir, atualiza todas as suas informações.
            UPDATE PETS
            SET
                Id_Cliente = @id_cliente,
                Nome_Pet = @Nome_Pet,
                Raca_Pet = @raca_Pet,
                Especie_Pet = @Especie_Pet,
                Tamanho_Pet = @Tamanho_Pet,
				Idade_Pet = @Idade_Pet,
				Vacinado = @Vacinado,
				Castrado = @Castrado
            WHERE
                Id_Pet = @Id_Pet;
            
            PRINT 'Pet atualizado com sucesso!';
        END;
    END TRY
    BEGIN CATCH
        
        -- Captura e exibe a mensagem de erro detalhada em caso de falha.
        DECLARE @ErrorMessage VARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;

EXEC sp_GerenciarPet
	@Id_Pet = 2,
	@Id_Cliente = 1, 
	@Nome_Pet = 'Lulu',
	@Raca_Pet = 'Persa',
	@Especie_Pet = 'Gato',
	@Tamanho_Pet = 'Pequeno',
	@Idade_Pet = 2.0,
	@Vacinado = 1,
	@Castrado = 1;