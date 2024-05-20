import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/coming_soon.dart';
import 'package:sign_lang_flut/pages/navbar/camera.dart';
import 'package:sign_lang_flut/pages/navbar/contact_us.dart';
import 'package:sign_lang_flut/pages/navbar/drawer.dart';

import 'package:sign_lang_flut/pages/navbar/gallery.dart';
import 'package:sign_lang_flut/pages/navbar/home_page.dart';
import 'package:sign_lang_flut/pages/navbar/search.dart';

class NavBar extends StatefulWidget {
  final int initialPageIndex;

  const NavBar({super.key, this.initialPageIndex = 2});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 2;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialPageIndex;
  }

  final List<Widget> _pages = [
    const CameraApp(),
    const Search_Page(),
    const HomePage(),
    const Gallery(),
    const ContactUs(),
  ];

  final List<String> _pageTitles = [
    'Camera',
    'Search',
    'Home',
    'Gallery',
    'Contact Us',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              style: ButtonStyle(
                iconSize: MaterialStateProperty.all(30),
                iconColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          _pageTitles[_selectedIndex],
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_rounded,
            ),
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all(30),
              iconColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => UnderConstructionPage()),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.contact_phone),
            label: 'Contact Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context)
            .colorScheme
            .tertiary, // Set the selected item color to black
        unselectedItemColor: Theme.of(context)
            .colorScheme
            .secondary, // Set the unselected item color to grey
        onTap: _onItemTapped,
      ),
      drawer: const MainDrawer(),
    );
  }
}
