import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static String routeName = "/privacy_policy";

  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Privacy Policy",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSection(
              "1. Information Collection",
              "We collect information from you when you register on our site, place an order, or subscribe to our newsletter. This includes your name, email address, and payment information.",
            ),
            _buildSection(
              "2. Information Usage",
              "The information we collect from you may be used in one of the following ways:\n• To personalize your experience\n• To improve our website\n• To process transactions\n• To send periodic emails",
            ),
            _buildSection(
              "3. Information Security",
              "We implement a variety of security measures to maintain the safety of your personal information when you place an order or enter, submit, or access your personal information.",
            ),
            _buildSection(
              "4. Cookie Policy",
              "We use cookies to help us remember and process the items in your shopping cart and understand and save your preferences for future visits.",
            ),
            _buildSection(
              "5. Third Party Disclosure",
              "We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information.",
            ),
            const SizedBox(height: 20),
            const Text(
              "By using our site, you consent to our privacy policy.",
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
          ),
        ],
      ),
    );
  }
}
