import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:mzkadmin/Defaults/SplashScreen.dart';
import 'package:mzkadmin/LandingPage.dart';

class Flurorouter{
  static final FluroRouter router = FluroRouter();

  static Handler _SplashHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,dynamic> params) => SplashScreen()
  );

  static Handler _MainHandler = Handler(
      handlerFunc: (BuildContext context,Map<String,dynamic> params) => LandingPage(page: params['name'][0],)
  );

  static void setupRouter(){
    router.define(
        '/',
        handler: _SplashHandler);
    router.define(
      '/main/:name',
      handler: _MainHandler,
      transitionType: TransitionType.fadeIn,);
  }


}