import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/settings_provider.dart';
import 'privacy_policy_screen.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "/settings";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<SettingsProvider>(
          builder: (context, settings, child) => Text(settings.translate("settings")),
        ),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          return ListView(
            children: [
              _buildSectionHeader(settings.translate("appearance")),
              SwitchListTile(
                title: Text(settings.translate("dark_mode")),
                secondary: const Icon(Icons.brightness_4),
                value: settings.isDarkMode,
                onChanged: (value) {
                  settings.toggleDarkMode(value);
                },
              ),
              const Divider(),
              _buildSectionHeader(settings.translate("notifications")),
              SwitchListTile(
                title: const Text("Email Notifications"),
                secondary: const Icon(Icons.email),
                value: settings.emailNotifications,
                onChanged: (value) {
                  settings.toggleEmailNotifications(value);
                },
              ),
              SwitchListTile(
                title: const Text("Push Notifications"),
                secondary: const Icon(Icons.notifications_active),
                value: settings.pushNotifications,
                onChanged: (value) {
                  settings.togglePushNotifications(value);
                },
              ),
              const Divider(),
              _buildSectionHeader(settings.translate("my_account")),
              ListTile(
                title: Text(settings.translate("language")),
                subtitle: Text(settings.selectedLanguage),
                leading: const Icon(Icons.language),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  _showLanguageDialog(context, settings);
                },
              ),
              ListTile(
                title: Text(settings.translate("privacy_policy")),
                leading: const Icon(Icons.privacy_tip),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pushNamed(context, PrivacyPolicyScreen.routeName);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, SettingsProvider settings) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(settings.translate("language")),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: settings.languages.length,
            itemBuilder: (context, index) {
              final lang = settings.languages[index];
              return ListTile(
                title: Text(lang),
                trailing: settings.selectedLanguage == lang
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  settings.setLanguage(lang);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
