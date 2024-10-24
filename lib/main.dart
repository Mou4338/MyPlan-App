import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/welcomepage.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:flutter_application_1/theme/theme.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final savedTheme=await AdaptiveTheme.getThemeMode();
  runApp( MyApp(savedTheme: savedTheme,));
}

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode? savedTheme;
  const MyApp({super.key, this.savedTheme});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(initial:widget.savedTheme?? AdaptiveThemeMode.system,
    light: AppTheme.lightTheme,
    dark: AppTheme.darkTheme,
    builder: (light, dark) => 
     MaterialApp(
        theme: light,
        darkTheme: dark,
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash':(context)=>SplashScreen(),
          '/account':(context)=>Accountpage(),
          '/home': (context) => HomePage(),
     },
    ),
   );
  }
}