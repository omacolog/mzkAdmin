import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YoutubePage extends StatefulWidget {
  @override
  _YoutubePageState createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  @override


  void initState() {
    super.initState();
  }

  static TextEditingController _videoIdController = TextEditingController();
  static TextEditingController _videoName = TextEditingController();
  static TextEditingController _videoDesc = TextEditingController();
  static TextEditingController _videoImageLink = TextEditingController();

  static TextEditingController _videoIdControllerEdit = TextEditingController();
  static TextEditingController _videoNameEdit = TextEditingController();
  static TextEditingController _videoDescEdit = TextEditingController();
  static TextEditingController _videoImageLinkEdit = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 5,),
                  Flexible(flex:2,child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white12,
                      child: ListView.builder(
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
                              color: Color(0xff333951),
                              onPressed: (){},
                              hoverColor: Colors.white54,
                              mouseCursor: MouseCursor.uncontrolled,
                            ),
                            //trailing: FaIcon(FontAwesomeIcons.edit,size: 20,color: ),
                          );
                        },
                      ),
                    ),
                  ),),//Gönderi Listesi
                  SizedBox(width: 5,),
                  Flexible(flex:3,child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            child: Text(
                              "Gönderi Görüntüleme",
                              style: TextStyle(color: Color(0xff333951),fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.all(10),
                          ),//Container Başlığı
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              " Youtube Gönderi Başlığı",
                              style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                          ),//Gönderi Başlığı
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: RichText(
                              text: TextSpan(
                                  text: "Youtube Video Id : ",
                                  style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "VideoID",
                                        style: TextStyle(color: Color(0xff333951),fontSize: 16,fontWeight: FontWeight.w500)
                                    )
                                  ]
                              ),
                            ),
                          ),//Video ID
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 250,
                              child: Image(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),//Gönderi Fotoğrafı
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Gönderi içeriği",
                              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                            ),
                          ),//Gönderi İçeriği
                        ],
                      ),
                    ),
                  )),//Gönderi Görüntüleme
                  SizedBox(width: 5,),
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
                                    "Youtube Gönderisi Oluştur",
                                    style: TextStyle(color: Color(0xff333951),fontSize: 18,fontWeight: FontWeight.bold),
                                  ),
                                ),//GÖnderi Oluştur Başlığı
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _videoIdController,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "Video ID : ",
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
                                ),//Video Id
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _videoName,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "Video Başlığı : ",
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
                                ),//Video Başlığı
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _videoDesc,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    maxLines: 6,
                                    decoration: InputDecoration(
                                      labelText: "Video Açıklaması : ",
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
                                ),//Video Açıklaması
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _videoImageLink,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "Video Fotoğraf Linki : ",
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
                                ),//Fotoğraf Linki
                                Padding(padding: EdgeInsets.all(20),
                                  child: OutlineButton.icon(
                                    onPressed: (){},
                                    icon: FaIcon(FontAwesomeIcons.paperPlane,size: 20,),
                                    label: Text("Gönderi Paylaş"),
                                    textColor: Colors.black,
                                    color: Colors.amber,
                                    hoverColor: Colors.amber.shade400,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(color: Colors.black)
                                    ),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                )//Gönderi Paylaş Butonu
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
                                    "Youtube Gönderisini Düzenle",
                                    style: TextStyle(color: Color(0xff333951),fontSize: 18,fontWeight: FontWeight.bold),
                                  ),
                                ),//Düzenleme başlığı
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _videoIdControllerEdit,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "Video ID : ",
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
                                ),//Video Id Düzenleme
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _videoNameEdit,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
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
                                ),//Video Başlığı Düzenleme
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _videoDescEdit,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    maxLines: 6,
                                    decoration: InputDecoration(
                                      labelText: "Video Açıklaması : ",
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
                                ),//Video Açıklaması Düzenleme
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextField(
                                    controller: _videoImageLinkEdit,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: "Video Fotoğraf Linki : ",
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
                                ),//Fotoğraf Linki düzenleme
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
                                ),//Kaydet ve Sil Butonları
                              ],
                            ),
                          ),
                        )),//Gönderi Düzenleme
                      ],
                    ),
                  ),),//Gönderi Oluştur ve Gönderi Düzenle
                  SizedBox(width: 5,),
                ],
              )
            ],
          ),
        ),
      ),
    );
    /*body: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Row(children: [SizedBox(width: 50,),Text("YOUTUBE GÖNDERİLERİ",
              style: TextStyle(color: Color(0xff333951),fontSize: 40,fontWeight: FontWeight.bold),)],),
            Padding(padding: EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 50),
                FlatButton.icon(
                  onPressed: (){},
                  icon: FaIcon(FontAwesomeIcons.folderPlus),
                  label: Text(" Yeni Bir Youtube Gönderisi Oluştur ",style: TextStyle(
                    fontWeight: FontWeight.w400,fontSize: 18,
                  ),),
                  color: Color(0xff333951),
                  textColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),//Gönderi Oluştur Düğmesi
            Padding(padding: EdgeInsets.all(20)),
            Row(
              children: [
                SizedBox(width: 50,),
                Container(
                  color: Colors.white12,
                  width: MediaQuery.of(context).size.width*0.20,
                  height: MediaQuery.of(context).size.height*0.53,
                  //margin: EdgeInsets.symmetric(vertical: 20),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context,int i){
                      return ListTile(
                        onTap: (){},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        title: Text("$i. Gönderi Başlığı ",style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text(" Gönderi Açıklaması "),
                        trailing: FaIcon(FontAwesomeIcons.edit),
                      );
                    },
                  ),
                ),//Gönderilerin görüntülendiği Container
                SizedBox(width: 50,),
                Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.53,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  color: Colors.white12,
                  child: ListView(
                    // VideoId-VideoBaşlığı-VideoAçıklaması-VideoResimLinki
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _videoIdController,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Video ID",
                            labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _videoName,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Video Başlığı",
                            labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _videoDesc,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),
                          obscureText: false,
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: "Video Açıklaması",
                            labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _videoImageLink,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Video Görsel Linki",
                            labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: ButtonBar(
                          children: [
                            FlatButton.icon(
                              onPressed: (){},
                              icon: FaIcon(FontAwesomeIcons.save),
                              label: Text(" Kaydet "),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                              color: Color(0xff333951),
                              textColor: Colors.amber,
                              height: 40,
                            ),
                            FlatButton.icon(
                              onPressed: (){},
                              icon: FaIcon(FontAwesomeIcons.bullhorn),
                              label: Text(" Paylaş "),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                              color: Color(0xff333951),
                              textColor: Colors.amber,
                              height: 40,
                            ),
                            FlatButton.icon(
                              onPressed: (){},
                              icon: FaIcon(FontAwesomeIcons.trashAlt),
                              label: Text(" Sil "),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                              color: Color(0xff333951),
                              textColor: Colors.amber,
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),//Gönderi detaylarının görüntülendiği Container

              ],
            ),//Gödneri görüntüleme containeri
            SizedBox(height: 20),
          ],
        )
    );*/
  }
}
