import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_lang_flut/pages/darkmode/theme_provider.dart';
import 'package:sign_lang_flut/pages/settings.dart';
import 'package:sign_lang_flut/pages/start/login_page.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    super.key,
    // required this.onSelectScreen,
  });

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool _isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  // final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  // Theme.of(context).colorScheme.primaryContainer,
                  // Theme.of(context)
                  //     .colorScheme
                  //     .primaryContainer
                  //     .withOpacity(0.8),
                  Color.fromARGB(255, 3, 24, 56),
                ],
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.sign_language,
                  size: 48,
                  // color: Theme.of(context).colorScheme.primary,
                  color: Color.fromARGB(255, 3, 24, 56),
                ),
                const SizedBox(width: 18),
                Text(
                  'sign language ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        // color: Theme.of(context).colorScheme.primary,
                        // color:Colors.blue,
                        color: const Color.fromARGB(255, 3, 24, 56),
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Provider.of<Theme_provider>(context, listen: false).toggleTheme();
            },
            leading: Icon(
              Icons.dark_mode,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Darkmode',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'settings',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'logged out',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              );
            },
            leading: Icon(
              Icons.logout_rounded,
              color: Theme.of(context).colorScheme.onBackground,
              // color:Colors.blue,
            ),
            title: Text(
              'logout',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
