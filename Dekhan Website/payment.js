
    <script src="https://www.paypal.com/sdk/js?client-id=AUVu04KrVRUUbByH23Ggow6EHaZG6CXyRpItudluOBGSATF5OpSsXSHhdk9hzGhvk-rieod96BjJEA8f&currency=USD"></script>

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
    
