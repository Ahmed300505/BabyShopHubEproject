import 'package:babyhubproject/CartWork.dart';
import 'package:babyhubproject/RegisterScreen.dart';
import 'package:babyhubproject/SliderScreen.dart';
import 'package:babyhubproject/SuggestedAddWork.dart';
import 'package:babyhubproject/UserProfile.dart';
import 'package:babyhubproject/firebase_options.dart';
import 'package:babyhubproject/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:babyhubproject/abc.dart';
import 'AddProduct.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userEmail = prefs.getString('userEmail');

  runApp(MyApplication(startScreen: userEmail == null ? LoginScreen() : ProfileScreen(userId: userEmail)));
}

class MyApplication extends StatelessWidget {
  final Widget startScreen;

  MyApplication({required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Add_Sujjestion_Data(),
      debugShowCheckedModeBanner: false,
    );
  }
}