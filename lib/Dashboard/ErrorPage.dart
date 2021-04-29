import 'package:flutter/material.dart';

import 'HomePage.dart';


class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                "Hay aksi...Görünüşe göre ters giden bir şeyler oldu.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Material(

                child: MaterialButton(
                  onPressed: () =>   Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                          (Route<dynamic> route) => false),
                  color: Colors.blue[200],
                  minWidth: 100,
                  child: Text(
                    "Tamam",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
