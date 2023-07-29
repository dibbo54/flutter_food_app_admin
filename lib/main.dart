import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app_admin/screens/home_screen.dart';

import 'authentication/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAL5t_IhSisGVI4eG-kRg3wPAvC5V-SG6g',
        appId: '1:758683111450:web:37e21ac7878e0629fe81a3',
        messagingSenderId: '758683111450',
        projectId: 'flutter-food-app-71f5d',
        authDomain: 'flutter-food-app-71f5d.firebaseapp.com',
        databaseURL: 'https://flutter-food-app-71f5d-default-rtdb.asia-southeast1.firebasedatabase.app',
        storageBucket: 'flutter-food-app-71f5d.appspot.com',
        measurementId: 'G-HRJ0TT7CE5',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  //requestPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Web Portal',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginScreen()
          : const HomeScreen(),
    );
  }
}