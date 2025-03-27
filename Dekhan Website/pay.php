<?php
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['total_price'])) {
        $_SESSION['final_price'] = floatval($_POST['total_price']); // تأكيد أن السعر رقم
    }
    header("Location: checkout.php");
    exit();
}
    ?>
<div>

    <h3>Payment</h3>
    <label for="fname">Accepted Payment Methods</label>
    <div class="icon-container">
        <i class="fa fa-cc-paypal" style="color:blue;"></i>
        <i class="fa fa-cc-visa" style="color:navy;"></i>
        <i class="fa fa-cc-mastercard" style="color:red;"></i>
    </div>
    
    <!-- زر الدفع الخاص بـ PayPal -->
    <div id="paypal-button-container"></div>
    
    <script src="https://www.paypal.com/sdk/js?client-id=AUVu04KrVRUUbByH23Ggow6EHaZG6CXyRpItudluOBGSATF5OpSsXSHhdk9hzGhvk-rieod96BjJEA8f&currency=USD"></script>
    <script>
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<?php echo $total; ?>' // إجمالي المبلغ
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    alert('Transaction completed by ' + details.payer.name.given_name);
                    window.location.href = "payment_sucess.php?orderID=" + details.id;
                });
            }
        }).render('#paypal-button-container'); // عرض الزر داخل هذا العنصر
    </script>
</div>



    
