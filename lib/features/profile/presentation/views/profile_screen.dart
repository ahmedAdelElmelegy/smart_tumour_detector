import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_tumour_detector/core/services/payment_manager.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/features/profile/presentation/widgets/profile_item_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(color: Colors.blue)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
              const Center(
                child: Text(
                  "Mahmoud",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              ProfileItem(
                  icon: Icons.person,
                  title: 'Profile',
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.kEditProfile);
                  }),
              ProfileItem(
                icon: Icons.wallet_outlined,
                title: 'Payment Method',
                onTap: () {
                  PaymentManager.makePayment(100, "USD");
                },
              ),
              ProfileItem(
                icon: Icons.favorite,
                title: 'Favorit',
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kFavorite);
                },
              ),
              ProfileItem(
                  icon: Icons.settings,
                  title: 'Settings',
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.kSettings);
                  }),
              ProfileItem(
                  icon: Icons.help,
                  title: 'Help',
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.kHelp);
                  }),
              ProfileItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () async {
                    // 1. حذف التوكن المخزن
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('token');

                    if (context.mounted) {
                      GoRouter.of(context).go(AppRoutes.kLogin);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
