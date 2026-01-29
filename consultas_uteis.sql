-- Consultas úteis para gerenciar o inventário
-- MySQL

USE inventario_estoque;

-- ===================================
-- CONSULTAS BÁSICAS
-- ===================================

-- Ver todos os itens do inventário
SELECT id, nome_item, quantidade, foto_caminho, data_cadastro 
FROM inventario 
ORDER BY nome_item;

-- Ver apenas itens com foto cadastrada
SELECT * FROM inventario 
WHERE foto_caminho IS NOT NULL;

-- Ver itens sem foto
SELECT * FROM inventario 
WHERE foto_caminho IS NULL;

-- ===================================
-- INSERIR NOVOS ITENS
-- ===================================

-- Inserir um novo item com foto
INSERT INTO inventario (foto_caminho, nome_item, quantidade) 
VALUES ('fotos/novo_item.jpg', 'Nome do Item', 10);

-- Inserir item sem foto (pode adicionar depois)
INSERT INTO inventario (nome_item, quantidade) 
VALUES ('Item sem foto', 20);

-- ===================================
-- ATUALIZAR DADOS
-- ===================================

-- Atualizar quantidade de um item específico
UPDATE inventario 
SET quantidade = 45 
WHERE id = 1;

-- Adicionar foto a um item que não tinha
UPDATE inventario 
SET foto_caminho = 'fotos/item_novo.jpg' 
WHERE id = 5;

-- Atualizar nome e quantidade ao mesmo tempo
UPDATE inventario 
SET nome_item = 'Caneta Azul BIC', quantidade = 60 
WHERE id = 1;

-- Aumentar quantidade (entrada de estoque)
UPDATE inventario 
SET quantidade = quantidade + 20 
WHERE id = 1;

-- Diminuir quantidade (saída de estoque)
UPDATE inventario 
SET quantidade = quantidade - 5 
WHERE id = 1;

-- ===================================
-- CONSULTAS PARA CONTROLE DE ESTOQUE
-- ===================================

-- Ver itens com estoque baixo (menos de 10 unidades)
SELECT * FROM inventario 
WHERE quantidade < 10 
ORDER BY quantidade ASC;

-- Ver itens sem estoque
SELECT * FROM inventario 
WHERE quantidade = 0;

-- Contar total de itens diferentes
SELECT COUNT(*) as total_itens FROM inventario;

-- Contar total de unidades em estoque
SELECT SUM(quantidade) as total_unidades FROM inventario;

-- Ver itens ordenados por quantidade (do menor para o maior)
SELECT * FROM inventario 
ORDER BY quantidade ASC;

-- ===================================
-- BUSCAR ITENS
-- ===================================

-- Buscar item por nome (busca exata)
SELECT * FROM inventario 
WHERE nome_item = 'Caneta Azul';

-- Buscar item por nome (busca parcial)
SELECT * FROM inventario 
WHERE nome_item LIKE '%caneta%';

-- Buscar item por ID
SELECT * FROM inventario 
WHERE id = 1;

-- ===================================
-- DELETAR ITENS
-- ===================================

-- Deletar um item específico por ID
DELETE FROM inventario 
WHERE id = 10;

-- Deletar itens com quantidade zero (cuidado!)
-- DELETE FROM inventario WHERE quantidade = 0;

-- ===================================
-- RELATÓRIOS
-- ===================================

-- Relatório completo com data de última atualização
SELECT 
    id,
    nome_item,
    quantidade,
    CASE 
        WHEN quantidade = 0 THEN 'SEM ESTOQUE'
        WHEN quantidade < 10 THEN 'ESTOQUE BAIXO'
        WHEN quantidade < 50 THEN 'ESTOQUE NORMAL'
        ELSE 'ESTOQUE BOM'
    END as status_estoque,
    data_atualizacao
FROM inventario
ORDER BY quantidade ASC;

-- ===================================
-- MANUTENÇÃO
-- ===================================

-- Ver estrutura da tabela
DESCRIBE inventario;

-- Limpar todos os dados (cuidado! não apaga a estrutura)
-- TRUNCATE TABLE inventario;

-- Resetar contador de ID
-- ALTER TABLE inventario AUTO_INCREMENT = 1;