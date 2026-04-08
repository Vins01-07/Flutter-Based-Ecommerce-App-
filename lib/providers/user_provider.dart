import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
    name: "Guest User",
    email: "guest@example.com",
    phoneNumber: "+91 0000000000",
    address: "Not Provided",
  );

  UserModel get user => _user;

  void login(String email) {
    // Mock login that updates the email and name
    _user = _user.copyWith(
      email: email,
      name: email.split('@')[0], // Use part of email as name for mock
    );
    notifyListeners();
  }

  void updateUserInfo({String? name, String? email, String? phone, String? address}) {
    _user = _user.copyWith(
      name: name,
      email: email,
      phoneNumber: phone,
      address: address,
    );
    notifyListeners();
  }

  void updateProfilePic(String path) {
    _user = _user.copyWith(profilePicPath: path);
    notifyListeners();
  }

  void logout() {
    _user = UserModel(
      name: "Guest User",
      email: "guest@example.com",
      phoneNumber: "+91 0000000000",
      address: "Not Provided",
    );
    notifyListeners();
  }
}
