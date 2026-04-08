import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/settings_provider.dart';

class HelpCenterScreen extends StatelessWidget {
  static String routeName = "/help_center";

  const HelpCenterScreen({super.key});

  Future<void> _launchURL(BuildContext context, String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: Could not open link.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(settings.translate("help_center")),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              settings.translate("how_can_we_help"),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: settings.translate("search_help"),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              settings.translate("faqs"),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildFAQTile(
              "How to track my order?",
              "You can track your order by going to 'My Orders' section in the Profile tab and clicking on the specific order to see its status.",
            ),
            _buildFAQTile(
              "What is the return policy?",
              "We offer a 30-day return policy for most items. Items must be in their original condition and packaging.",
            ),
            _buildFAQTile(
              "How to change my password?",
              "Go to Settings > Account > Change Password to update your security credentials.",
            ),
            const SizedBox(height: 24),
            Text(
              settings.translate("contact_us"),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildContactMethod(
              context,
              Icons.email,
              settings.translate("email_support"),
              "support@shopvibe.com",
              "mailto:support@shopvibe.com",
            ),
            _buildContactMethod(
              context,
              Icons.phone,
              settings.translate("phone_support"),
              "+1 234 567 890",
              "tel:+1234567890",
            ),
            _buildContactMethod(
              context,
              Icons.code,
              settings.translate("github"),
              "github.com/shopvibe-app",
              "https://github.com",
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQTile(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            answer,
            style: const TextStyle(color: Colors.black54),
          ),
        ),
      ],
    );
  }

  Widget _buildContactMethod(BuildContext context, IconData icon, String title,
      String subtitle, String url) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.withOpacity(0.1),
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () => _launchURL(context, url),
    );
  }
}
