<?php

	include "db.php";
	include "header.php"; 
/*//	
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['total_price'])) {
        $_SESSION['final_price'] = floatval($_POST['total_price']); // تأكيد أن السعر رقم
    }
    header("Location: checkout.php");
    exit();
}  */
	            
?>

<style>
.row-checkout {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container-checkout {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.checkout-btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.checkout-btn:hover {
  background-color: #45a049;
}
hr {
  border: 1px solid lightgrey;
}
span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row-checkout {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>

<p style="color: white; text-shadow: 0 0 10px blue, 0 0 20px blue, 0 0 30px blue;"><i class="fa fa-exclamation-triangle">NOTE:Just fill in the data once and in just a second you can pay.</i></p>

			
<form action="send_email.php" method="post" onsubmit="window.location.href='checkout.php';">
<section class="section">   	    
	<div class="container-fluid">
		<div class="row-checkout">
		<?php
if ($_SERVER["REQUEST_METHOD"] == "POST")
 {
    if (isset($_POST['phone'])) {
        // الحصول على رقم الهاتف
        $phone = $_POST['phone'];

        // إزالة أي أحرف غير الأرقام و + في بداية الرقم فقط
        $phone = preg_replace('/(?!^\+)\D/', '', $phone);

        // التحقق من أن الرقم صالح (7 إلى 15 رقمًا مع خيار + في البداية)
        if (!preg_match('/^\+?[0-9]{7,15}$/', $phone)) {
            echo "رقم الهاتف غير صالح. يرجى إدخال رقم صحيح.";
        } else {
            // رقم الهاتف صالح الآن
            echo "رقم الهاتف المدخل: " . htmlspecialchars($phone);
        }
    }
}
?>

		<?php
		if(isset($_SESSION["uid"])){
			$sql = "SELECT * FROM user_info 
			WHERE user_id='$_SESSION[uid]'";
			$query = mysqli_query($con,$sql);
			$row=mysqli_fetch_array($query);
			
		echo'
			<div class="col-75">
				<div class="container-checkout">
				<form id="checkout_form" action="checkout_process.php" method="POST" class="was-validated">
					<div class="row-checkout">
					
					<div class="col-50">
						<h3>Personal Information For Receiving An Order</h3>
						
						<p style="color: red; text-shadow: 0 0 10px red, 0 0 20px red, 0 0 30px red;"><i class="fa fa-exclamation-triangle">NOTE:Free delivery (delivery time ranges from 2 to 3 days)</i></p>
						
						<label for="fname"><i class="fa fa-user" ></i> Full Name</label>
						<input type="text" id="fname" class="form-control" name="firstname" pattern="^[a-zA-Z ]+$"  value="'.$row["first_name"].' '.$row["last_name"].'">
						<label for="email"><i class="fa fa-envelope"></i> Email</label>
						<input type="text" id="email" name="email" class="form-control" pattern="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9]+(\.[a-z]{2,4})$" value="'.$row["email"].'" required>					
    					<label for="phone"><i class="fa fa-phone"></i> Phone</label>
    					<input type="text" id="phone" name="phone" class="form-control" required>
						<label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
						<input type="text" id="adr" name="address" class="form-control" value="'.$row["address1"].'" required>
						<label for="city"><i class="fa fa-institution"></i> City</label>
						<input type="text" id="city" name="city" class="form-control" value="'.$row["address2"].'" pattern="^[a-zA-Z ]+$" required>
						<label for="street"><i class="fa fa-road"></i> Street Address</label>
						<input type="text" id="street" name="street" class="form-control" placeholder="Enter your street address" required>
						<label for="house"><i class="fa fa-home"></i> House Address</label>
						<input type="text" id="house" name="house" class="form-control" placeholder="Enter your house or apartment number" required>

						<div class="row">
						<div class="col-50">
							<label for="state">State</label>
							<input type="text" id="state" name="state" class="form-control" pattern="^[a-zA-Z ]+$" required>
						</div>
						
						</div>
					</div>
					
					
					
						
						
						

						<div class="row">
						
						<div class="col-50">
							
						</div>
					</div>
					</div>
					</div>
					<label><input type="CHECKBOX" name="q" 
					class="roomselect" value="conform" required>
					 Shipping address same as billing
					</label>';
					$i=1;
					$total=0;
					$total_count = isset($_POST['total_count']) && !empty($_POST['total_count']) ? intval($_POST['total_count']) : 0;
					while($i<=$total_count){
						$item_name_ = $_POST['item_name_'.$i];
						$amount_ = $_POST['amount_'.$i];
						$quantity_ = $_POST['quantity_'.$i];
						$total=$total+$amount_ ;
						$sql = "SELECT product_id FROM products 
								WHERE product_title='$item_name_'";
						$query = mysqli_query($con,$sql);
						$row=mysqli_fetch_array($query);
						
						echo "	
					
						<input type='hidden' name='prod_price_$i' value='$amount_'>
						<input type='hidden' name='prod_qty_$i' value='$quantity_'>
						<input type='hidden' name='item_name_$i' value='$item_name_'>
						
						";
						$i++;
					}
					
				echo'	
				<input type="hidden" name="total_count" value="'.$total_count.'">
					<input type="hidden" name="total_price" value="'.$total.'">
					
				</form>
				</div>
			</div>
			';
		}else{
			echo"<script>window.location.href = 'cart.php'</script>";
		}
		?>
		

			<div class="col-25">
				<div class="container-checkout">
				
				<?php
			
				if (isset($_POST["cmd"])) {
				
					$user_id = $_POST['custom'];
					
					
					$i=1;
					echo
					"
					<h4>Cart 
					<span class='price' style='color:black'>
					<i class='fa fa-shopping-cart'></i> 
					<b>$total_count</b>
					</span>
				</h4>

					<table class='table table-condensed'>
					<thead><tr>
					<th >no</th>
					<th >product title</th>
					<th >	qty	</th>
					<th >	amount</th></tr>
					</thead>
					<tbody>
					";
					$total=0;
					while($i<=$total_count){
						$item_name_ = $_POST['item_name_'.$i];
						
						$item_number_ = $_POST['item_number_'.$i];
						$quantity_ = $_POST['quantity_'.$i];
						$amount_ = $_POST['amount_'.$i]*$quantity_;
						
						
						$total=$total+$amount_;
						$sql = "SELECT product_id FROM 
							products WHERE product_title='$item_name_'";
						$query = mysqli_query($con,$sql);
						$row=mysqli_fetch_array($query);
						
					
						echo "	
						<input type='hidden' name='item_name_$i' value='$item_name_'>
						

						<tr><td><p>$item_number_</p></td>
						<td><p>$item_name_</p></td>
						<td ><p>$quantity_</p></td>
						<td><p>$amount_</p></td></tr>";
						
						$i++;
					}

				echo"

				</tbody>
				</table>
				<hr>
				
				<h3>total<span class='price' style='color:black'>
				<b>$$total</b></span></h3>";
					
				}
				?>
				</div>
			</div>
		</div>
	</div>
	
	<input type="hidden" name="final_price" id="final_price" value="<?php echo $total; ?>">
	<input type="submit" id="submit" value="send" 
					class="checkout-btn">
		<br><br><br><br>

					<p style="color: white; text-shadow: 0 0 10px blue, 0 0 20px blue, 0 0 30px blue;"><i class="fa fa-exclamation-triangle">NOTE:Send your Personal Information For Receiving An Order before Payment to ensure receipt of the order</i></p>
					<h2>Now complete the payment here:</h2>
					<input type="hidden" id="currency" value="AUD">
</section>
<div valign="center">

<h3>Payment</h3>


<label for="fname">Accepted Payment Methods</label>
<div class="icon-container">
    <i class="fa fa-cc-paypal" style="color:blue;"></i>
    <i class="fa fa-cc-visa" style="color:navy;"></i>
    <i class="fa fa-cc-mastercard" style="color:red;"></i>
</div>

<!-- زر الدفع الخاص بـ PayPal -->
<div id="paypal-button-container"></div>
<script>
    // قراءة العملة من العنصر المخفي
    var currency = document.getElementById('currency').value;

    // تحميل PayPal SDK بناءً على العملة المختارة
    var script = document.createElement('script');
    script.src = "https://www.paypal.com/sdk/js?client-id=???&currency=" + currency;
    script.onload = function() {
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            currency_code: currency, // استخدام العملة المختارة
                            value: document.getElementById('final_price').value // قراءة السعر النهائي
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    let amountPaid = document.getElementById('final_price').value;
                    let transactionID = details.id;

                    // إعادة التوجيه إلى صفحة النجاح
                    window.location.href = "payment_sucess.php?amount=" + amountPaid + "&txn_id=" + transactionID + "&currency=" + currency;
                });
            }
        }).render('#paypal-button-container');
    };
    document.body.appendChild(script);
</script>
    </div>
    

</form>	
<?php
include "newslettter.php";
include "footer.php";
?>

