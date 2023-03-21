import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tnt/pages/homepage.dart';
import 'package:tnt/admin/admin_home.dart';
import 'package:tnt/auth/authentication.dart';
import 'package:tnt/pages/home.dart';
import 'package:tnt/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDSJff4Qs6bhtYSgtyHbYptkUjHtwPokgY",
        authDomain: "tnt-firebase-1738.firebaseapp.com",
        projectId: "tnt-firebase-1738",
        storageBucket: "tnt-firebase-1738.appspot.com",
        messagingSenderId: "694654234773",
        appId: "1:694654234773:web:6db04921f9d133a3d66b9c",
        measurementId: "G-2CR1EVSG8E"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel and Tour',
      theme: lightThemeData,
      darkTheme: darkThemeData,

      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
              final User? user = FirebaseAuth.instance.currentUser;
              final email = user!.email;

              if(email == "fio@tnt.com"){
                return AdminHomePage();
              }else{
                return const HomePage();
              }
          } else {
            return const Authentication();
          }
          // if (snapshot.hasData) {
          //   return const HomePage();
          // } else {
          //   return const Authentication();
          // }
        },
      ),
    );
  }
}
