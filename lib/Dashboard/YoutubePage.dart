import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzkadmin/Dashboard/ErrorPage.dart';
import 'package:mzkadmin/Defaults/UsedColors.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:mzkadmin/Json/Videos.dart';

class YoutubePage extends StatefulWidget {
  @override
  _YoutubePageState createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  @override

  ///#region Server'a Videoyu Kaydetme
  Future<bool> postYoutubeVideo(String videoId, String videoName,
      String videoDesc, String videoImageLink) async {
    final String apiUrl =
        "http://mzk3-env-2.eba-megayjp2.eu-central-1.elasticbeanstalk.com/api/admin/op/videos";

    final response = await http.post(apiUrl, body: {
      "videoId": videoId,
      "videoTitle": videoName,
      "videoText": videoDesc,
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
    } else {
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

  ///#region API'den video listesi alınır.
  Future<List<VideosData>> _fetchVideoList() async {
    final videoListAPIUrl =
        "http://mzk3-env-2.eba-megayjp2.eu-central-1.elasticbeanstalk.com/api/admin/op/videos";
    final response =
        await http.get(videoListAPIUrl, headers: <String, String>{});

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((job) => new VideosData.fromJson(job)).toList();
    } else
      throw Exception('Failed to load jobs from API');
  }

  ///#endregion

  ///#region  Videoyu Serverdan Kaldırma
  Future<bool> deleteYoutubeVideo(String videoId,int Id) async {
    final String apiUrl = "http://mzk3-env-2.eba-megayjp2.eu-central-1.elasticbeanstalk.com/api/admin/op/video/$Id";
    debugPrint(apiUrl);
    final response = await http.delete(apiUrl,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final String responseString = response.body;

      Fluttertoast.showToast(
          msg: "Video başarıyla silindi.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);


      return true;
    }

    else
    {
      debugPrint(response.statusCode.toString());
      Fluttertoast.showToast(
          msg: "İşVideo silme başarısız oldu.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    }
  }
  ///#endregion

  ///#region Gönderiyi Düzenlemeye Gönder
  void editYoutubePost(String videoId, String videoName, String videoDesc,
      String videoImageLink,int Id) {
    setState(() {
      _videoIdControllerEdit.text = videoId;
      _videoNameEdit.text = videoName;
      _videoDescEdit.text = videoDesc;
      _videoImageLinkEdit.text = videoImageLink;


      viewVideoId=videoId;
      viewVideoTitle=videoName;
      viewVideoDesc=videoDesc;
      viewVideoImageLink=videoImageLink;
      viewId=Id;

    });
  }

  ///#endregion


  void initState() {
    super.initState();
  }

  String viewVideoId="",viewVideoTitle="",viewVideoImageLink="",viewVideoDesc="";
  int viewId=0;
  static TextEditingController _videoIdController = TextEditingController();
  static TextEditingController _videoName = TextEditingController();
  static TextEditingController _videoDesc = TextEditingController();
  static TextEditingController _videoImageLink = TextEditingController();

  static TextEditingController _videoIdControllerEdit = TextEditingController();
  static TextEditingController _videoNameEdit = TextEditingController();
  static TextEditingController _videoDescEdit = TextEditingController();
  static TextEditingController _videoImageLinkEdit = TextEditingController();

  Widget build(BuildContext context) {
    return FutureBuilder<List<VideosData>>(
        future: _fetchVideoList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<VideosData> youtubeVideoList = snapshot.data;
            debugPrint(youtubeVideoList[0].id.toString());
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
                          Flexible(
                            flex: 2,
                            child: SingleChildScrollView(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  padding: EdgeInsets.all(5),
                                  scrollDirection: Axis.vertical,
                                  itemCount: youtubeVideoList.length,
                                  itemBuilder: (context, int index) {
                                    return ListTile(
                                      onTap: () {
                                        editYoutubePost(
                                            youtubeVideoList[index].videoId,
                                            youtubeVideoList[index].videoTitle,
                                            youtubeVideoList[index].videoText,
                                            youtubeVideoList[index].videoImageLink,
                                            youtubeVideoList[index].id,
                                        );
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      title: Text(
                                        youtubeVideoList[index].videoTitle,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                          youtubeVideoList[index].videoText),
                                      hoverColor: Colors.white30,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ), //Gönderi Listesi
                          Container(
                            color: Renk_Blackish,
                            width: 5,
                            height: MediaQuery.of(context).size.height,
                          ),
                          Flexible(
                              flex: 4,
                              child: SingleChildScrollView(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        child: Text(
                                          "Gönderi Görüntüleme",
                                          style: TextStyle(
                                              color: Renk_Blackish,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        padding: EdgeInsets.all(10),
                                      ), //Container Başlığı
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          viewVideoTitle,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ), //Gönderi Başlığı
                                      Padding(
                                        padding: EdgeInsets.all(20),
                                        child: RichText(
                                          text: TextSpan(
                                              text: "Youtube Video Id : ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: viewVideoId,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff333951),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ]),
                                        ),
                                      ), //Video ID
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: CachedNetworkImage(
                                            imageUrl: viewVideoImageLink,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  height: 220,
                                                ),
                                            placeholder: (context, url) =>
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 20.0),
                                                  child: Center(
                                                      child:
                                                      CircularProgressIndicator()),
                                                ),
                                            errorWidget: (context, url, error) =>
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 20.0),
                                                  child: Center(
                                                      child: Icon(
                                                        Icons.error,
                                                        size: 200,
                                                      )),
                                                ),
                                          ),
                                        ),
                                       //Gönderi Fotoğrafı
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          viewVideoDesc,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ), //Gönderi İçeriği
                                    ],
                                  ),
                                ),
                              )), //Gönderi Görüntüleme
                          Container(
                            color: Renk_Blackish,
                            width: 5,
                            height: MediaQuery.of(context).size.height,
                          ),
                          Flexible(
                            flex: 4,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                children: [
                                  Flexible(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                child: Text(
                                                  "Youtube Gönderisi Oluştur",
                                                  style: TextStyle(
                                                      color: Renk_Blackish,
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                padding: EdgeInsets.all(10),
                                              ), //GÖnderi Oluştur Başlığı
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: TextField(
                                                  controller:
                                                      _videoIdController,
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: "Video ID : ",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                    filled: true,
                                                    fillColor: Colors.white12,
                                                    hoverColor: Colors.white30,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ), //Video Id
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: TextField(
                                                  controller: _videoName,
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "Video Başlığı : ",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                    filled: true,
                                                    fillColor: Colors.white12,
                                                    hoverColor: Colors.white30,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ), //Video Başlığı
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: TextField(
                                                  controller: _videoDesc,
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                  obscureText: false,
                                                  maxLines: 6,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "Video Açıklaması : ",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                    filled: true,
                                                    fillColor: Colors.white12,
                                                    hoverColor: Colors.white30,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ), //Video Açıklaması
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: TextField(
                                                  controller: _videoImageLink,
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "Video Fotoğraf Linki : ",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                    filled: true,
                                                    fillColor: Colors.white12,
                                                    hoverColor: Colors.white30,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ), //Fotoğraf Linki
                                              Padding(
                                                padding: EdgeInsets.all(20),
                                                child: FlatButton.icon(
                                                  onPressed: () {
                                                    postYoutubeVideo(
                                                        _videoIdController.text,
                                                        _videoName.text,
                                                        _videoDesc.text,
                                                        _videoImageLink.text);
                                                    _videoIdController.clear();
                                                    _videoName.clear();
                                                    _videoDesc.clear();
                                                    _videoImageLink.clear();
                                                  },
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.paperPlane,
                                                    size: 20,
                                                  ),
                                                  label: Text(
                                                      " Gönderiyi Paylaş "),
                                                  color: Renk_Blackish,
                                                  hoverColor: Colors.white12,
                                                  textColor: Renk_EggYellow,
                                                  padding: EdgeInsets.all(15),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: BorderSide(
                                                        color: Renk_Blackish),
                                                  ),
                                                ),
                                              ) //Gönderi Paylaş Butonu
                                            ],
                                          ),
                                        ),
                                      )), //Gönderi Oluşturma
                                  Container(
                                    height: 5,
                                    width: MediaQuery.of(context).size.width,
                                    color: Renk_Blackish,
                                  ),
                                  Flexible(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        color: Renk_EggYellow,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                child: Text(
                                                  "Youtube Gönderisini Düzenle",
                                                  style: TextStyle(
                                                      color: Renk_Blackish,
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                padding: EdgeInsets.all(10),
                                              ), //Düzenleme başlığı
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: TextField(
                                                  controller:
                                                      _videoIdControllerEdit,
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: "Video ID : ",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                    filled: true,
                                                    fillColor: Colors.white12,
                                                    hoverColor: Colors.white30,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ), //Video Id Düzenleme
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: TextField(
                                                  controller: _videoNameEdit,
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "Haber İçeriği : ",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                    filled: true,
                                                    fillColor: Colors.white12,
                                                    hoverColor: Colors.white30,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ), //Video Başlığı Düzenleme
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: TextField(
                                                  controller: _videoDescEdit,
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                  obscureText: false,
                                                  maxLines: 6,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "Video Açıklaması : ",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                    filled: true,
                                                    fillColor: Colors.white12,
                                                    hoverColor: Colors.white30,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ), //Video Açıklaması Düzenleme
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: TextField(
                                                  controller:
                                                      _videoImageLinkEdit,
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "Video Fotoğraf Linki : ",
                                                    labelStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                    filled: true,
                                                    fillColor: Colors.white12,
                                                    hoverColor: Colors.white30,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ), //Fotoğraf Linki düzenleme
                                              Padding(
                                                  padding: EdgeInsets.all(20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      FlatButton.icon(
                                                        onPressed: () {},
                                                        icon: FaIcon(
                                                          FontAwesomeIcons.save,
                                                          size: 20,
                                                        ),
                                                        label: Text(
                                                            " Gönderiyi Düzenle ve Kaydet  "),
                                                        color: Renk_Blackish,
                                                        hoverColor:
                                                            Colors.white12,
                                                        textColor:
                                                            Renk_EggYellow,
                                                        padding:
                                                            EdgeInsets.all(15),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          side: BorderSide(
                                                              color:
                                                                  Renk_Blackish),
                                                        ),
                                                      ), //Haberi Düzenle Butonu
                                                      FlatButton.icon(
                                                        onPressed: () {
                                                          deleteYoutubeVideo(_videoIdControllerEdit.text,viewId);
                                                        },
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .trashAlt,
                                                          size: 20,
                                                        ),
                                                        label: Text(
                                                            " Gönderiyi Kaldır "),
                                                        color: Renk_Blackish,
                                                        hoverColor:
                                                            Colors.white12,
                                                        textColor:
                                                            Renk_EggYellow,
                                                        padding:
                                                            EdgeInsets.all(15),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          side: BorderSide(
                                                              color:
                                                                  Renk_Blackish),
                                                        ),
                                                      ),
                                                    ],
                                                  )), //Kaydet ve Sil Butonları
                                            ],
                                          ),
                                        ),
                                      )), //Gönderi Düzenleme
                                ],
                              ),
                            ),
                          ), //Gönderi Oluştur ve Gönderi Düzenle
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
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
        });
  }
}
