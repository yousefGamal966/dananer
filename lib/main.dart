import 'package:dnaner/utils/routes/routes.dart';
import 'package:dnaner/view/home_screen/home_screen.dart';
import 'package:dnaner/view/onboarding/onboarding.dart';
import 'package:dnaner/view/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: const Locale('ar'), // ← هنا اللغة العربية
      supportedLocales: const [
        Locale('ar'), // أضف أي لغات أخرى تدعمها
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => const SplashScreen(),
        Routes.home : (context) => const HomeScreen(),
        Routes.onboarding : (context) =>  Onboarding(),

      },
    );
  }
}

