import 'package:MyPlan/pages/homepage.dart';
import 'package:flutter/material.dart';
class PasswordChangedSuccessfully extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: passwordChangedSuccessfully(),
    );
  }
}
class passwordChangedSuccessfully extends StatefulWidget {
  @override
  _passwordChangedSuccessfullyState createState() => _passwordChangedSuccessfullyState();
}

class _passwordChangedSuccessfullyState extends State<passwordChangedSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/password_screen/Untitled design (4).png")
              )
            ),
          ),
          Text("Successful!", style: TextStyle(
            fontSize: 35
          ),),
          Text("You have successfully changed our password. Please use your new password to login!", style: TextStyle(
            fontSize: 16,
          ),textAlign: TextAlign.center,),
          SizedBox(height: 70,),
          Center(
            child: InkWell(
              onTap: openHomePage,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: Colors.blue[800],
                ),
                child: Text("Continue", style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void openHomePage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
}