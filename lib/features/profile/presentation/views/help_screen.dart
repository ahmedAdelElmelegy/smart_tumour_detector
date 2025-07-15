import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_tumour_detector/features/profile/presentation/widgets/profile_item_view.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void showLinkDialog(BuildContext context, String title, String link) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: InkWell(
            child: Text(
              link,
              style: const TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ),
            onTap: () {
              Navigator.pop(context); // لإغلاق الديالوج أولًا
              _openLink(link);
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text(
          "Help Center",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 32,
            width: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.blue),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Center(
                child: Text(
                  'Contact us',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          ProfileItem(
              icon: Icons.headphones,
              title: 'Customer Service',
              onTap: () {
                showLinkDialog(
                    context, "Customer Services", "https://flutter.dev/");
              }),
          ProfileItem(
              icon: Icons.web_stories,
              title: 'Website',
              onTap: () {
                showLinkDialog(
                    context, "Website", "https://flutter.dev/");
              }),
          ProfileItem(
              icon: Icons.phone,
              title: 'Whats UP',
              onTap: () {
                showLinkDialog(
                    context, "Whats UP", "https://wa.me/201090523346");
              }),
          ProfileItem(
              icon: Icons.facebook,
              title: 'Facebook',
              onTap: () {
                showLinkDialog(
                    context, "Facebook", "https://www.facebook.com/share/16uV1DEKg6/");
              }),
          ProfileItem(
              icon: Icons.camera,
              title: 'Instegram',
              onTap: () {
                showLinkDialog(
                    context, "Instegram", "https://flutter.dev/");
              }),
        ],
      ),
    );
  }
}
