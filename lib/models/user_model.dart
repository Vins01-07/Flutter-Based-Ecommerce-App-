class UserModel {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String? profilePicPath;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    this.profilePicPath,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? address,
    String? profilePicPath,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      profilePicPath: profilePicPath ?? this.profilePicPath,
    );
  }
}
