import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  static String routeName = "/notifications";

  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          _buildNotificationItem(
            context: context,
            title: "Flash Sale Alert! ⚡",
            description: "Get up to 70% off on all electronic items for the next 2 hours only!",
            time: "2 mins ago",
            icon: Icons.flash_on,
            color: Colors.orange,
          ),
          _buildNotificationItem(
            context: context,
            title: "Order Shipped 📦",
            description: "Your order #7890 has been shipped and is on its way to you.",
            time: "1 hour ago",
            icon: Icons.local_shipping,
            color: Colors.blue,
          ),
          _buildNotificationItem(
            context: context,
            title: "New Collection Arrived ✨",
            description: "Check out the new summer collection specially curated for you.",
            time: "5 hours ago",
            icon: Icons.new_releases,
            color: Colors.purple,
          ),
          _buildNotificationItem(
            context: context,
            title: "Payment Successful ✅",
            description: "Thank you for your purchase! Your payment of \$120.50 was successful.",
            time: "Yesterday",
            icon: Icons.payment,
            color: Colors.green,
          ),
          _buildNotificationItem(
            context: context,
            title: "Special Voucher for You 🎁",
            description: "Use code SHOPVIBE20 to get extra 20% discount on your next order.",
            time: "2 days ago",
            icon: Icons.card_giftcard,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required BuildContext context,
    required String title,
    required String description,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isDark ? Colors.white : Colors.black87),
                    ),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black54,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
