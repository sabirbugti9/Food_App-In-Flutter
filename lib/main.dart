import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myfood_app/screens/detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        snackBarTheme: SnackBarThemeData(
          actionTextColor: Colors.white,
          backgroundColor: Colors.pinkAccent,
        ),
        primaryColor: Colors.pinkAccent,
        accentColor: Color(0xff04d4ee),
      ),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return HomePage();
      //     } else {
      //       return Login();
      //     }
      //   },
      // ),
      home: DetailScreen(),
    );
  }
}
