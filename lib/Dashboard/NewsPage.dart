import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 5),
                  Flexible(flex: 2, child: Container(
                        color: Colors.white12,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 25,
                          itemBuilder: (context,int i){
                            return ListTile(
                              onTap: (){},
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              title: Text("$i. Haber Gönderisi Başlığı ",style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text(" Haber Açıklaması "),
                              trailing: FaIcon(FontAwesomeIcons.edit,size: 20,color: Color(0xff333951),),
                            );
                          },
                        ),
                      ),),// Haber Gönderileri Listesi
                  SizedBox(width: 5,),
                  Flexible(flex: 4, child: Container(
                      color: Colors.amber,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Flexible(flex: 1,child: Container(
                            color: Colors.white12,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Haber Görüntüleme",
                                      style: TextStyle(color: Color(0xff333951),fontSize: 20,fontWeight: FontWeight.bold),
                                    ),
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
                          SizedBox(height: 10,),
                          Flexible(flex: 1,child: Container(
                            color: Colors.white12,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Habere Ait Yorumlar",
                                      style: TextStyle(color: Color(0xff333951),fontSize: 18,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),//Haber Yorumları Görüntüleme
                        ],
                      ),
                    ),),//Haber İçeriği ve Yorumları Görüntüleme
                  SizedBox(width: 5),
                  Flexible(flex: 4,child: Container(
                    color: Colors.amber,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Flexible(flex:  1,child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.white12,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Haber Gönderisi Oluştur",
                                    style: TextStyle(color: Color(0xff333951),fontSize: 18,fontWeight: FontWeight.bold),
                                  ),
                                ),
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
                                      fillColor: Colors.amber,
                                      hoverColor: Colors.amber.shade400,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
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
                                      fillColor: Colors.amber,
                                      hoverColor: Colors.amber.shade400,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
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
                                      fillColor: Colors.amber,
                                      hoverColor: Colors.amber.shade400,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(20),
                                child: OutlineButton.icon(
                                    onPressed: (){},
                                    icon: FaIcon(FontAwesomeIcons.paperPlane,size: 20,),
                                    label: Text("Haberi Paylaş"),
                                  textColor: Colors.black,
                                  color: Colors.amber,
                                  hoverColor: Colors.amber.shade400,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.black)
                                  ),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                )
                              ],
                            ),
                          ),
                        )),//Gönderi Oluşturma
                        SizedBox(height: 10,),
                        Flexible(flex:  1,child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.white12,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Haber Gönderisini Düzenle",
                                    style: TextStyle(color: Color(0xff333951),fontSize: 18,fontWeight: FontWeight.bold),
                                  ),
                                ),
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
                                      fillColor: Colors.amber,
                                      hoverColor: Colors.amber.shade400,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
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
                                      fillColor: Colors.amber,
                                      hoverColor: Colors.amber.shade400,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
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
                                      fillColor: Colors.amber,
                                      hoverColor: Colors.amber.shade400,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      OutlineButton.icon(
                                        onPressed: (){},
                                        icon: FaIcon(FontAwesomeIcons.save,size: 20,),
                                        label: Text("Haberi Düzenle ve Kaydet"),
                                        textColor: Colors.black,
                                        color: Colors.amber,
                                        hoverColor: Colors.amber.shade400,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(color: Colors.black)
                                        ),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                      OutlineButton.icon(
                                        onPressed: (){},
                                        icon: FaIcon(FontAwesomeIcons.trashAlt,size: 20,),
                                        label: Text("Haberi Kaldır"),
                                        textColor: Colors.black,
                                        color: Colors.amber,
                                        hoverColor: Colors.amber.shade400,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(color: Colors.black)
                                        ),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ],
                                  )
                                )
                              ],
                            ),
                          ),
                        )),//Gönderi Düzenleme
                      ],
                    ),
                  ),), //Düzenle Ve Oluştur Bölümleri
                  SizedBox(width: 5,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
