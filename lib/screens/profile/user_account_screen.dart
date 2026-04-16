import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/settings_provider.dart';
import '../../providers/user_provider.dart';

class UserAccountScreen extends StatelessWidget {
  static String routeName = "/user_account";

  const UserAccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(settings.translate("my_account")),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final user = userProvider.user;
          final picPath = user.profilePicPath;
          ImageProvider image;
          if (picPath != null) {
            if (kIsWeb) {
              image = NetworkImage(picPath);
            } else {
              image = FileImage(File(picPath));
            }
          } else {
            image = const AssetImage("assets/images/Profile Image.png");
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Hero(
                  tag: "profile_pic",
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: image,
                  ),
                ),
                const SizedBox(height: 30),
                _buildInfoRow(context, settings.translate("name"), user.name),
                _buildInfoRow(context, settings.translate("email"), user.email),
                _buildInfoRow(context, settings.translate("phone"), user.phoneNumber),
                _buildInfoRow(context, settings.translate("address"), user.address),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFF139A86),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    _showEditProfileModal(context, userProvider, settings);
                  },
                  child: const Text("Edit Profile"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isDark ? Colors.white70 : Colors.blueGrey),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : Colors.black87),
          ),
        ],
      ),
    );
  }

  void _showEditProfileModal(BuildContext context, UserProvider userProvider, SettingsProvider settings) {
    final nameController = TextEditingController(text: userProvider.user.name);
    final emailController = TextEditingController(text: userProvider.user.email);
    final phoneController = TextEditingController(text: userProvider.user.phoneNumber);
    final addressController = TextEditingController(text: userProvider.user.address);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Edit Profile Info",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildTextField(nameController, settings.translate("name"), Icons.person),
              _buildTextField(emailController, settings.translate("email"), Icons.email),
              _buildTextField(phoneController, settings.translate("phone"), Icons.phone),
              _buildTextField(addressController, settings.translate("address"), Icons.location_on),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF139A86),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  userProvider.updateUserInfo(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    address: addressController.text,
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Profile Updated Successfully")),
                  );
                },
                child: const Text("Save Changes"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
