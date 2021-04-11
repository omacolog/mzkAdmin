import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzkadmin/Dashboard/HomePage.dart';
import 'package:mzkadmin/Dashboard/NewsPage.dart';
import 'package:mzkadmin/Dashboard/SettingsPage.dart';
import 'package:mzkadmin/Dashboard/SurveysPage.dart';
import 'package:mzkadmin/Dashboard/YoutubePage.dart';

class LandingPage extends StatefulWidget {
  final String page;

  const LandingPage({Key key, this.page}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

List<String>pages = ['home', 'youtube', 'news', 'surveys', 'settings',];

List<IconData> icons = [FontAwesomeIcons.home, FontAwesomeIcons.youtube, FontAwesomeIcons.newspaper, FontAwesomeIcons.pollH, FontAwesomeIcons.cogs,];

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Container(
              width: 100,
              color: Color(0xff333951),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: icons.map((e) {
                  return NavItem(
                    selected: icons.indexOf(e) == pages.indexOf(widget.page),
                    icon: e,
                    onTap: () {
                      Navigator.pushNamed(context, '/main/${pages[icons.indexOf(e)]}');
                    },
                  );
                }).toList(),

              ),
            ), //SideBar
            Container(
              width: MediaQuery.of(context).size.width-100,
              child: IndexedStack(
                index: pages.indexOf(widget.page),
                children: [
                  HomePage(),
                  YoutubePage(),
                  NewsPage(),
                  SurveysPage(),
                  SettingsPage(),
                ],
              ),
            ),//Dashboard
          ],
        ),
      ),
    );
  }
}


class NavItem extends StatefulWidget {

  final IconData icon;
  final bool selected;
  final Function onTap;

  const NavItem({Key key, this.icon, this.selected, this.onTap}) : super(key: key);

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          widget.onTap();
        },
        child: AnimatedContainer(
                  duration: Duration(milliseconds: 475),
                  width: double.infinity,
                  height: 60,
                  color: widget.selected ? Colors.black87 : Color(0xff333951),
                  child: Icon(
                      widget.icon,
                      color: widget.selected ? Colors.white : Colors.amber,
                      size: 25,
                    ),
                  ),
              ),
        );
  }
}
