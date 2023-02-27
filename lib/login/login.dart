import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whaletunes/services/auth.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            Flexible(
              child: LoginButton(
                text: 'Continue as Guest',
                icon: FontAwesomeIcons.userNinja,
                color: Colors.deepPurple,
                loginMethod: AuthService().anonLogin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {required this.text,
      required this.icon,
      required this.color,
      required this.loginMethod,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        label: Text(text),
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
      ),
    );
  }
}
