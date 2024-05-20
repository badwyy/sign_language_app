import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/about_us.dart';
import 'package:sign_lang_flut/pages/coming_soon.dart';
import 'package:sign_lang_flut/pages/navbar/nav_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 125, 196),
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const NavBar(initialPageIndex: 2)),
            );
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Change User Name'),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => UnderConstructionPage()),
              );
              // Navigate to change user name page
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Change Language'),
            leading: const Icon(Icons.language),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => UnderConstructionPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Notifications'),
            leading: const Icon(Icons.notifications),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => UnderConstructionPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Privacy'),
            leading: const Icon(Icons.privacy_tip),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => UnderConstructionPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Appearance'),
            leading: const Icon(Icons.color_lens),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => UnderConstructionPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('About'),
            leading: const Icon(Icons.info),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
