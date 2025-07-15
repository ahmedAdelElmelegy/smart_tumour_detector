import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/core/utils/app_routes.dart';
import 'package:smart_tumour_detector/features/profile/presentation/widgets/profile_item_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () =>  GoRouter.of(context).pop(),
        ),
        title: const Text("Settings", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ProfileItem(
            icon: Icons.notifications,
            title: 'Notification Settings',
            onTap: () {GoRouter.of(context).push(AppRoutes.kNotificationSettings);},
          ),
          ProfileItem(icon: Icons.key, title: 'Password Manager', onTap: () {}),
          ProfileItem(
            icon: Icons.person_4,
            title: 'Delete Account',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
