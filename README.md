# ShopVibe 🛍️📱 (formerly Tokoto)

Welcome to **ShopVibe**! This Flutter E-Commerce App project has been completely modernized and rebranded from its original Tokoto template. It features a sleek Teal/Indigo UI redesign and is fully upgraded to compile on modern Flutter 3.41+ toolchains.

## ✨ What's New?

- **Rebranded to ShopVibe:** Completely replaced the legacy orange Tokoto theme with a premium Teal & Indigo gradient design.
- **Modernized Android Build:** Migrated from legacy imperative Gradle scripts to the modern, declarative `plugins {}` block. It now safely compiles using Kotlin 2.1.0 and AGP 8.7.0.
- **Integrated Testing:** Added automated widget testing that validates the Splash screen, Brand texts, and App Launch flow.

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
