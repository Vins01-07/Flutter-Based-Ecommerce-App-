# ShopVibe 🛍️📱

Welcome to **ShopVibe**! ShopVibe is a premium, full-featured E-Commerce application built with Flutter. It features a modern Teal and Indigo visual identity, designed to provide a seamless shopping experience with high-performance animations and a robust feature set.

## ✨ Key Features

- **Premium Design System:** Built from the ground up with a custom Teal & Indigo gradient theme, ensuring a modern and professional aesthetic.
- **State-of-the-Art Architecture:** Utilizes modular screens and efficient state management for a production-grade experience.
- **Modern Build System:** Fully compatible with Flutter 3.41+ and Android's latest declarative build systems (Gradle 8.7, Kotlin 2.1.0).
- **Comprehensive Testing:** Includes automated widget tests for core screens and navigation flows to ensure stability.

## 🚀 How to Run the Project

You do **not** need Android Studio to run this app if you just want to test it locally on the web.

### Option 1: Run on Web Browser (No Android SDK required)

If you just want to view the UI and test the functionality, run it via the pre-installed Microsoft Edge or Chrome engines:

```bash
flutter run -d edge
# or
flutter run -d chrome
```

### Option 2: Run on Android (Requires Android SDK)

To build an APK or run on a physical Android device/emulator:

1. Ensure the **Android SDK** and **Android SDK Command-line Tools** are installed (usually via Android Studio).
2. Accept the licenses: `flutter doctor --android-licenses`
3. Connect your device (or start an emulator) and run:

```bash
flutter run
```

### Option 3: Run Widget Tests

To verify everything is working under the hood without launching a device:

```bash
flutter test
```

## 📱 Screens Included:

- Splash / Onboarding
- Login & Sign Up
- Forgot Password
- Complete Profile & OTP Verification
- Home Page (with interactive category carousels & banners)
- Product Details
- Cart & Checkout
- Profile
- Bottom Navigation Bar

---

_Powered by Flutter._
