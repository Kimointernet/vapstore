<?php

require 'paypal_config.php';

use PayPalCheckoutSdk\Orders\OrdersCreateRequest;

$request = new OrdersCreateRequest();
$request->prefer('return=representation');
$request->body = [
    "intent" => "CAPTURE",
    "purchase_units" => [[
        "amount" => [
            "currency_code" => "USD",
            "value" => "50.00" // المبلغ المراد دفعه
        ]
    ]],
    "application_context" => [
        "cancel_url" => "http://localhost/Dekhan Website/cancel.php",
        "return_url" => "http://localhost/Dekhan Website/success.php"
    ]
];

try {
    $response = $client->execute($request);
    foreach ($response->result->links as $link) {
        if ($link->rel === 'approve') {
            header("Location: $link->href");
            exit;
        }
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}

?>