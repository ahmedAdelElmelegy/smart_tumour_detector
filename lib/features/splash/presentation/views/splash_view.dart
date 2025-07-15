import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showSmart = false;
  bool _showTumour = false;
  bool _showLogo = false;
  @override
  void initState() {
    super.initState();

    _startAnimation();
    // عرض smart بعد 300ms
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _showSmart = true);
    });

    // عرض TUMOUR بعد 1100ms (فرق واضح عن smart)
    Future.delayed(const Duration(milliseconds: 1100), () {
      setState(() => _showTumour = true);
    });

    // عرض اللوجو بعد 2100ms (فرق واضح عن TUMOUR)
    Future.delayed(const Duration(milliseconds: 2100), () {
      setState(() => _showLogo = true);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkTokenAndNavigate();
    });
  }

  void _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  Future<void> _checkTokenAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    await Future.delayed(const Duration(seconds: 2)); // عشان نشوف الانيميشن

    if (!mounted) return;

    if (token != null && token.isNotEmpty && !JwtDecoder.isExpired(token)) {
      GoRouter.of(context).go(AppRoutes.kNavbar);
    } else {
      await prefs.remove('token');
      GoRouter.of(context).go(AppRoutes.kLogin);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f67b5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _showLogo ? 1 : 0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              child: SizedBox(
                  height: 140,
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 500.h,
                    width: 400.w,
                  )),
            ),
            AnimatedOpacity(
              opacity: _showSmart ? 1 : 0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              child: Image.asset(
                'assets/images/smart.jpg',
                height: 40.h,
                width: 200.w,
              ),
            ),
            AnimatedOpacity(
              opacity: _showTumour ? 1 : 0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              child: Image.asset(
                'assets/images/tumour.jpg',
                height: 70.h,
                width: 200.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}