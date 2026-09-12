<?php
header('Content-Type: application/json');

$path = $_GET['path'] ?? __FILE__;

if (!file_exists($path) || !is_file($path)) {
    http_response_code(404);
    echo json_encode([
        'ok' => false,
        'message' => 'File not found or path is not a file.'
    ], JSON_PRETTY_PRINT);
    exit;
}

$bytes = filesize($path);
$units = ['B', 'KB', 'MB', 'GB', 'TB'];
$size = $bytes;
$unitIndex = 0;

while ($size >= 1024 && $unitIndex < count($units) - 1) {
    $size /= 1024;
    $unitIndex++;
}

echo json_encode([
    'ok' => true,
    'file' => basename($path),
    'bytes' => $bytes,
    'human_readable' => round($size, 2) . ' ' . $units[$unitIndex],
    'modified_at' => date('c', filemtime($path))
], JSON_PRETTY_PRINT);
