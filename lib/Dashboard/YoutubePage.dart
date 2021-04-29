import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzkadmin/Defaults/UsedColors.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast_web.dart';

class YoutubePage extends StatefulWidget {
  @override
  _YoutubePageState createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  @override

  ///#region Server'a Videoyu Kaydetme
  Future<bool> postYoutubeVideo(String videoId,String videoName,String videoDesc,String videoImageLink) async {
    final String apiUrl = "http://mzk3-env-2.eba-megayjp2.eu-central-1.elasticbeanstalk.com/api/admin/op/videos";

    final response = await http.post(apiUrl, body: {
      "videoId":  videoId,
      "videoTitle": videoName,
      "videoText":  videoDesc,
      "videoImageLink": videoImageLink,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      final String responseString = response.body;

      Fluttertoast.showToast(
          msg: "Video başarıyla eklendi.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);

      //Sayfa temizlenecek!!

      return true;
    }

    else
    {
      debugPrint(response.statusCode.toString());
      Fluttertoast.showToast(
          msg: "İşlem başarısız oldu.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    }
  }
  ///#endregion



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
      backgroundColor: Renk_EggYellow,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  ),),//Gönderi Listesi
                  Container(color: Renk_Blackish,width: 5,height: MediaQuery.of(context).size.height,),
                  Flexible(flex:4,child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            child: Text(
                              "Gönderi Görüntüleme",
                              style: TextStyle(color: Renk_Blackish,fontSize: 30,fontWeight: FontWeight.bold),
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
                  Container(color: Renk_Blackish,width: 5,height: MediaQuery.of(context).size.height,),
                  Flexible(flex: 4,child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Flexible(flex:  1,child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  child: Text(
                                    "Youtube Gönderisi Oluştur",
                                    style: TextStyle(color: Renk_Blackish,fontSize: 30,fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(10),
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
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
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
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
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
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
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
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),//Fotoğraf Linki
                                Padding(padding: EdgeInsets.all(20),
                                  child: FlatButton.icon(
                                    onPressed: (){
                                      postYoutubeVideo(_videoIdController.text,_videoName.text,_videoDesc.text,_videoImageLink.text);
                                      _videoIdController.clear();
                                      _videoName.clear();
                                      _videoDesc.clear();
                                      _videoImageLink.clear();
                                    },
                                    icon: FaIcon(FontAwesomeIcons.paperPlane,size: 20,),
                                    label: Text(" Gönderiyi Paylaş "),
                                    color: Renk_Blackish,
                                    hoverColor: Colors.white12,
                                    textColor: Renk_EggYellow,
                                    padding: EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Renk_Blackish),
                                    ),
                                  ),
                                )//Gönderi Paylaş Butonu
                              ],
                            ),
                          ),
                        )),//Gönderi Oluşturma
                        Container(height: 5,width: MediaQuery.of(context).size.width,color: Renk_Blackish,),
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
                                    "Youtube Gönderisini Düzenle",
                                    style: TextStyle(color: Renk_Blackish,fontSize: 30,fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),//Düzenleme başlığı
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
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
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
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
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
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
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
                                      fillColor: Colors.white12,
                                      hoverColor: Colors.white30,
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
                                        FlatButton.icon(
                                          onPressed: (){},
                                          icon: FaIcon(FontAwesomeIcons.save,size: 20,),
                                          label: Text(" Gönderiyi Düzenle ve Kaydet  "),
                                          color: Renk_Blackish,
                                          hoverColor: Colors.white12,
                                          textColor: Renk_EggYellow,
                                          padding: EdgeInsets.all(15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(color: Renk_Blackish),
                                          ),
                                        ),//Haberi Düzenle Butonu
                                        FlatButton.icon(
                                          onPressed: (){},
                                          icon: FaIcon(FontAwesomeIcons.trashAlt,size: 20,),
                                          label: Text(" Gönderiyi Kaldır "),
                                          color: Renk_Blackish,
                                          hoverColor: Colors.white12,
                                          textColor: Renk_EggYellow,
                                          padding: EdgeInsets.all(15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(color: Renk_Blackish),
                                          ),
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
