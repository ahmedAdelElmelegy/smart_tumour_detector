import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  _NotificationSettingsScreenState createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  Map<String, bool> settings = {
    "General Notification": true,
    "Sound": true,
    "Sound Call": true,
    "Vibrate": false,
    "Special Offers": false,
    "Payments": true,
    "Promo And Discount": false,
    "Cashback": true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification Setting',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: settings.keys.map((key) {
            return SwitchListTile(
              title: Text(
                key,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              value: settings[key]!,
              activeColor: Colors.blue,
              onChanged: (bool value) {
                setState(() {
                  settings[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}