-- Se o banco de dados existir, exclua-o
DROP DATABASE IF EXISTS hospital;

-- Crie o banco de dados
CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

-- Crie a tabela especialidades
CREATE TABLE `especialidades` (
    `id_especialidade` INT NOT NULL AUTO_INCREMENT,
    `nome_especialidade` VARCHAR(520) NOT NULL,
    PRIMARY KEY (`id_especialidade`)
);

INSERT INTO `especialidades` (nome_especialidade) VALUES
('pediatria'),
('clínico Geral'),
('gastroenterologia'),
('dermatologia');

-- Crie a tabela medico
CREATE TABLE `medico` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `cpf` VARCHAR(11) NOT NULL,
    `rg` VARCHAR(10) NOT NULL,
    `crm` VARCHAR(14) NOT NULL,
    `nome` VARCHAR(120) NOT NULL,
    `email` VARCHAR(120) NOT NULL,
    `telefone` VARCHAR(11) NOT NULL,
    `senha` VARCHAR(11) NOT NULL,
    `especialidade` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `medico_fk0` FOREIGN KEY (`especialidade`) REFERENCES `especialidades`(`id_especialidade`)
);

INSERT INTO `medico` (cpf, rg, crm, nome, email, telefone, senha, especialidade) VALUES
('12345678901', '1234567890', 'CRM12345', 'Dr. João Silva', 'joao.silva@example.com', '12345678901', 'senha123', 1),
('98765432109', '9876543210', 'CRM54321', 'Dra. Maria Oliveira', 'maria.oliveira@example.com', '98765432109', 'senha456', 1),
('56789012345', '5678901234', 'CRM67890', 'Dr. Carlos Santos', 'carlos.santos@example.com', '56789012345', 'senha789', 1),
('11111111111', '1111111111', 'CRM11111', 'Dr. Ana Souza', 'ana.souza@example.com', '11111111111', 'senha111', 1),
('22222222222', '2222222222', 'CRM22222', 'Dr. José Lima', 'jose.lima@example.com', '22222222222', 'senha222', 1),
('33333333333', '3333333333', 'CRM33333', 'Dra. Paula Oliveira', 'paula.oliveira@example.com', '33333333333', 'senha333', 2),
('44444444444', '4444444444', 'CRM44444', 'Dr. Silvia Martins', 'silvia.martins@example.com', '44444444444', 'senha444', 2),
('55555555555', '5555555555', 'CRM55555', 'Dr. Pedro Lima', 'pedro.lima@example.com', '55555555555', 'senha555', 2),
('66666666666', '6666666666', 'CRM66666', 'Dra. Carlos Oliveira', 'carlos.oliveira@example.com', '66666666666', 'senha666', 2),
('77777777777', '7777777777', 'CRM77777', 'Dra. Ana Lima', 'ana.lima@example.com', '77777777777', 'senha777', 3),
('88888888888', '8888888888', 'CRM88888', 'Dr. Julia Oliveira', 'julia.oliveira@example.com', '88888888888', 'senha888', 3),
('99999999999', '9999999999', 'CRM99999', 'Dra. Marcos Silva', 'marcos.silva@example.com', '99999999999', 'senha999', 3),
('12121212121', '1212121212', 'CRM12121', 'Dra. Marcela Souza', 'marcela.souza@example.com', '12121212121', 'senha121', 4),
('13131313131', '1313131313', 'CRM13131', 'Dr. Paula Lima', 'paula.lima@example.com', '13131313131', 'senha131', 4),
('14141414141', '1414141414', 'CRM14141', 'Dra. Ricardo Oliveira', 'ricardo.oliveira@example.com', '14141414141', 'senha141', 4);

-- Crie a tabela paciente
CREATE TABLE `paciente` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(120) NOT NULL,
    `endereco` VARCHAR(520) NOT NULL,
    `rg` VARCHAR(10) NOT NULL,
    `cpf` VARCHAR(11) NOT NULL,
    `email` VARCHAR(120) NOT NULL,
    `telefone` VARCHAR(11) NOT NULL,
    `data_nascimento` DATE NOT NULL,
    `altura` FLOAT(5) NOT NULL,
    `peso` INT NOT NULL,
    `rne` VARCHAR(14) NOT NULL,
    PRIMARY KEY (`id`)
);

-- Correção no código INSERT INTO da tabela paciente
INSERT INTO `paciente` (nome, endereco, rg, cpf, email, telefone, data_nascimento, altura, peso, rne) VALUES
('Ana Silva', 'Rua A, 123', '486527956', '74747474747', 'ana.silva@example.com', '12345678901', '1990-05-15', 1.70, 60, 'RNE12345'),
('Pedro Oliveira', 'Av. B, 456', '796222314', '45268953254', 'pedro.oliveira@example.com', '98765432109', '1985-08-20', 1.75, 70, 'RNE54321'),
('Marta Santos', 'Rua C, 789', '975245875', '46464646464', 'marta.santos@example.com', '56789012345', '1992-02-10', 1.60, 55, 'RNE67890'),
('Carlos Lima', 'Av. D, 101', '789542657', '74747474747', 'carlos.lima@example.com', '11111111111', '1988-11-25', 1.78, 80, 'RNE11111'),
('Julia Oliveira', 'Rua E, 202', '654864589', '96969696969', 'julia.oliveira@example.com', '22222222222', '1995-04-30', 1.68, 65, 'RNE22222'),
('Lucas Souza', 'Av. F, 303', '586423589', '42642642645', 'lucas.souza@example.com', '33333333333', '1993-09-18', 1.72, 70, 'RNE33333'),
('Rita Lima', 'Rua G, 404', '795648230', '7856984561', 'rita.lima@example.com', '44444444444', '1987-07-05', 1.65, 58, 'RNE44444'),
('Fernando Martins', 'Av. H, 505', '465230189', '14145623232', 'fernando.martins@example.com', '55555555555', '1990-12-12', 1.75, 75, 'RNE55555'),
('Aline Oliveira', 'Rua I, 606', '756842656', '72365498745', 'aline.oliveira@example.com', '66666666666', '1986-03-27', 1.68, 62, 'RNE66666'),
('Paulo Souza', 'Av. J, 707', '454545454', '41659898756', 'paulo.souza@example.com', '77777777777', '1991-06-08', 1.80, 85, 'RNE77777'),
('Camila Lima', 'Rua K, 808', '787878787', '88899977789', 'camila.lima@example.com', '88888888888', '1989-10-03', 1.62, 57, 'RNE88888'),
('Gustavo Martins', 'Av. L, 909', '232323232', '13569874562', 'gustavo.martins@example.com', '99999999999', '1994-01-22', 1.77, 78, 'RNE99999'),
('Isabela Santos', 'Rua M, 1010', '789789789', '12121212475', 'isabela.santos@example.com', '12121212121', '1984-04-15', 1.63, 60, 'RNE12121'),
('Renato Lima', 'Av. N, 1111', '969696969', '45685456958', 'renato.lima@example.com', '13131313131', '1996-07-30', 1.75, 73, 'RNE13131'),
('Carla Oliveira', 'Rua O, 1212', '458596542', '78564265489', 'carla.oliveira@example.com', '14141414141', '1983-12-10', 1.70, 68, 'RNE14141');

-- Crie a tabela convenio
CREATE TABLE `convenio` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(120) NOT NULL,
    `cnpj` VARCHAR(18) NOT NULL,
    `tempo_carencia` DATE NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `convenio` (nome, cnpj, tempo_carencia) VALUES
('Convenio A', '12345678901234', '2023-01-01'),
('Convenio B', '56789012345678', '2023-02-15'),
('Convenio C', '90123456789012', '2023-03-20'),
('Convenio D', '34567890123456', '2023-04-10'),
('Convenio E', '78901234567890', '2023-05-05'),
('Convenio F', '12345098765432', '2023-06-25'),
('Convenio G', '67890123456789', '2023-07-15'),
('Convenio H', '12345678901234', '2023-08-30'),
('Convenio I', '56789012345678', '2023-09-22'),
('Convenio J', '90123456789012', '2023-10-18'),
('Convenio K', '34567890123456', '2023-11-12'),
('Convenio L', '78901234567890', '2023-12-05'),
('Convenio M', '12345098765432', '2024-01-15'),
('Convenio N', '67890123456789', '2024-02-20'),
('Convenio O', '12345678901234', '2024-03-10');

-- Crie a tabela consulta
CREATE TABLE `consulta` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_medico` INT NOT NULL,
    `id_paciente` INT NOT NULL,
    `data` DATE NOT NULL,
    `hora` TIME NOT NULL,
    `valor_consulta` VARCHAR(520) NOT NULL,
    `numero_paciente` VARCHAR(520) NOT NULL,
    `nome_convenio` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `consulta_fk0` FOREIGN KEY (`id_medico`) REFERENCES `medico`(`id`),
    CONSTRAINT `consulta_fk1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente`(`id`),
    CONSTRAINT `consulta_fk2` FOREIGN KEY (`nome_convenio`) REFERENCES `convenio`(`id`)
);

INSERT INTO `consulta` (id_medico, id_paciente, data, hora, valor_consulta, numero_paciente, nome_convenio) VALUES
('1', '1', '2023-01-15', '10:00:00', '150.00', 'C12345', '1'),
('2', '2', '2023-02-20', '11:30:00', '180.00', 'C54321', '2'),
('3', '3', '2023-03-10', '14:45:00', '120.00', 'C67890', '3'),
('4', '4', '2023-04-05', '09:30:00', '200.00', 'C11111', '4'),
('5', '5', '2023-05-12', '13:15:00', '160.00', 'C22222', '5'),
('6', '6', '2023-06-25', '16:00:00', '140.00', 'C33333', '6'),
('7', '7', '2023-07-15', '10:30:00', '180.00', 'C44444', '7'),
('8', '8', '2023-08-30', '15:45:00', '150.00', 'C55555', '8'),
('9', '9', '2023-09-22', '11:00:00', '190.00', 'C66666', '9'),
('10', '10', '2023-10-18', '14:30:00', '160.00', 'C77777', '10'),
('11', '11', '2023-11-12', '09:15:00', '170.00', 'C88888', '11'),
('12', '12', '2023-12-05', '12:45:00', '200.00', 'C99999', '12'),
('13', '13', '2024-01-15', '15:00:00', '140.00', 'C12121', '13'),
('14', '14', '2024-02-20', '10:45:00', '180.00', 'C13131', '14'),
('15', '15', '2024-03-10', '13:30:00', '160.00', 'C14141', '15');

-- Crie a tabela receita
CREATE TABLE `receita` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_paciente` INT NOT NULL,
    `medicamento` VARCHAR(520) NOT NULL,
    `instrucoes` VARCHAR(520) NOT NULL,
    `quantidade_medicamento` FLOAT(3) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `receita_fk0` FOREIGN KEY (`id_paciente`) REFERENCES `paciente`(`id`)
);

INSERT INTO `receita` (id_paciente, medicamento, instrucoes, quantidade_medicamento) VALUES
('1', 'Paracetamol', 'Tomar 1 comprimido a cada 6 horas', 20),
('2', 'Amoxicilina', 'Tomar 1 comprimido a cada 8 horas', 15),
('3', 'Ibuprofeno', 'Tomar 1 comprimido a cada 12 horas', 30),
('4', 'Dipirona', 'Tomar 1 comprimido a cada 4 horas', 25),
('5', 'Omeprazol', 'Tomar 1 comprimido antes do café da manhã', 30),
('6', 'Dorflex', 'Tomar 1 comprimido a cada 6 horas', 20),
('7', 'Cetirizina', 'Tomar 1 comprimido antes de dormir', 10),
('8', 'Dexametasona', 'Tomar 1 comprimido pela manhã', 10),
('9', 'Loratadina', 'Tomar 1 comprimido a cada 24 horas', 10),
('10', 'Claritromicina', 'Tomar 1 comprimido a cada 12 horas', 15),
('11', 'Hidroclorotiazida', 'Tomar 1 comprimido pela manhã', 30),
('12', 'Losartana', 'Tomar 1 comprimido pela noite', 30),
('13', 'Simvastatina', 'Tomar 1 comprimido antes de dormir', 30),
('14', 'Metformina', 'Tomar 1 comprimido antes do café da manhã', 30),
('15', 'Insulina', 'Aplicar 10 unidades antes das refeições', 10);

-- Crie a tabela enfermeiros
CREATE TABLE `enfermeiros` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `cre` VARCHAR(14) NOT NULL,
    `nome` VARCHAR(120) NOT NULL,
    `cpf` VARCHAR(11) NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `enfermeiros` (cre, nome, cpf) VALUES
('CRE12345', 'Enfermeira Maria Silva', '78901234567'),
('CRE54321', 'Enfermeiro João Oliveira', '89012345678'),
('CRE67890', 'Enfermeira Carla Santos', '90123456789'),
('CRE11111', 'Enfermeiro Marcos Lima', '12345678901'),
('CRE22222', 'Enfermeira Ana Oliveira', '23456789012'),
('CRE33333', 'Enfermeiro José Souza', '34567890123'),
('CRE44444', 'Enfermeira Paula Lima', '45678901234'),
('CRE55555', 'Enfermeiro Lucas Santos', '56789012345'),
('CRE66666', 'Enfermeira Aline Oliveira', '67890123456'),
('CRE77777', 'Enfermeiro Pedro Lima', '78901234567'),
('CRE88888', 'Enfermeira Julia Martins', '89012345678'),
('CRE99999', 'Enfermeiro Ricardo Silva', '90123456789'),
('CRE12121', 'Enfermeira Marcela Oliveira', '12345678901'),
('CRE13131', 'Enfermeiro Paula Souza', '23456789012'),
('CRE14141', 'Enfermeira Gustavo Lima', '34567890123');

CREATE TABLE `tipo_quartos` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `valor_diaria` VARCHAR(520) NOT NULL,
    `descricao` VARCHAR(520) NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `tipo_quartos` (valor_diaria, descricao) VALUES
('200.00', 'Quarto Standard 1'),
('210.00', 'Quarto Standard 2'),
('220.00', 'Quarto Standard 3'),
('230.00', 'Quarto Standard 4'),
('240.00', 'Quarto Standard 5'),
('250.00', 'Quarto Deluxe 1'),
('260.00', 'Quarto Deluxe 2'),
('270.00', 'Quarto Deluxe 3'),
('280.00', 'Suíte Júnior 1'),
('290.00', 'Suíte Júnior 2'),
('300.00', 'Suíte Executiva 1'),
('310.00', 'Suíte Executiva 2'),
('320.00', 'Suíte Presidencial 1'),
('330.00', 'Suíte Presidencial 2'),
('340.00', 'Suíte Presidencial 3');

CREATE TABLE `quarto` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `tipo` INT NOT NULL,
    `numero` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `quarto_fk0` FOREIGN KEY (`tipo`) REFERENCES `tipo_quartos`(`id`)
);

INSERT INTO `quarto` (tipo, numero) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 201),
(7, 202),
(8, 203),
(9, 301),
(10, 302),
(11, 401),
(12, 402),
(13, 403),
(14, 501),
(15, 502);

CREATE TABLE `internacao` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_medico` INT NOT NULL,
    `id_paciente` INT NOT NULL,
    `id_quarto` INT NOT NULL,
    `id_enfermeira` INT NOT NULL,
    `data_entrada` DATE NOT NULL,
    `data_prev_alta` DATE NOT NULL,
    `data_alta` DATE NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `internacao_fk0` FOREIGN KEY (`id_medico`) REFERENCES `medico`(`id`),
    CONSTRAINT `internacao_fk1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente`(`id`),
    CONSTRAINT `internacao_fk2` FOREIGN KEY (`id_quarto`) REFERENCES `quarto`(`id`),
    CONSTRAINT `internacao_fk3` FOREIGN KEY (`id_enfermeira`) REFERENCES `enfermeiros`(`id`)
);

INSERT INTO `internacao` (id_medico, id_paciente, id_quarto, id_enfermeira, data_entrada, data_prev_alta, data_alta) VALUES
('1', '1', 1, '1', '2023-01-01', '2023-01-10', '2023-01-15'),
('2', '2', 2, '2', '2023-02-01', '2023-02-10', '2023-02-15'),
('3', '3', 3, '3', '2023-03-01', '2023-03-10', '2023-03-15'),
('4', '4', 4, '4', '2023-04-01', '2023-04-10', '2023-04-15'),
('5', '5', 5, '5', '2023-05-01', '2023-05-10', '2023-05-15'),
('6', '6', 6, '6', '2023-06-01', '2023-06-10', '2023-06-15'),
('7', '7', 7, '7', '2023-07-01', '2023-07-10', '2023-07-15'),
('8', '8', 8, '8', '2023-08-01', '2023-08-10', '2023-08-15'),
('9', '9', 9, '9', '2023-09-01', '2023-09-10', '2023-09-15'),
('10', '10', 10, '10', '2023-10-01', '2023-10-10', '2023-10-15'),
('11', '11', 11, '11', '2023-11-01', '2023-11-10', '2023-11-15'),
('12', '12', 12, '12', '2023-12-01', '2023-12-10', '2023-12-15'),
('13', '13', 13, '13', '2024-01-01', '2024-01-10', '2024-01-15'),
('14', '14', 14, '14', '2024-02-01', '2024-02-10', '2024-02-15'),
('15', '15', 15, '15', '2024-03-01', '2024-03-10', '2024-03-15');








