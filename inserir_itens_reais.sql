-- Script para limpar dados de exemplo e adicionar itens reais do inventário
-- Execute este arquivo no MariaDB

USE inventario_estoque;

-- Limpar todos os itens de exemplo
DELETE FROM inventario;

-- Resetar o contador de ID para começar do 1
ALTER TABLE inventario AUTO_INCREMENT = 1;

-- Inserir todos os itens do inventário real
INSERT INTO inventario (foto_caminho, nome_item, quantidade) VALUES
('fotos/squeeze_aluminio_brilhante_600ml.jpg', 'Squeeze Alumínio Brilhante 600ml', 29),
('fotos/copo_jade_com_canuco_680ml.jpg', 'Copo Jade com Canudo 680ml', 18),
('fotos/copo_roxo_opaco_bernoulli_go.jpg', 'Copo Roxo Opaco Bernoulli Go', 100),
('fotos/copo_verde_opaco_bernoulli_go.jpg', 'Copo Verde Opaco Bernoulli Go', 120),
('fotos/copo_roxo_transparente_bernoulli_go.jpg', 'Copo Roxo Transparente Bernoulli Go', 40),
('fotos/copo_branco_se_o_olho_brilha.jpg', 'Copo Branco Se o Olho Brilha', 50),
('fotos/copo_branco_colegio_modulo.jpg', 'Copo Branco Colégio Módulo', 20),
('fotos/jogo_b_mind.jpg', 'Jogo B-Mind', 260),
('fotos/bernougoods.jpg', 'BernouGoods', 50),
('fotos/camisa_sou_bernoulli_preta.jpg', 'Camisa Sou Bernoulli Preta', 12),
('fotos/tubete_transparente_capsula_do_tempo.jpg', 'Tubete Transparente Cápsula do Tempo', 40),
('fotos/io_io_bernoulli_go.jpg', 'Iô-Iô Bernoulli Go', 70),
('fotos/tag_bernoulli_go.jpg', 'Tag Bernoulli Go', 300),
('fotos/porta_retrato_mdf.jpg', 'Porta Retrato MDF', 7),
('fotos/caderno_bernoulli_capa_preta_dia_dos_pais.jpg', 'Caderno Bernoulli Capa Preta Dia dos Pais', 100),
('fotos/canudo_formatura.jpg', 'Canudo Formatura', 70),
('fotos/planner.jpg', 'Planner', 4),
('fotos/giz_de_cera.jpg', 'Giz de Cera', 178),
('fotos/bone_bernoulli_go.jpg', 'Boné Bernoulli Go', 11),
('fotos/filtro_de_linha_1metro_06_tomadas.jpg', 'Filtro de Linha 1 Metro 06 Tomadas', 6),
('fotos/microfone_multi_purpose_sv100.jpg', 'Microfone Multi-Purpose SV100', 1),
('fotos/cabo_santo_angelo_ninjanm_457m.jpg', 'Cabo Santo Angelo NinjaNM 4,57m', 7),
('fotos/caderno_de_arame_roxo.jpg', 'Caderno de Arame Roxo', 260),
('fotos/carregador_portatil_20000mah_turbo_225w.jpg', 'Carregador Portátil 20000mAh Turbo 22.5W', 6),
('fotos/jone_sem_fio_jbl_wave_buds.jpg', 'Fone Sem Fio JBL Wave Buds', 1),
('fotos/meia_de_corrida_bernoulli.jpg', 'Meia de Corrida Bernoulli', 560),
('fotos/meia_kit_pioneiros_vse.jpg', 'Meia Kit Pioneiros VSE', 20),
('fotos/capacetes.jpg', 'Capacetes', 3),
('fotos/squeeze_azul.jpg', 'Squeeze Azul', 31),
('fotos/guarda_chuva_bernoulli.jpg', 'Guarda Chuva Bernoulli', 15),
('fotos/oculos_aquecimento_enem.jpg', 'Óculos Aquecimento ENEM', 75),
('fotos/camisa_producao_preta.jpg', 'Camisa Produção Preta', 12),
('fotos/cartucheiras.jpg', 'Cartucheiras', 30),
('fotos/caneca_champions.jpg', 'Caneca Champions', 9),
('fotos/caneta_preta_bernoulli_educacao.jpg', 'Caneta Preta Bernoulli Educação', 1080),
('fotos/caneta_bic_transparente.jpg', 'Caneta BIC Transparente', 1350);

-- Verificar quantos itens foram inseridos
SELECT COUNT(*) as total_itens FROM inventario;

-- Mostrar todos os itens
SELECT id, nome_item, quantidade FROM inventario ORDER BY id;

-- Mostrar total de unidades em estoque
SELECT SUM(quantidade) as total_unidades FROM inventario;

-- Mostrar itens com estoque baixo (menos de 10 unidades)
SELECT id, nome_item, quantidade FROM inventario WHERE quantidade < 10 ORDER BY quantidade ASC;