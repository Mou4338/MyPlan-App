import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';

class Accountpage extends StatefulWidget {
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => HomePage(),},
          home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
          title: Center(child: Text('Account Page')),
          ),
          body: Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ElevatedButton(
          onPressed: () {
          Navigator.pushNamed(context, '/home');},
          child: Text('Sign up'),
            ),
            SizedBox(
              width: 40,
            ),
            ElevatedButton(
            onPressed: () {
            Navigator.pushNamed(context, '/home');},
            child: Text('Sign in'),
            ),
          ],
         ),
       ),
     ),
   );
  }
}