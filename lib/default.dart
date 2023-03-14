import 'package:WhaleTunes/presentation/home_screen/home_screen.dart';
import 'package:WhaleTunes/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:WhaleTunes/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:WhaleTunes/services/auth.dart';

class DefaultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('error'),
          );
        } else if (snapshot.hasData) {
          return SignUpScreen();
        } else {
          return HomeScreen();
        }
      },
    );
  }
}
