import 'package:flutter/material.dart';
import 'package:sign_lang_flut/pages/navbar/nav_bar.dart';
import 'package:sign_lang_flut/pages/settings.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 125, 196),
        title: const Text('About Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader('Our Mission'),
            const SizedBox(height: 10),
            _buildMissionText(),
            const SizedBox(height: 20),
            _buildHeader('How We Help'),
            const SizedBox(height: 10),
            _buildHelpText(),
            const SizedBox(height: 20),
            _buildHeader('Contact Us'),
            const SizedBox(height: 10),
            _buildContactButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMissionText() {
    return const Text(
      'Our mission is to empower individuals who are deaf or hard of hearing by providing them with innovative technology solutions that facilitate communication through sign language. We strive to create an inclusive environment where everyone can express themselves freely and access essential services without barriers.',
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildHelpText() {
    return const Text(
      'Our application utilizes advanced sign language recognition technology to interpret sign language gestures and translate them into text or spoken language. By leveraging this technology, we aim to bridge the communication gap between individuals who use sign language and those who do not, enabling seamless interaction in various settings such as education, healthcare, and everyday communication.',
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildContactButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const NavBar(initialPageIndex: 4)),
          );
        },
        child: const Text('Contact Us',
            style: TextStyle(color: Color.fromARGB(255, 39, 125, 196))),
      ),
    );
  }
}
