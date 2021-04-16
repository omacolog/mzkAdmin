import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzkadmin/Defaults/UsedColors.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override

  static TextEditingController _haberIdController = TextEditingController();
  static TextEditingController _haberBasligiController = TextEditingController();
  static TextEditingController _haberIcerigiController = TextEditingController();
  static TextEditingController _haberImageLinkController = TextEditingController();

  static TextEditingController _haberIdControllerEdit = TextEditingController();
  static TextEditingController _haberBasligiControllerEdit = TextEditingController();
  static TextEditingController _haberIcerigiControllerEdit = TextEditingController();
  static TextEditingController _haberImageLinkControllerEdit = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renk_EggYellow,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(flex:2,child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.vertical,
                        itemCount: 25,
                        itemBuilder: (context,int i){
                          return ListTile(
                            onTap: (){},
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            title: Text("$i. Youtube Gönderisi Başlığı ",style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(" İçerik Açıklaması "),
                            trailing: IconButton(
                              icon: FaIcon(FontAwesomeIcons.edit),
                              iconSize: 20,
                              color: Renk_Blackish,
                              hoverColor: Colors.white54,
                              onPressed: (){},
                            ),
                            hoverColor: Colors.white30,
                            //trailing: FaIcon(FontAwesomeIcons.edit,size: 20,color: ),
                          );
                        },
                      ),
                    ),
                  ),),// Haber Gönderileri Listesi
                  Container(width: 5,height: MediaQuery.of(context).size.height,color: Renk_Blackish,),
                  Flexible(flex: 4, child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Flexible(flex: 1,child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    child: Text(
                                      "Haber Görüntüleme",
                                      style: TextStyle(color: Renk_Blackish,fontSize: 30,fontWeight: FontWeight.bold),
                                    ),
                                    padding: EdgeInsets.all(10),
                                  ),//
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Haber Başlığı",
                                      style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                                    ),
                                  ),//Haber Başlığı
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      height: 200,
                                      child: Image(
                                        image: AssetImage("images/logo.png",),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Haber içeriği",
                                      style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                    ),
                                  ),//
                                ],
                              ),
                            ),
                          )),//Haberi Görüntüleme
                          Container(height: 5,width: MediaQuery.of(context).size.width,color: Renk_Blackish,),
                          Flexible(flex: 1,child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    child: Text(
                                      "Habere Ait Yorumlar",
                                      style: TextStyle(color: Renk_Blackish,fontSize: 30,fontWeight: FontWeight.bold),
                                    ),
                                    padding: EdgeInsets.all(10),
                                  ),
                                ],
                              ),
                            ),
                          )),//Haber Yorumları Görüntüleme
                        ],
                      ),
                    ),),//Haber İçeriği ve Yorumları Görüntüleme
                  Container(width: 5,height: MediaQuery.of(context).size.height,color: Renk_Blackish,),
                  Flexible(flex: 4,child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Flexible(flex:  1,child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Renk_EggYellow,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  child: Text(
                                    "Haber Gönderisi Oluştur",
                                    style: TextStyle(color: Renk_Blackish,fontSize: 30,fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),//Oluştur Başlığı
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _haberBasligiController,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "Haber Başlığı : ",
                                      labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),
                                      filled: true,
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),//Haber Başlığı
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _haberIcerigiController,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      labelText: "Haber İçeriği : ",
                                      labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),
                                      filled: true,
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),//Haber içeriği
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _haberImageLinkController,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "Haber Görsel Linki : ",
                                      labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),
                                      filled: true,
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),//Haber Görsel Linki
                                Padding(padding: EdgeInsets.all(20),
                                child: FlatButton.icon(
                                  onPressed: (){},
                                  icon: FaIcon(FontAwesomeIcons.paperPlane,size: 20,),
                                  label: Text(" Haberi Paylaş "),
                                  color: Renk_Blackish,
                                  hoverColor: Colors.white12,
                                  textColor: Renk_EggYellow,
                                  padding: EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(color: Renk_Blackish),
                                  ),
                                ),
                                )
                              ],
                            ),
                          ),
                        )), //Gönderi Oluşturma
                        Container(height: 5,width: MediaQuery.of(context).size.width,color: Renk_Blackish,),
                        Flexible(flex:  1,child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  child: Text(
                                    "Haber Gönderisini Düzenle",
                                    style: TextStyle(color: Renk_Blackish,fontSize: 30,fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),//Düzenle Başlığı
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _haberBasligiControllerEdit,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "Haber Başlığı : ",
                                      labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),
                                      filled: true,
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),//Haber Başlığı
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _haberIcerigiControllerEdit,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      labelText: "Haber İçeriği : ",
                                      labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),
                                      filled: true,
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),//Haber içeriği
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _haberImageLinkControllerEdit,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "Haber Görsel Linki : ",
                                      labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),
                                      filled: true,
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),//Haber Göreslinin Linki
                                Padding(padding: EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FlatButton.icon(
                                        onPressed: (){},
                                        icon: FaIcon(FontAwesomeIcons.save,size: 20,),
                                        label: Text(" Haberi Düzenle ve Kaydet "),
                                        color: Renk_Blackish,
                                        hoverColor: Colors.white12,
                                        textColor: Renk_EggYellow,
                                        padding: EdgeInsets.all(15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: BorderSide(color: Renk_Blackish),
                                        ),
                                      ),
                                      FlatButton.icon(
                                        onPressed: (){},
                                        icon: FaIcon(FontAwesomeIcons.trashAlt,size: 20,),
                                        label: Text(" Haberi Kaldır "),
                                        color: Renk_Blackish,
                                        hoverColor: Colors.white12,
                                        textColor: Renk_EggYellow,
                                        padding: EdgeInsets.all(15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: BorderSide(color: Renk_Blackish),
                                        ),
                                      ),//Sil Butonu
                                    ],
                                  ),
                                ),//Kaydet ve Sil Butonu
                              ],
                            ),
                          ),
                        )),//Gönderi Düzenleme
                      ],
                    ),
                  ),), //Düzenle Ve Oluştur Bölümleri
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
