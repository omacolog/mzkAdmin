import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState()=> _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    _CheckLogin().then(
        (status) {
          if (status) _GoBase();
        }
    );
  }

  Future<bool> _CheckLogin() async {
    await Future.delayed(Duration(milliseconds: 3500), () {} );
    return true;
  }

  void _GoBase(){
    Navigator.pushNamed(context, '/main/home');
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius:150,
              child: CircleAvatar(
                radius: 145,
                backgroundImage: AssetImage("images/logo.png"),
              ),
            ),
            Padding(padding: EdgeInsets.all(25)),
            Text(
              "MZK TV ADMİN PANELİNE HOŞ GELDİNİZ ",
              style: TextStyle(
                fontSize: 45,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }

}