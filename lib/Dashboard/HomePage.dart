import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mzkadmin/Defaults/UsedColors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Renk_EggYellow,
      child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15),
              child:Text("Anasayfa Yapım Aşamasında", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
            Padding(padding: EdgeInsets.all(15),
              child: Text("Bu Sayfada Yapılacak İşlemler",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),),


          ],
        )
      ),
    );
  }
}
