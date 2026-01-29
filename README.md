# Guia de Instalação e Uso - Sistema de Inventário MySQL

## 📋 Pré-requisitos

1. **MySQL instalado** no seu computador
   - Baixar em: https://dev.mysql.com/downloads/mysql/
   - Ou usar XAMPP/WAMP que já incluem MySQL

2. **Cliente MySQL** para executar os comandos:
   - MySQL Workbench (recomendado, interface gráfica)
   - phpMyAdmin (se usar XAMPP/WAMP)
   - Linha de comando MySQL

## 🚀 Passo a Passo para Iniciar

### Passo 1: Criar o Banco de Dados

1. Abra seu cliente MySQL (Workbench, phpMyAdmin ou terminal)
2. Execute o arquivo `criar_banco_inventario.sql`
3. Isso vai:
   - Criar o banco de dados `inventario_estoque`
   - Criar a tabela `inventario`
   - Inserir 4 itens de exemplo para teste

**No MySQL Workbench:**
- File → Open SQL Script → selecione `criar_banco_inventario.sql`
- Clique no ícone de raio ⚡ para executar

**Na linha de comando:**
```bash
mysql -u root -p < criar_banco_inventario.sql
```

### Passo 2: Organizar as Fotos

Crie uma estrutura de pastas para suas fotos:

```
meu_projeto/
├── fotos/
│   ├── caneta_azul.jpg
│   ├── caderno_100fls.jpg
│   └── ...
└── banco_de_dados/
    ├── criar_banco_inventario.sql
    └── consultas_uteis.sql
```

**Importante:** O caminho que você coloca no banco (`foto_caminho`) deve corresponder 
à localização real do arquivo no seu sistema.

### Passo 3: Usar o Sistema

Use o arquivo `consultas_uteis.sql` como referência para:
- Inserir novos itens
- Atualizar quantidades
- Buscar itens
- Gerar relatórios

## 📝 Operações Comuns

### Adicionar um novo item ao inventário

```sql
INSERT INTO inventario (foto_caminho, nome_item, quantidade) 
VALUES ('fotos/meu_produto.jpg', 'Meu Produto', 15);
```

### Atualizar quantidade (entrada de mercadoria)

```sql
-- Adicionar 10 unidades ao item ID 1
UPDATE inventario 
SET quantidade = quantidade + 10 
WHERE id = 1;
```

### Atualizar quantidade (saída de mercadoria)

```sql
-- Remover 5 unidades do item ID 1
UPDATE inventario 
SET quantidade = quantidade - 5 
WHERE id = 1;
```

### Ver itens com estoque baixo

```sql
SELECT * FROM inventario 
WHERE quantidade < 10;
```

## 🔍 Conectar com Aplicações

Se você quiser criar uma interface web ou desktop, aqui estão exemplos de conexão:

### PHP
```php
<?php
$servername = "localhost";
$username = "root";
$password = "sua_senha";
$dbname = "inventario_estoque";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

$sql = "SELECT * FROM inventario";
$result = $conn->query($sql);

while($row = $result->fetch_assoc()) {
    echo "Item: " . $row["nome_item"] . " - Qtd: " . $row["quantidade"];
}
?>
```

### Python
```python
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="sua_senha",
    database="inventario_estoque"
)

cursor = conn.cursor()
cursor.execute("SELECT * FROM inventario")

for (id, foto, nome, qtd, data_cad, data_atl) in cursor:
    print(f"{nome}: {qtd} unidades")

conn.close()
```

## 🛡️ Segurança e Backup

### Fazer backup do banco

```bash
mysqldump -u root -p inventario_estoque > backup_inventario.sql
```

### Restaurar backup

```bash
mysql -u root -p inventario_estoque < backup_inventario.sql
```

## 💡 Dicas

1. **Nomear fotos de forma consistente**: use nomes sem espaços e caracteres especiais
2. **Fazer backup regularmente**: especialmente antes de grandes mudanças
3. **Usar IDs para referências**: nunca use o nome do item como chave, sempre use o ID
4. **Validar caminhos de fotos**: certifique-se que os arquivos existem antes de inserir

## ❓ Problemas Comuns

**Erro: "Access denied for user"**
- Verifique usuário e senha do MySQL
- Use `root` como usuário padrão (em desenvolvimento)

**Erro: "Table doesn't exist"**
- Execute primeiro o arquivo `criar_banco_inventario.sql`
- Certifique-se de estar usando o banco correto: `USE inventario_estoque;`

**Fotos não aparecem**
- Verifique se o caminho no banco está correto
- Verifique se o arquivo realmente existe na pasta