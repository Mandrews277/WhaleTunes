import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:WhaleTunes/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            'Error Occured',
            textDirection: TextDirection.ltr,
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            theme: ThemeData(
              visualDensity: VisualDensity.standard,
            ),
            title: 'WhaleTunes',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.defaultScreen,
            routes: AppRoutes.routes,
          );
        }

        return Text(
          'Loading',
          textDirection: TextDirection.ltr,
        );
      },
    );
  }
}
