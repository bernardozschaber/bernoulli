-- Script para criar tabela de usuários e autenticação
-- Execute este arquivo no banco de dados Railway

USE railway;

-- Criar tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    ativo TINYINT(1) DEFAULT 1,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultimo_acesso TIMESTAMP NULL,
    INDEX idx_username (username),
    INDEX idx_ativo (ativo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserir usuário admin padrão
-- Usuário: admin
-- Senha: admin123
-- IMPORTANTE: Mude a senha depois do primeiro login!
INSERT INTO usuarios (username, password_hash, nome_completo, email) 
VALUES ('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Administrador', 'admin@bernoulli.com');

-- Inserir usuário de teste
-- Usuário: bernoulli
-- Senha: bernoulli2024
INSERT INTO usuarios (username, password_hash, nome_completo, email) 
VALUES ('bernoulli', '$2y$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcoxVCe8h5JNDdIaoCvau', 'Usuário Bernoulli', 'usuario@bernoulli.com');

-- Verificar usuários criados
SELECT id, username, nome_completo, email, ativo, data_criacao FROM usuarios;