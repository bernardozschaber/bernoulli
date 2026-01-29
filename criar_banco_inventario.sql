-- Script para criar banco de dados de inventário
-- MySQL

-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS inventario_estoque
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Usar o banco de dados
USE inventario_estoque;

-- Criar a tabela de inventário
CREATE TABLE IF NOT EXISTS inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    foto_caminho VARCHAR(500),
    nome_item VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_nome_item (nome_item),
    INDEX idx_quantidade (quantidade)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserir alguns exemplos de teste
INSERT INTO inventario (foto_caminho, nome_item, quantidade) VALUES
('fotos/caneta_azul.jpg', 'Caneta Azul', 50),
('fotos/caderno_100fls.jpg', 'Caderno 100 folhas', 30),
('fotos/borracha_branca.jpg', 'Borracha Branca', 100),
('fotos/lapis_preto.jpg', 'Lápis Preto HB', 75);

-- Consultar todos os itens
SELECT * FROM inventario;