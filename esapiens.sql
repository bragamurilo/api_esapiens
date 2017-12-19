-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/12/2017 às 19:43
-- Versão do servidor: 10.1.25-MariaDB
-- Versão do PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `esapiens`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_usuario`, `comentario`, `datetime`) VALUES
(1, 4, 'Comentário de um ASSINANTE!', '2017-12-18 03:28:14'),
(2, 2, 'Comentário de um NÃO assinante!', '2017-12-18 03:28:14'),
(3, 1, 'teste de horario', '2017-12-19 03:55:28'),
(5, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 13:19:28'),
(6, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 13:33:22'),
(7, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 13:33:37'),
(8, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 13:34:00'),
(9, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 15:55:52'),
(10, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 15:55:54'),
(11, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 15:55:55'),
(12, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 15:55:55'),
(13, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 15:55:56'),
(14, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 15:55:56'),
(15, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 15:55:56'),
(16, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 15:55:57'),
(17, 1, 'sa ashauhs uahs uahsau hau uashaush uahsauhsa haushas \n', '2017-12-19 15:55:57');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `id_postagem` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id`, `id_postagem`, `id_usuario`, `datetime`) VALUES
(1, 2, 1, '2017-12-19 13:34:00'),
(2, 2, 1, '2017-12-19 15:55:52'),
(3, 2, 1, '2017-12-19 15:55:54'),
(4, 2, 1, '2017-12-19 15:55:55'),
(5, 2, 1, '2017-12-19 15:55:55'),
(6, 2, 1, '2017-12-19 15:55:56'),
(7, 2, 1, '2017-12-19 15:55:56'),
(8, 2, 1, '2017-12-19 15:55:56'),
(9, 2, 1, '2017-12-19 15:55:57'),
(10, 2, 1, '2017-12-19 15:55:57');

-- --------------------------------------------------------

--
-- Estrutura para tabela `postagem_comentario`
--

CREATE TABLE `postagem_comentario` (
  `id_postagem` int(11) NOT NULL,
  `id_comentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `postagem_comentario`
--

INSERT INTO `postagem_comentario` (`id_postagem`, `id_comentario`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17);

-- --------------------------------------------------------

--
-- Estrutura para tabela `postagens`
--

CREATE TABLE `postagens` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `postagem` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `postagens`
--

INSERT INTO `postagens` (`id`, `id_usuario`, `postagem`, `datetime`) VALUES
(1, 1, 'Postagem de um ASSINANTE!', '2017-12-18 03:20:23'),
(2, 2, 'Postagem de um NÃO assinante!', '2017-12-18 03:20:23');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `assinante` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `login`, `assinante`) VALUES
(1, 'murilo_braga', 1),
(2, 'fulano', 0),
(3, 'ciclano', 0),
(4, 'beltrano', 1);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postagem` (`id_postagem`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `postagem_comentario`
--
ALTER TABLE `postagem_comentario`
  ADD KEY `id_postagem` (`id_postagem`),
  ADD KEY `id_comentario` (`id_comentario`);

--
-- Índices de tabela `postagens`
--
ALTER TABLE `postagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de tabela `postagens`
--
ALTER TABLE `postagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD CONSTRAINT `notificacoes_ibfk_1` FOREIGN KEY (`id_postagem`) REFERENCES `postagens` (`id`),
  ADD CONSTRAINT `notificacoes_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `postagem_comentario`
--
ALTER TABLE `postagem_comentario`
  ADD CONSTRAINT `postagem_comentario_ibfk_1` FOREIGN KEY (`id_postagem`) REFERENCES `postagens` (`id`),
  ADD CONSTRAINT `postagem_comentario_ibfk_2` FOREIGN KEY (`id_comentario`) REFERENCES `comentarios` (`id`);

--
-- Restrições para tabelas `postagens`
--
ALTER TABLE `postagens`
  ADD CONSTRAINT `postagens_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
