import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_messaging/custom_firebase_messaging.dart';

import 'pages/home_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CustomFirebaseMessaging().inicialize();

  await CustomFirebaseMessaging().getTokenFirebase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomePage(),
        '/virtual': (_) => Scaffold(
              appBar: AppBar(),
              body: const SizedBox.expand(
                child: Center(
                  child: Text('Virtual Page'),
                ),
              ),
            ),
      },
    );
  }
}
