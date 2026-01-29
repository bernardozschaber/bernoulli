<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

// Configurações do banco de dados
$host = 'localhost';
$dbname = 'inventario_estoque';
$username = 'inventario';  // Altere se necessário
$password = 'raja';      // Altere se você configurou senha

try {
    // Conectar ao banco de dados
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Buscar todos os itens
    $stmt = $pdo->query("
        SELECT 
            id, 
            foto_caminho, 
            nome_item, 
            quantidade, 
            data_cadastro, 
            data_atualizacao 
        FROM inventario 
        ORDER BY nome_item ASC
    ");
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Calcular estatísticas
    $statsStmt = $pdo->query("
        SELECT 
            COUNT(*) as total_items,
            SUM(quantidade) as total_units,
            SUM(CASE WHEN quantidade < 10 THEN 1 ELSE 0 END) as low_stock
        FROM inventario
    ");
    $stats = $statsStmt->fetch(PDO::FETCH_ASSOC);
    
    // Ajustar caminhos das fotos para serem acessíveis pelo navegador
    foreach ($items as &$item) {
        if (!empty($item['foto_caminho'])) {
            // Converter caminho absoluto para relativo
            $item['foto_caminho'] = str_replace(
                '/home/brnrdzschbr/Debian/Bernoulli/fotos/',
                'fotos/',
                $item['foto_caminho']
            );
        }
    }
    
    // Retornar dados em JSON
    echo json_encode([
        'success' => true,
        'items' => $items,
        'stats' => [
            'total_items' => (int)$stats['total_items'],
            'total_units' => (int)$stats['total_units'],
            'low_stock' => (int)$stats['low_stock']
        ]
    ], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    
} catch (PDOException $e) {
    // Retornar erro em JSON
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'error' => 'Erro ao conectar ao banco de dados: ' . $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);
}
?>
