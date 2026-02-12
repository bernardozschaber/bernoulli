-- Script completo para criar sistema de inventário Bernoulli
-- Execução única cria: banco, tabela de inventário e itens

-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS inventario_estoque
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE inventario_estoque;

-- Criar tabela de inventário
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

-- Inserir itens do inventário
INSERT INTO inventario (foto_caminho, nome_item, quantidade) VALUES
('fotos/squeeze_aluminio_brilhante_600ml.png', 'Squeeze Alumínio Brilhante 600ml', 29),
('fotos/copo_jade_com_canuco_680ml.png', 'Copo Jade com Canudo 680ml', 18),
('fotos/copo_roxo_opaco_bernoulli_go.png', 'Copo Roxo Opaco Bernoulli Go', 100),
('fotos/copo_verde_opaco_bernoulli_go.png', 'Copo Verde Opaco Bernoulli Go', 120),
('fotos/copo_roxo_transparente_bernoulli_go.png', 'Copo Roxo Transparente Bernoulli Go', 40),
('fotos/copo_branco_se_o_olho_brilha.png', 'Copo Branco Se o Olho Brilha', 50),
('fotos/copo_branco_colegio_modulo.png', 'Copo Branco Colégio Módulo', 20),
('fotos/jogo_b_mind.png', 'Jogo B-Mind', 260),
('fotos/bernougoods.png', 'BernouGoods', 50),
('fotos/camisa_sou_bernoulli_preta.png', 'Camisa Sou Bernoulli Preta', 12),
('fotos/tubete_transparente_capsula_do_tempo.png', 'Tubete Transparente Cápsula do Tempo', 40),
('fotos/io_io_bernoulli_go.png', 'Iô-Iô Bernoulli Go', 70),
('fotos/tag_bernoulli_go.png', 'Tag Bernoulli Go', 300),
('fotos/porta_retrato_mdf.png', 'Porta Retrato MDF', 7),
('fotos/caderno_bernoulli_capa_preta_dia_dos_pais.png', 'Caderno Bernoulli Capa Preta Dia dos Pais', 100),
('fotos/canudo_formatura.png', 'Canudo Formatura', 70),
('fotos/planner.png', 'Planner', 4),
('fotos/giz_de_cera.png', 'Giz de Cera', 178),
('fotos/bone_bernoulli_go.png', 'Boné Bernoulli Go', 11),
('fotos/filtro_de_linha_1metro_06_tomadas.png', 'Filtro de Linha 1 Metro 06 Tomadas', 6),
('fotos/microfone_multi_purpose_sv100.png', 'Microfone Multi-Purpose SV100', 1),
('fotos/cabo_santo_angelo_ninjanm_457m.png', 'Cabo Santo Angelo NinjaNM 4,57m', 7),
('fotos/caderno_de_arame_roxo.png', 'Caderno de Arame Roxo', 260),
('fotos/carregador_portatil_20000mah_turbo_225w.png', 'Carregador Portátil 20000mAh Turbo 22.5W', 6),
('fotos/jone_sem_fio_jbl_wave_buds.png', 'Fone Sem Fio JBL Wave Buds', 1),
('fotos/meia_de_corrida_bernoulli.png', 'Meia de Corrida Bernoulli', 560),
('fotos/meia_kit_pioneiros_vse.png', 'Meia Kit Pioneiros VSE', 20),
('fotos/capacetes.png', 'Capacetes', 3),
('fotos/squeeze_azul.png', 'Squeeze Azul', 31),
('fotos/guarda_chuva_bernoulli.png', 'Guarda Chuva Bernoulli', 15),
('fotos/oculos_aquecimento_enem.png', 'Óculos Aquecimento ENEM', 75),
('fotos/camisa_producao_preta.png', 'Camisa Produção Preta', 12),
('fotos/cartucheiras.png', 'Cartucheiras', 30),
('fotos/caneca_champions.png', 'Caneca Champions', 9),
('fotos/caneta_preta_bernoulli_educacao.png', 'Caneta Preta Bernoulli Educação', 1080),
('fotos/caneta_bic_transparente.png', 'Caneta BIC Transparente', 1350);

-- Verificação
SELECT COUNT(*) as total_itens FROM inventario;
SELECT SUM(quantidade) as total_unidades FROM inventario;