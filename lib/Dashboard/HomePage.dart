import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dhttpd/dhttpd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzkadmin/Defaults/UsedColors.dart';
import 'package:http/http.dart' as http;
import 'package:mzkadmin/Json/Users.dart';
import 'ErrorPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  void initState() {

    super.initState();
  }

  void viewUser(User kullanici,int index){
    setState(() {
      kullaniciIsim = kullanici.name;
      kullaniciAdi  = kullanici.username;
      kullaniciEmail= kullanici.email;
      kullaniciId   = kullanici.userId;
    });
  }

  ///#region API'den kullanıcı listesi alınır.
  Future<List<User>> _fetchUsersList() async {
    final userListAPIUrl =
        "http://mzkappv1-env.eba-i5znycbm.eu-central-1.elasticbeanstalk.com/api/admin/op/users";
    final response =
    await http.get(userListAPIUrl, headers: <String, String>{});

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((users) => new User.fromJson(users)).toList();
    } else
      throw Exception('Failed to load jobs from API');
  }
  ///#endregion

  ///#region  Haberi Serverdan Kaldırma
  Future<bool> deleteUser(int Id) async {
    final String apiUrl = "http://mzkappv1-env.eba-i5znycbm.eu-central-1.elasticbeanstalk.com/api/admin/op/user/$Id";

    final response = await http.delete(apiUrl,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final String responseString = response.body;

      Fluttertoast.showToast(
          msg: "Kullanıcı başarıyla silindi.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);
      return true;
    }

    else
    {

      Fluttertoast.showToast(
          msg: "Kullanıcı silme başarısız oldu.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
  }
  ///#endregion

  ///region Değişkenler

  int userIndex=0,kullaniciId;

  String kullaniciIsim="",kullaniciAdi="",kullaniciEmail="",kullaniciUserId="";

  ///endregion


  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: _fetchUsersList(),
        builder: (context,snapshot){
    if (snapshot.hasData) {
      List<User> UserListesi = snapshot.data;
          return Scaffold(
            backgroundColor: Renk_EggYellow,
            body: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(children: [
                      Flexible(flex: 1,child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            padding: EdgeInsets.all(5),
                            scrollDirection: Axis.vertical,
                            itemCount: UserListesi.length,
                            itemBuilder: (context,int index){
                              return ListTile(
                                onTap: () => viewUser(UserListesi[index], index),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                title: Text(UserListesi[index].name,style: TextStyle(fontWeight: FontWeight.bold),),
                                subtitle: Text(UserListesi[index].username),
                                hoverColor: Colors.white30,
                              );
                            },
                          ),
                        ),
                      ),),
                      Container(width: 2,height:MediaQuery.of(context).size.height,color: Renk_Blackish,),
                      Flexible(flex: 4,child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Flexible(flex: 2,child: SingleChildScrollView(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.all(10),child: Card(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                                          color: Renk_Blackish,
                                          shadowColor: Colors.white,
                                          elevation: 8,
                                          child: Padding(padding: EdgeInsets.all(5),child: Text(
                                            "KULLANICIYA AİT BİLGİLER",
                                            style: TextStyle(color: Renk_EggYellow,fontSize: 30,fontWeight: FontWeight.bold),
                                          ),)
                                      )),//Container Başlığı
                                      Padding(padding: EdgeInsets.all(10), child: RichText(text:
                                      TextSpan(
                                          text: "Adı : ",
                                          style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: kullaniciIsim,
                                              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w200),
                                            )
                                          ]),
                                      ),),//Adı
                                      Padding(padding: EdgeInsets.all(10), child: RichText(text:
                                      TextSpan(
                                          text: "Kullanıcı Adı : ",
                                          style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: kullaniciAdi,
                                              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w200),
                                            )
                                          ]),
                                      ),),//Kullanıcı Adı
                                      Padding(padding: EdgeInsets.all(10), child: RichText(text:
                                      TextSpan(
                                          text: "E-Mail Adresi : ",
                                          style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: kullaniciEmail,
                                              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w200),
                                            )
                                          ]),
                                      ),),//E-Mail Adresi
                                      Padding(padding: EdgeInsets.all(10), child: FlatButton.icon(
                                        onPressed: () {
                                          return showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: Text("Silme Uyarısı"),
                                              content: Text("Yorum kalıcı olarak silinecek. Emin misin ?"),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Text("Vazgeç",style: TextStyle(color: Renk_EggYellow),),
                                                  color: Renk_Blackish,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                  hoverColor: Colors.white30,
                                                ),
                                                FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      deleteUser(kullaniciId);
                                                    });
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Text("Sil",style: TextStyle(color: Renk_EggYellow),),
                                                  color: Renk_Blackish,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                  hoverColor: Colors.white30,
                                                ),

                                              ],
                                            ),
                                          );
                                        },
                                        icon: FaIcon(FontAwesomeIcons.trashAlt,
                                          size: 20,
                                        ),
                                        label: Text(" Kullanıcıyı Sil "),
                                        color: Renk_Blackish,
                                        hoverColor: Colors.white12,
                                        textColor: Renk_EggYellow,
                                        padding: EdgeInsets.all(15),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
                                          side: BorderSide(color: Renk_Blackish),
                                        ),
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),),//Kullanıcı Bilgileri Görüntülernir
                            ],
                          ),
                        ),
                      ),),
                    ],
                    ),
                  ],
                ),
              ),
            ),
          );
    }else if (snapshot.hasError){
      return ErrorPage();
    }
    ///#region Veriler yüklenirken gösterilecek ekran
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: CircularProgressIndicator()),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              "Yükleniyor",
            ),
          ),
        )
      ],
    );

          ///#endregion
        }
    );
  }
}