# 📦 Sistema de Inventário Bernoulli

Sistema web para controle de estoque com interface visual.

---

## 🚀 Instalação

### 1. Executar setup
```bash
sudo mariadb < setup_completo.sql
```

### 2. Iniciar servidor
```bash
cd ~/Bernoulli
php -S localhost:8000
```

### 3. Acessar
```
http://localhost:8000
```

---

## 📊 Consultas SQL Úteis

### Ver todos os itens
```sql
SELECT id, nome_item, quantidade, foto_caminho, data_cadastro 
FROM inventario 
ORDER BY nome_item;
```

### Inserir novo item
```sql
INSERT INTO inventario (foto_caminho, nome_item, quantidade) 
VALUES ('fotos/novo_item.png', 'Nome do Item', 10);
```

### Atualizar quantidade
```sql
UPDATE inventario 
SET quantidade = 45 
WHERE id = 1;
```

### Entrada de estoque (adicionar)
```sql
UPDATE inventario 
SET quantidade = quantidade + 20 
WHERE id = 1;
```

### Saída de estoque (remover)
```sql
UPDATE inventario 
SET quantidade = quantidade - 5 
WHERE id = 1;
```

### Ver estoque baixo
```sql
SELECT * FROM inventario 
WHERE quantidade < 10 
ORDER BY quantidade ASC;
```

### Buscar por nome
```sql
SELECT * FROM inventario 
WHERE nome_item LIKE '%caneta%';
```

### Deletar item
```sql
DELETE FROM inventario 
WHERE id = 10;
```

### Relatório com status
```sql
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
```

### Totais
```sql
-- Total de itens
SELECT COUNT(*) as total_itens FROM inventario;

-- Total de unidades
SELECT SUM(quantidade) as total_unidades FROM inventario;
```

---

## 🔧 Estrutura

```
/home/brnrdzschbr/Debian/Bernoulli/
├── fotos/              # Imagens dos produtos (.png)
├── index.html          # Interface web
├── api.php             # API backend
└── setup_completo.sql  # Instalação do banco
```

---

## 💾 Backup

```bash
# Fazer backup
mysqldump -u inventario -p inventario_estoque > backup_$(date +%Y%m%d).sql

# Restaurar backup
mysql -u inventario -p inventario_estoque < backup_20260128.sql
```

---

## 📝 Acessar o banco

```bash
sudo mariadb
```

```sql
USE inventario_estoque;
SELECT * FROM inventario;
```