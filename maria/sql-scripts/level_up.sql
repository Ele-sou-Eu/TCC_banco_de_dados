-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 11-Maio-2023 às 22:52
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `level_up`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
  `cpf` bigint(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `e-mail` varchar(60) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`cpf`, `nome`, `e-mail`) VALUES
(7639173469, 'Leonardo de Freitas Bernardo', 'leonardo_ancora@hotmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `conquista`
--

CREATE TABLE IF NOT EXISTS `conquista` (
  `matricula` bigint(11) NOT NULL,
  `nome_conquista` varchar(30) DEFAULT NULL,
  `habilidade` int(11) DEFAULT NULL,
  `porcentagem` decimal(3,1) DEFAULT NULL,
  KEY `matrícula` (`matricula`),
  KEY `habilidade` (`habilidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `codigo_curso` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL,
  `tipo` enum('Licenciatura','Bacharelado','Tecnológico') NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `status` enum('Ativo','Inativo') NOT NULL DEFAULT 'Ativo',
  PRIMARY KEY (`codigo_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`codigo_curso`, `nome`, `tipo`, `departamento`, `cidade`, `status`) VALUES
(1, 'Ciências e Tecnologia', 'Bacharelado', 'Escola de Ciências e Tecnologia', 'Natal', 'Ativo'),
(2, 'Engenharia de Computação', 'Bacharelado', 'Centro de Tecnologia', 'Natal', 'Ativo'),
(3, 'Tecnologia da Informação', 'Bacharelado', 'Instituto Metrópole Digital', 'Natal', 'Ativo'),
(5, 'Javascript', 'Bacharelado', 'Sei lá', 'Natal', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `desempenho`
--

CREATE TABLE IF NOT EXISTS `desempenho` (
  `matricula` bigint(11) NOT NULL,
  `codigo_disciplina` varchar(7) NOT NULL,
  `semestre` decimal(5,1) NOT NULL,
  `nota_1` decimal(4,2) DEFAULT NULL,
  `nota_2` decimal(4,2) DEFAULT NULL,
  `nota_3` decimal(4,2) DEFAULT NULL,
  `nota_final` decimal(4,2) DEFAULT NULL,
  `media` decimal(4,2) DEFAULT NULL,
  KEY `Código_disciplina` (`codigo_disciplina`),
  KEY `Matrícula` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `desempenho`
--

INSERT INTO `desempenho` (`matricula`, `codigo_disciplina`, `semestre`, `nota_1`, `nota_2`, `nota_3`, `nota_final`, `media`) VALUES
(2013020980, 'ECT2101', '2013.1', '10.00', NULL, NULL, NULL, NULL),
(2013020980, 'ECT2102', '2013.1', '10.00', NULL, NULL, NULL, NULL),
(2013020980, 'ECT2103', '2013.1', '8.00', NULL, NULL, NULL, NULL),
(2013020980, 'ECT2104', '2013.1', '8.10', NULL, NULL, NULL, NULL),
(2013020980, 'ECT2105', '2013.1', '8.40', NULL, NULL, NULL, NULL),
(2013020980, 'ECT2106', '2013.1', '8.50', NULL, NULL, NULL, NULL),
(123456, 'ECT2101', '2021.1', '10.00', '9.00', '7.00', NULL, '8.66'),
(123456, 'ECT2102', '2021.2', '4.50', NULL, NULL, NULL, NULL),
(123456, 'ECT2103', '0.0', '9.00', NULL, NULL, NULL, NULL),
(123456, 'ECT2103', '0.0', '9.00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE IF NOT EXISTS `disciplina` (
  `codigo_disciplina` varchar(7) NOT NULL DEFAULT '',
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `disciplina`
--

INSERT INTO `disciplina` (`codigo_disciplina`, `nome`) VALUES
('ECT2101', 'Pré-Cálculo'),
('ECT2102', 'Vetores e Geometria Analítica'),
('ECT2103', 'Cálculo I'),
('ECT2104', 'Química Geral'),
('ECT2105', 'Práticas de Leitura e Escrita I'),
('ECT2106', 'Ciência, Tecnologia e Sociedade'),
('ECT2201', 'Cálculo II'),
('ECT2202', 'Álgebra Linear'),
('ECT2203', 'Lógica de Programação'),
('ECT2204', 'Introdução à Física Clássica I'),
('ECT2205', 'Práticas de Leitura e Escrita II'),
('ECT2206', 'Gestão e Economia da Ciência, Tecnologia e Inovação'),
('ECT2207', 'Probabilidade e Estatística'),
('ECT2301', 'Cálculo III'),
('ECT2302', 'Metodologia Científica e Tecnológica'),
('ECT2303', 'Linguagem de Programação'),
('ECT2304', 'Introdução à Física Clássica II'),
('ECT2305', 'Prática de Leitura em Inglês'),
('ECT2306', 'Meio Ambiente e Desenvolvimento Urbano'),
('ECT2307', 'Física Experimental I'),
('ECT2401', 'Computação Numérica'),
('ECT2402', 'Introdução à Física Clássica III'),
('ECT2403', 'Física Experimental II'),
('ECT2411', 'Ciência e Tecnologia dos Materiais'),
('ECT2412', 'Mecânica dos Sólidos'),
('ECT2413', 'Mecânica dos Fluidos'),
('ECT2416', 'Expressão Gráfica'),
('IMD0017', 'Práticas de Leitura e Escrita em Português'),
('IMD0018', 'Práticas de Leitura em Inglês'),
('IMD0020', 'Tecnologia da Informação e Sociedade'),
('IMD1001', 'Matemática Elementar'),
('IMD1002', 'Análise Combinatória'),
('IMD1003', 'Geometria Euclidiana'),
('IMD1004', 'Pensamento Computacional');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estrutura_curricular`
--

CREATE TABLE IF NOT EXISTS `estrutura_curricular` (
  `codigo_curso` int(11) NOT NULL,
  `especializacao` varchar(30) DEFAULT NULL,
  `turno` varchar(30) NOT NULL,
  `codigo_disciplina` varchar(7) NOT NULL,
  `obrigatoriedade` enum('Obrigatória','Optativa') NOT NULL,
  `semestre` int(11) NOT NULL,
  KEY `Código_curso` (`codigo_curso`),
  KEY `Código_disciplina` (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `estrutura_curricular`
--

INSERT INTO `estrutura_curricular` (`codigo_curso`, `especializacao`, `turno`, `codigo_disciplina`, `obrigatoriedade`, `semestre`) VALUES
(1, NULL, '', 'ECT2101', 'Obrigatória', 1),
(1, NULL, '', 'ECT2102', 'Obrigatória', 1),
(1, NULL, '', 'ECT2103', 'Obrigatória', 1),
(1, NULL, '', 'ECT2104', 'Obrigatória', 1),
(1, NULL, '', 'ECT2105', 'Obrigatória', 1),
(1, NULL, '', 'ECT2106', 'Obrigatória', 1),
(2, NULL, '', 'ECT2101', 'Obrigatória', 1),
(2, NULL, '', 'ECT2102', 'Obrigatória', 1),
(2, NULL, '', 'ECT2103', 'Obrigatória', 1),
(2, NULL, '', 'ECT2104', 'Obrigatória', 1),
(2, NULL, '', 'ECT2105', 'Obrigatória', 1),
(2, NULL, '', 'ECT2106', 'Obrigatória', 1),
(3, NULL, '', 'IMD0017', 'Obrigatória', 1),
(3, NULL, '', 'IMD0018', 'Obrigatória', 1),
(3, NULL, '', 'IMD0020', 'Obrigatória', 1),
(3, NULL, '', 'IMD1001', 'Obrigatória', 1),
(3, NULL, '', 'IMD1002', 'Obrigatória', 1),
(3, NULL, '', 'IMD1003', 'Obrigatória', 1),
(3, NULL, '', 'IMD1004', 'Obrigatória', 1),
(2, NULL, '', 'ECT2201', 'Obrigatória', 2),
(2, NULL, '', 'ECT2202', 'Obrigatória', 2),
(2, NULL, '', 'ECT2203', 'Obrigatória', 2),
(2, NULL, '', 'ECT2204', 'Obrigatória', 2),
(2, NULL, '', 'ECT2205', 'Obrigatória', 2),
(2, NULL, '', 'ECT2206', 'Obrigatória', 2),
(2, NULL, '', 'ECT2207', 'Obrigatória', 2),
(2, NULL, '', 'ECT2301', 'Obrigatória', 3),
(2, NULL, '', 'ECT2302', 'Obrigatória', 3),
(2, NULL, '', 'ECT2303', 'Obrigatória', 3),
(2, NULL, '', 'ECT2304', 'Obrigatória', 3),
(2, NULL, '', 'ECT2305', 'Obrigatória', 3),
(2, NULL, '', 'ECT2306', 'Obrigatória', 3),
(2, NULL, '', 'ECT2307', 'Obrigatória', 3),
(2, NULL, '', 'ECT2416', 'Obrigatória', 3),
(2, NULL, '', 'ECT2401', 'Obrigatória', 4),
(2, NULL, '', 'ECT2402', 'Obrigatória', 4),
(2, NULL, '', 'ECT2403', 'Obrigatória', 4),
(2, NULL, '', 'ECT2411', 'Obrigatória', 4),
(2, NULL, '', 'ECT2412', 'Obrigatória', 4),
(2, NULL, '', 'ECT2413', 'Obrigatória', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `habilidade`
--

CREATE TABLE IF NOT EXISTS `habilidade` (
  `codigo_habilidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `codigo_curso` int(11) DEFAULT NULL,
  `codigo_disciplina` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`codigo_habilidade`),
  KEY `código_curso` (`codigo_curso`),
  KEY `código_disciplina` (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

CREATE TABLE IF NOT EXISTS `matricula` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `matricula` bigint(11) NOT NULL,
  `senha` text NOT NULL,
  `cpf_aluno` bigint(11) NOT NULL,
  `curso` int(11) NOT NULL,
  `status` enum('Ativo','Concluído','Inativo') NOT NULL DEFAULT 'Ativo',
  `semestre_entrada` decimal(5,1) NOT NULL,
  `semestre_conclusao` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cpf_aluno` (`cpf_aluno`),
  KEY `Curso` (`curso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `matricula`
--

INSERT INTO `matricula` (`id`, `matricula`, `senha`, `cpf_aluno`, `curso`, `status`, `semestre_entrada`, `semestre_conclusao`) VALUES
(1, 123456, '$2b$10$sWzRI42jQ38dfPU4Wc9f1eDyHiqvmmKwBBeDt7jMGc8oV.FEfv2tC', 7639173469, 2, 'Ativo', '2021.0', NULL),
(2, 20180009734, '$2a$12$./MibQFUXfeHnOwCPiK6beY71HmHR1HU9z8S2CUEdWjto408oilxS', 7639173469, 2, 'Ativo', '2018.1', NULL),
(3, 2013020980, '$2b$10$sWzRI42jQ38dfPU4Wc9f1eDyHiqvmmKwBBeDt7jMGc8oV.FEfv2tC', 7639173469, 2, 'Concluído', '2013.1', '2017.2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pre_req`
--

CREATE TABLE IF NOT EXISTS `pre_req` (
  `codigo_disciplina` varchar(7) DEFAULT NULL,
  `codigo_requisito` varchar(7) DEFAULT NULL,
  KEY `código_disciplina` (`codigo_disciplina`),
  KEY `código_requisito` (`codigo_requisito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pre_req`
--

INSERT INTO `pre_req` (`codigo_disciplina`, `codigo_requisito`) VALUES
('ECT2201', 'ECT2101'),
('ECT2201', 'ECT2102'),
('ECT2201', 'ECT2103'),
('ECT2202', 'ECT2102'),
('ECT2204', 'ECT2103'),
('ECT2205', 'ECT2105'),
('ECT2207', 'ECT2103'),
('ECT2301', 'ECT2201'),
('ECT2303', 'ECT2203'),
('ECT2304', 'ECT2204'),
('ECT2307', 'ECT2204'),
('ECT2416', 'ECT2203'),
('ECT2401', 'ECT2303'),
('ECT2401', 'ECT2103'),
('ECT2401', 'ECT2202'),
('ECT2402', 'ECT2301'),
('ECT2402', 'ECT2304'),
('ECT2403', 'ECT2307'),
('ECT2403', 'ECT2304'),
('ECT2411', 'ECT2104'),
('ECT2412', 'ECT2201'),
('ECT2412', 'ECT2204'),
('ECT2413', 'ECT2201'),
('ECT2413', 'ECT2304');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `conquista`
--
ALTER TABLE `conquista`
  ADD CONSTRAINT `conquista_ibfk_2` FOREIGN KEY (`habilidade`) REFERENCES `habilidade` (`codigo_habilidade`);

--
-- Limitadores para a tabela `desempenho`
--
ALTER TABLE `desempenho`
  ADD CONSTRAINT `desempenho_ibfk_2` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`);

--
-- Limitadores para a tabela `estrutura_curricular`
--
ALTER TABLE `estrutura_curricular`
  ADD CONSTRAINT `estrutura_curricular_ibfk_3` FOREIGN KEY (`codigo_curso`) REFERENCES `curso` (`codigo_curso`),
  ADD CONSTRAINT `estrutura_curricular_ibfk_4` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`);

--
-- Limitadores para a tabela `habilidade`
--
ALTER TABLE `habilidade`
  ADD CONSTRAINT `habilidade_ibfk_1` FOREIGN KEY (`codigo_curso`) REFERENCES `curso` (`codigo_curso`),
  ADD CONSTRAINT `habilidade_ibfk_2` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`);

--
-- Limitadores para a tabela `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`Cpf_aluno`) REFERENCES `aluno` (`Cpf`),
  ADD CONSTRAINT `matricula_ibfk_3` FOREIGN KEY (`Curso`) REFERENCES `curso` (`codigo_curso`);

--
-- Limitadores para a tabela `pre_req`
--
ALTER TABLE `pre_req`
  ADD CONSTRAINT `pre_req_ibfk_1` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`),
  ADD CONSTRAINT `pre_req_ibfk_2` FOREIGN KEY (`codigo_requisito`) REFERENCES `disciplina` (`codigo_disciplina`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
