CREATE TABLE `especialidades` (
	`id_especialidade` varchar(36) NOT NULL,
	`nome_especialidade` varchar(520) NOT NULL,
	PRIMARY KEY (`id_especialidade`)
);

CREATE TABLE `medico` (
	`id` varchar(36) NOT NULL,
	`cpf` varchar(11) NOT NULL,
	`rg` varchar(10) NOT NULL,
	`crm` varchar(14) NOT NULL,
	`nome` varchar(120) NOT NULL,
	`email` varchar(120) NOT NULL,
	`telefone` int(11) NOT NULL,
	`senha` varchar(11) NOT NULL,
	`especialidade` varchar(36) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `paciente` (
	`id` varchar(36) NOT NULL,
	`nome` varchar(120) NOT NULL,
	`endereco` varchar(520) NOT NULL,
	`rg` varchar(10) NOT NULL,
	`cpf` varchar(11) NOT NULL,
	`email` varchar(120) NOT NULL,
	`telefone` int(11) NOT NULL,
	`data_nascimento` DATE NOT NULL,
	`altura` FLOAT(5) NOT NULL,
	`peso` int(4) NOT NULL,
	`rne` varchar(14) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `consulta` (
	`id` varchar(36) NOT NULL,
	`id_medico` int(11) NOT NULL,
	`id_paciente` int(11) NOT NULL,
	`data` DATE NOT NULL,
	`hora` TIME NOT NULL,
	`valor_consulta` varchar(520) NOT NULL,
	`numero_paciente` varchar(520) NOT NULL,
	`nome_convenio` varchar(520) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `receita` (
	`id` varchar(36) NOT NULL,
	`id_paciente` int(11) NOT NULL,
	`medicamento` varchar(520) NOT NULL,
	`instrucoes` varchar(520) NOT NULL,
	`quantidade_medicamento` FLOAT(3) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `convenio` (
	`id` varchar(36) NOT NULL,
	`nome` varchar(120) NOT NULL,
	`cnpj` int(18) NOT NULL,
	`tempo_carencia` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `internacao` (
	`id` varchar(36) NOT NULL,
	`id_medico` varchar(36) NOT NULL,
	`id_paciente` varchar(36) NOT NULL,
	`id_quarto` varchar(36) NOT NULL,
	`id_enfermeira` varchar(36) NOT NULL,
	`data_entrada` DATE NOT NULL,
	`data_prev_alta` DATE NOT NULL,
	`data_alta` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `enfermeiros` (
	`id`  NOT NULL,
	`cre` varchar(14) NOT NULL,
	`nome` varchar(120) NOT NULL,
	`cpf` varchar(11) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `quarto` (
	`id` int(11) NOT NULL,
	`tipo` varchar(512) NOT NULL,
	`numero` int(5) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tipo_quartos` (
	`id` int(11) NOT NULL,
	`valor_diaria` varchar(520) NOT NULL,
	`descricao` varchar(520) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `medico` ADD CONSTRAINT `medico_fk0` FOREIGN KEY (`especialidade`) REFERENCES `especialidades`(`id_especialidade`);

ALTER TABLE `consulta` ADD CONSTRAINT `consulta_fk0` FOREIGN KEY (`id_medico`) REFERENCES `medico`(`id`);

ALTER TABLE `consulta` ADD CONSTRAINT `consulta_fk1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente`(`id`);

ALTER TABLE `consulta` ADD CONSTRAINT `consulta_fk2` FOREIGN KEY (`nome_convenio`) REFERENCES `convenio`(`id`);

ALTER TABLE `receita` ADD CONSTRAINT `receita_fk0` FOREIGN KEY (`id_paciente`) REFERENCES `paciente`(`id`);

ALTER TABLE `internacao` ADD CONSTRAINT `internacao_fk0` FOREIGN KEY (`id_medico`) REFERENCES `medico`(`id`);

ALTER TABLE `internacao` ADD CONSTRAINT `internacao_fk1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente`(`id`);

ALTER TABLE `internacao` ADD CONSTRAINT `internacao_fk2` FOREIGN KEY (`id_quarto`) REFERENCES `quarto`(`id`);

ALTER TABLE `internacao` ADD CONSTRAINT `internacao_fk3` FOREIGN KEY (`id_enfermeira`) REFERENCES `enfermeiros`(`id`);

ALTER TABLE `quarto` ADD CONSTRAINT `quarto_fk0` FOREIGN KEY (`tipo`) REFERENCES `tipo_quartos`(`id`);











