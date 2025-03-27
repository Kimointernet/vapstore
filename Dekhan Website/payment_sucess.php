<?php
session_start();
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require 'mailer/autoload.php';

// التحقق من البيانات
$amount = isset($_GET['amount']) ? number_format((float)$_GET['amount'], 2) : "0.00";
$txn_id = isset($_GET['txn_id']) ? htmlspecialchars($_GET['txn_id']) : "Unknown";
$payer_name = isset($_SESSION['payer_name']) ? $_SESSION['payer_name'] : "Unknown";
$payer_email = isset($_SESSION['payer_email']) ? $_SESSION['payer_email'] : "Unknown";

// عرض تفاصيل الدفع
echo "<div style='text-align: center; padding: 20px;'>";
echo "<h2 style='color: green;'>✅ Payment Successful!</h2>";
echo "<p>💵 Amount Paid: <strong>AU$" . $amount . "</strong></p>";
echo "<p>📌 Transaction ID: <strong>" . $txn_id . "</strong></p>";
echo "<p>👤 Customer Name: <strong>" . htmlspecialchars($payer_name) . "</strong></p>";
echo "<p>📧 Customer Email: <strong>" . htmlspecialchars($payer_email) . "</strong></p>";
echo "</div>";

// إعداد محتوى البريد الإلكتروني
$payment_details = "<h2>Payment Details:</h2>
                    <p>Amount Paid: AU$$amount</p>
                    <p>Transaction ID: $txn_id</p>
                    <p>Customer Name: $payer_name</p>
                    <p>Customer Email: $payer_email</p>";

// إعداد بيانات SMTP (يُفضل استخدام متغيرات بيئية بدلاً من وضع القيم مباشرةً)
$smtp_host = getenv('SMTP_HOST') ?: 'smtp.gmail.com';
$smtp_user = getenv('SMTP_USER') ?: 'vap7280@gmail.com';
$smtp_pass = getenv('SMTP_PASS') ?: 'bzum rvgi agft doyv';
$recipient = getenv('RECIPIENT_EMAIL') ?: 'vap7280@gmail.com';

// إرسال الإيميل
$mail = new PHPMailer(true);
try {
    $mail->isSMTP();
    $mail->Host = $smtp_host;
    $mail->SMTPAuth = true;
    $mail->Username = $smtp_user;
    $mail->Password = $smtp_pass;
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
    $mail->Port = 465;

    // إعداد البريد
    $mail->setFrom($smtp_user, 'Your E-Commerce Store');
    $mail->addAddress($recipient);
    $mail->isHTML(true);
    $mail->CharSet = 'UTF-8';
    $mail->Subject = 'Payment Successful';
    $mail->Body    = $payment_details;

    // إرسال البريد
    $mail->send();
    echo "<a href='index.php' class='checkout-btn' style='display: inline-block; padding: 10px 20px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px; margin-top: 20px;'>🏠 Return to Home</a>";
} catch (Exception $e) {
    error_log("Error sending email: " . $mail->ErrorInfo);
}
?>