import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';

Future<dynamic> showSuccesfulRegDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
            textAlign: TextAlign.center,
            'Registration Successful 🎉',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xff2260FF))),
        content: const Text(
            'Please check your email to activate your account before logging in.',
            style: TextStyle(color: Color(0xff000000), fontSize: 19)),
        actions: [
          TextButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xff2260FF))),
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kLogin);
            },
            child: const Text('OK',
                style: TextStyle(color: Colors.white, fontSize: 17)),
          ),
        ],
      ),
    );
  }
