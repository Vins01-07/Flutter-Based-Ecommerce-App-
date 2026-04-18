import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/settings_provider.dart';
import 'package:shop_app/screens/profile/help_center_screen.dart';
import 'package:shop_app/screens/profile/notifications_screen.dart';
import 'package:shop_app/screens/profile/settings_screen.dart';
import 'package:shop_app/screens/profile/user_account_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(settings.translate("profile")),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),

            _buildAnimatedMenu(
              context,
              index: 0,
              text: settings.translate("my_account"),
              icon: "assets/icons/User Icon.svg",
              press: () => Navigator.pushNamed(context, UserAccountScreen.routeName),
            ),
            _buildAnimatedMenu(
              context,
              index: 1,
              text: settings.translate("notifications"),
              icon: "assets/icons/Bell.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsScreen(),
                  ),
                );
              },
            ),
            _buildAnimatedMenu(
              context,
              index: 2,
              text: settings.translate("settings"),
              icon: "assets/icons/Settings.svg",
              press: () => Navigator.pushNamed(context, SettingsScreen.routeName),
            ),
            _buildAnimatedMenu(
              context,
              index: 3,
              text: settings.translate("help_center"),
              icon: "assets/icons/Question mark.svg",
              press: () => Navigator.pushNamed(context, HelpCenterScreen.routeName),
            ),
            _buildAnimatedMenu(
              context,
              index: 4,
              text: settings.translate("log_out"),
              icon: "assets/icons/Log out.svg",
              press: () => _showLogoutDialog(context, settings),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedMenu(BuildContext context,
      {required int index,
      required String text,
      required String icon,
      required VoidCallback press}) {
    return ProfileMenu(
      text: text,
      icon: icon,
      press: press,
    );
  }

  void _showLogoutDialog(BuildContext context, SettingsProvider settings) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(settings.translate("log_out")),
        content: Text(settings.translate("logout_confirm")),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(settings.translate("cancel")),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                SignInScreen.routeName,
                (route) => false,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(settings.translate("log_out") + "...")),
              );
            },
            child: Text(settings.translate("yes")),
          ),
        ],
      ),
    );
  }
}