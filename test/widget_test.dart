import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

void main() {
  testWidgets('App Launch and Splash Screen Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app launches and shows the splash screen.
    expect(find.byType(SplashScreen), findsOneWidget);

    // Verify ShopVibe branding text exists.
    expect(find.text('SHOPVIBE'), findsOneWidget);
    expect(find.text('Welcome to ShopVibe, Let’s shop!'), findsOneWidget);

    // Verify Continue button exists
    expect(find.text('Continue'), findsOneWidget);

    // Tap 'Continue' and trigger navigation
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Verify we navigated to SignInScreen
    expect(find.text('Sign In'), findsWidgets);
    expect(find.text('Welcome Back'), findsOneWidget);
  });
}
