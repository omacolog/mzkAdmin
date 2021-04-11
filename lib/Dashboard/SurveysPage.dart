import 'package:flutter/material.dart';

class SurveysPage extends StatefulWidget {
  @override
  _SurveysPageState createState() => _SurveysPageState();
}

class _SurveysPageState extends State<SurveysPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Text(
          "Anketler Bölümü Yapım Aşamasında",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
        ),
      ),
    );
  }
}
