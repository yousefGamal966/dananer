import 'package:dnaner/utils/models/images.dart';
import 'package:dnaner/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Routes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.splashBackground),fit: BoxFit.cover),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Image.asset(
                fit: BoxFit.cover,
                AppImages.splashLogo,
                width: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.asset(
                AppImages.splashBranding,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
