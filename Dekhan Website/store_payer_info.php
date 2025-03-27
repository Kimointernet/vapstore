<?php
session_start();

// استلام البيانات من fetch وحفظها في $_SESSION
$data = json_decode(file_get_contents("php://input"), true);

if (isset($data['payer_name'], $data['payer_email'])) {
    $_SESSION['payer_name'] = htmlspecialchars($data['payer_name']);
    $_SESSION['payer_email'] = filter_var($data['payer_email'], FILTER_VALIDATE_EMAIL);
}
?>