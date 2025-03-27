<?php

require 'paypal_config.php';

use PayPalCheckoutSdk\Orders\OrdersCaptureRequest;

if (isset($_GET['token'])) {
    $orderId = $_GET['order_id'];

    $request = new OrdersCaptureRequest($orderId);
    $request->prefer('return=representation');

    try {
        $response = $client->execute($request);
        echo "Payment successful!";
        print_r($response->result);
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}

?>