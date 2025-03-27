<?php
require_once "vendor/autoload.php";

use Omnipay\Omnipay;

define('CLIENT_ID', 'Adb0DY40LzpmM5sdgqOStSoenJ8wl-pgfRCrcAmCFwgKqEVPRGgsE7O-SL5Q9aaKv3kJG29JznWtOlPo');
define('CLIENT_SECRET', 'EOzSNYKY3wGq9J6G-7EbUBdLeb9X_0x5DoDNIkX9LFiTdAkzqwbbp5DiiY9IDGqlP1-iJ_37_knDncWj');

define('PAYPAL_RETURN_URL', 'http://localhost/paypal/success.php');
define('PAYPAL_CANCEL_URL', 'http://localhost/paypal/cancel.php');
define('PAYPAL_CURRENCY', 'USD'); // set your currency here

// Connect with the database
$db = new mysqli('localhost', 'root', '', 'paypal');

if ($db->connect_errno) {
    die("Connect failed: " . $db->connect_error);
}
$gateway = Omnipay::create('PayPal_Rest');
$gateway->initialize([
    'clientId' => CLIENT_ID,
    'secret' => CLIENT_SECRET,
    'testMode' => true, // قم بتغييره إلى false عند العمل في الوضع الحقيقي
]);