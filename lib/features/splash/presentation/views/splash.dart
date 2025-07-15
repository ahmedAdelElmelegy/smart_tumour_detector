import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          GoRouter.of(context).pushReplacement(AppRoutes.kLogin);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fill,
        ),
      )),
    );
  }
}
