<?php
define('DB_SERVER', getenv('DB_SERVER'));
define('DB_USERNAME', getenv('DB_USERNAME'));
define('DB_PASSWORD', getenv('DB_PASSWORD'));
define('DB_DATABASE', getenv('DB_DATABASE'));

$dsn = "mysql:host=" . DB_SERVER . ";dbname=" . DB_DATABASE;
$username = DB_USERNAME;
$password = DB_PASSWORD;

echo DB_SERVER;
echo "\n";
echo DB_DATABASE;
echo "\n";
echo DB_USERNAME;
echo "\n";
echo DB_PASSWORD;
echo "\n";

try {
    $pdo = new PDO($dsn, $username, $password);
    // Use the $pdo object to interact with the database
    echo "Maybe success !!";
    echo "\n";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    echo "\n";
}
?>