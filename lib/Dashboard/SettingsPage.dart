import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Text(
          "Ayarlar Bölümü Yapım Aşamasında",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
        ),
      ),
    );
  }
}
