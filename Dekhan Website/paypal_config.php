<?php

require 'vendor/autoload.php';

use PayPalCheckoutSdk\Core\PayPalHttpClient;
use PayPalCheckoutSdk\Core\SandboxEnvironment;

// قم بإدخال بيانات العميل والمفتاح السري من حساب PayPal Developer الخاص بك
$clientId = 'AZgIlIIy8kFfytfI7GjNk3rK3votPAfRX-tWXwHR--NYe8LHVwznz41YXwy95mHtcaO8azQWtxq2IL0p';
$clientSecret = 'EF9jbponC7Z_HIG5z2sYtfecWWbdSapP1ONb7w1UQoFu4RhgHS47utIArYDBD1qeGf1ul1Be4_9puwtb';

// إعداد البيئة: Sandbox للتجربة أو Production للنشر
$environment = new SandboxEnvironment($clientId, $clientSecret);
$client = new PayPalHttpClient($environment);

?>