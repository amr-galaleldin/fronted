import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

import 'app/auth/signup.dart';
import 'app/auth/login.dart';
import 'app/auth/success.dart';
import 'app/home.dart';
import 'app/notes/add.dart';
import 'app/notes/edit.dart';


late SharedPreferences sharedPref ; 
void main() async {  
  WidgetsFlutterBinding.ensureInitialized() ; 
  sharedPref = await SharedPreferences.getInstance() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course PHP Rest API',
      initialRoute:sharedPref.getString("id") == null ? "login" : "home",
      routes: {
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "home": (context) => Home(),
        "success": (context) => Success()   , 
        "addnotes": (context) => AddNotes()   , 
        "editnotes": (context) => EditNotes()   , 
      },
    );
  }
}
