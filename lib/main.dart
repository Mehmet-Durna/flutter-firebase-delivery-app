import 'package:delivery/auth/login_or_register.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    MultiProvider(
     providers: [
  // Theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),

  // restaurant provider
      ChangeNotifierProvider(create: (context) => Restaurant()),

],
child: const MyApp(),
),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}