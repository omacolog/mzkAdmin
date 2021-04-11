import 'package:flutter/material.dart';
import 'package:mzkadmin/Routes.dart';


void main() {
  runApp(MzkAdmin());
}

class MzkAdmin extends StatefulWidget {
  @override
  _MzkAdminState createState() => _MzkAdminState();
}

class _MzkAdminState extends State<MzkAdmin> {
  @override

  void initState(){

    super.initState();
    Flurorouter.setupRouter();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,

    );
  }
}

/*class MzkAdmin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: '/',
    );
  }
}*/
