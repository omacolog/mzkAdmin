import 'package:flutter/material.dart';
import 'package:mzkadmin/NavigationBar/NavigatorBar.dart';

class BasePage extends StatefulWidget{
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Row(
              children: [
                NavigationBar(),
              ],
            ),
            //NavigationBar(),
          ],
        ),
      ),
    );
  }

}
