import 'package:fe_bookly/pages/masuk.dart';
import 'package:fe_bookly/services/user_services.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Logout
      body: Center(
        child: GestureDetector(
          onTap: () {
            logout().then((value) => {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const Masuk(),
                      ),
                      (route) => false)
                });
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
