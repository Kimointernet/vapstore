<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

require 'mailer/autoload.php';
session_start();
include "db.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    
    // استقبال بيانات المستخدم بعد التأكد من صحتها
    $fname = htmlspecialchars($_POST["firstname"]);
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $phone =htmlspecialchars($_POST['phone']);
    $address = htmlspecialchars($_POST['address']);
    $city = htmlspecialchars($_POST['city']);
    $Street =htmlspecialchars($_POST['street']);
    $House =htmlspecialchars($_POST['house']);
    $state = htmlspecialchars($_POST['state']);
    $user_id = $_SESSION["uid"];
    $total_count = intval($_POST['total_count']);
    $total_price = floatval($_POST['total_price']);

    // التحقق من البريد الإلكتروني
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("البريد الإلكتروني غير صالح.");
    }
    $total_count = isset($_POST['total_count']) && !empty($_POST['total_count']) ? intval($_POST['total_count']) : 0;

    // تجميع تفاصيل الطلب والمنتجات
    $order_details = "<h2>تفاصيل الشراء</h2>
        <p><strong>Full Name:</strong> $fname</p>
        <p><strong>Email:</strong> $email</p>
        <p><strong>Phone:</strong> $phone</p>
        <p><strong>Address:</strong> $address</p>
        <p><strong>City:</strong> $city</p>
        <p><strong>Street Address:</strong> $Street</p>
        <p><strong>House Address:</strong> $House</p>
        <p><strong>State:</strong> $state</p>
        <p><strong>Total products:</strong> $total_count</p>
        <h3>Order details:</h3>
        <table border='1' cellpadding='5' cellspacing='0'>
            <tr>
                <th>Product name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total price</th>
            </tr>";

    $final_total = 0; // إجمالي التكلفة النهائية

    // جمع معلومات المنتجات
    for ($i = 1; $i <= $total_count; $i++) {
        if (isset($_POST["prod_price_$i"], $_POST["prod_qty_$i"])) {
           
            $amount = floatval($_POST["prod_price_$i"]);
            $quantity = intval($_POST["prod_qty_$i"]);
            $item_name_=$_POST['item_name_'.$i];
            
            $subtotal = $amount * $quantity; // حساب المجموع الفرعي لكل منتج
            $final_total += $subtotal; // تجميع التكلفة النهائية

            $order_details .= "
            <tr>
                <td>$item_name_</td>
                <td>$quantity</td>
                <td>$$amount</td>
                <td>$$subtotal</td>
            </tr><br>";
    }
}

    $order_details .= "</table><h3>Total full cost: $$final_total</h3>"; // إضافة التكلفة الكلية

    // إعداد وإرسال البريد الإلكتروني
    $mail = new PHPMailer(true);
    try {
        // إعدادات SMTP
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'vap7280@gmail.com'; // ضع بريدك هنا
        $mail->Password = 'bzum rvgi agft doyv'; // استخدم كلمة مرور التطبيق
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->Port = 465;

        // إعدادات البريد
        $mail->setFrom('vap7280@gmail.com', 'متجرك الإلكتروني');
        $mail->addAddress('vap7280@gmail.com'); // ضع عنوان البريد الذي سيستقبل الإشعار

        $mail->isHTML(true);
        $mail->CharSet = 'UTF-8';
        $mail->Subject = 'طلب شراء جديد من العميل';
        $mail->Body    = $order_details;

        // إرسال البريد
        $mail->send();
        
        echo "<script>
        alert('Request details have been sent successfully, now you can return to complete the payment process!');
        window.location.href = 'cart.php'; // أو أي صفحة تريد تحويل المستخدم إليها
      </script>";
        } catch (Exception $e) {
        echo "حدث خطأ أثناء إرسال البريد: {$mail->ErrorInfo}";
    }
}
?>