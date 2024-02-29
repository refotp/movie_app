import 'package:aldmictest/services/authenticationservice.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 24, 35, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 46, 84),
        title: const Text(
          'Tentang kami',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AuthenticationService.instance.logout();
            },
            icon: const Icon(
              Ionicons.log_out,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Kami adalah sebuah perusahaan yang menyediakan layanan di bidang, penyediaan informasi film terkini',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
