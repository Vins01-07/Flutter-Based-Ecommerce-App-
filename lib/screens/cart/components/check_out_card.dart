import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:provider/provider.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/notification_provider.dart';
import '../../../constants.dart';
import '../../../models/Cart.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Success: ${response.paymentId}");
    // Dispatch Dynamic Notification logic!
    Provider.of<NotificationProvider>(context, listen: false).addNotification(
      NotificationModel(
        title: "Payment Successful ✅",
        description: "Thank you for your purchase! Payment ID: ${response.paymentId}",
        time: "Just now",
        icon: Icons.payment,
        color: Colors.green,
      )
    );
    
    // Clear the cart after checkout
    Provider.of<CartProvider>(context, listen: false).clearCart();
    
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Payment successful! Receipt sent to notifications."), 
      duration: Duration(seconds: 3)
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Error: ${response.message}");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Payment failed: ${response.message}"), 
      duration: const Duration(seconds: 3)
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet: ${response.walletName}");
  }

  void _openCheckout(double amount) {
    var options = {
      'key': 'rzp_test_Sa9ElNhdffU1Qq',
      'amount': (amount * 100).round(),
      'currency': 'INR', // Using INR allows test keys to succeed default sandbox checks
      'name': 'Demo App',
      'description': 'Test Payment',
      'prefill': {
        'contact': '9876543210',
        'email': 'test@example.com'
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: Colors.black.withValues(alpha: 0.3),
              )
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF162032),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset("assets/icons/receipt.svg"),
                    ),
                    const Spacer(),
                    const Text("Add voucher code", style: TextStyle(color: Colors.white54)),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kTextColor,
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Total:\n",
                          children: [
                            TextSpan(
                              text: "₹${cartProvider.totalAmount.toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 16, color: Color(0xFF00FFCC)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                      tooltip: "Discard Cart",
                      onPressed: cartProvider.items.isEmpty ? null : () {
                        cartProvider.clearCart();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Cart discarded."),
                          duration: Duration(seconds: 2),
                        ));
                      },
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: cartProvider.items.isEmpty ? null : () {
                          _openCheckout(cartProvider.totalAmount);
                        },
                        child: const Text("Check Out"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
