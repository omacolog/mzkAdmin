import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  List<bool> selected = [true,false,false,false,false,false];

  void select(int n) {
    for(int i=0;i<5;i++){
      if(i != n) {
        selected[i] = false;
      }else {
        selected[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NavBarItem(
            active: selected[0],
            icon: FontAwesomeIcons.home,
            touched: () {
              setState(() {
                select(0);
              });
            },
          ),
          NavBarItem(
            active: selected[1],
            icon: FontAwesomeIcons.youtube,
            touched: () {
              setState(() {
                select(1);
              });
            },
          ),
          NavBarItem(
            active: selected[2],
            icon: FontAwesomeIcons.newspaper,
            touched: () {
              setState(() {
                select(2);
              });
            },
          ),
          NavBarItem(
            active: selected[3],
            icon: FontAwesomeIcons.pollH,
            touched: () {
              setState(() {
                select(3);
              });
            },
          ),
          NavBarItem(
            active: selected[4],
            icon: FontAwesomeIcons.cogs,
            touched: () {
              setState(() {
                select(4);
              });
            },
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final IconData icon;
  final Function touched;
  final bool active;

  NavBarItem({
    this.active,
    this.touched,
    this.icon,
});




  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap:() {
          widget.touched();
        },
        splashColor: Colors.white,
        hoverColor: Colors.white12,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 80,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 475),
                      height: 35,
                      width: 5,
                      decoration: BoxDecoration(
                        color: widget.active ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Icon(
                        widget.icon,
                        color: widget.active ? Colors.white : Colors.white54,
                        size: 25,

                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

