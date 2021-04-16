import "package:flutter/material.dart";
import 'package:mzkadmin/Defaults/UsedColors.dart';
import 'package:mzkadmin/NavigationBar/src/MzkName.dart';
import 'package:mzkadmin/NavigationBar/src/NavBar.dart';


class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 100,
      color: Renk_DarkGrey,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: NavBar(),
          ),
        ],
      ),
    );
  }
}
    