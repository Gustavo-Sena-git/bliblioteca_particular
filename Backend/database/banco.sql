CREATE DATABASE IF NOT EXISTS biblioteca_pessoal
DEFAULT CHARACTER SET utf8mb4;

USE biblioteca_pessoal;

CREATE TABLE IF NOT EXISTS livros (
    idLivro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    numero_paginas INT NOT NULL,
    pagina_atual INT NOT NULL DEFAULT 0,
    situacao ENUM('Quero ler', 'Lendo', 'Lido') NOT NULL DEFAULT 'Quero ler',
    data_comeco DATE NULL,
    data_termino DATE NULL,
    anotacoes TEXT NULL,
    cor_capa VARCHAR(20) NOT NULL DEFAULT '#1E3A5F'
);

CREATE TABLE IF NOT EXISTS emprestimos (
    idEmprestimo INT AUTO_INCREMENT PRIMARY KEY,
    idLivro INT NOT NULL,
    nome_pessoa VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    data_devolvido DATE NULL, -- NULL = emprestado agora | preenchido = já devolvido (histórico)
    FOREIGN KEY (idLivro) REFERENCES livros(idLivro) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS metas_leitura (
    ano INT PRIMARY KEY,
    quantidade_meta INT NOT NULL
);

-- Meta que aparece no menu lateral (IGNORE evita erro se o script rodar de novo)
INSERT IGNORE INTO metas_leitura (ano, quantidade_meta) VALUES (2026, 24);