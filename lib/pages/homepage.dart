import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sidebar/sidebar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: Sidebar(),
          appBar: AppBar(
              title: const Text('TO-DO-LIST'), backgroundColor: Colors.blue),
              floatingActionButton: FloatingActionButton(
              onPressed: () {setState(() {
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                    ? AdaptiveTheme.of(context).setLight()
                    : AdaptiveTheme.of(context).setDark();
              });
            },
            tooltip: 'Change Theme',
            child: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
            ? Icon(Icons.light_mode): Icon(Icons.dark_mode),),
          body: Center(
          child: Text('Home Page',style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}