import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzkadmin/Dashboard/ErrorPage.dart';
import 'package:mzkadmin/Defaults/UsedColors.dart';
import 'package:mzkadmin/Json/News.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
  }

  ///#region API'den haber listesi alınır.
  Future<List<News>> _fetchNewsList() async {
    final newsListAPIUrl =
    "http://mzkappv1-env.eba-i5znycbm.eu-central-1.elasticbeanstalk.com/api/admin/op/news";
        //"https://mocki.io/v1/0668f69c-eca9-45f0-ba58-4ce76e1aa0db";
    final response =
    await http.get(newsListAPIUrl, headers: <String, String>{});
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((news) => new News.fromJson(news)).toList();
    } else
      throw Exception('Failed to load jobs from API');
  }

  ///#endregion

  ///#region Server'a Haber Kaydetme
  Future<bool> postHaber(String haberTitle, String haberText,
      String haberImageLink) async {
    final String apiUrl =
        "hhttp://mzkappv1-env.eba-i5znycbm.eu-central-1.elasticbeanstalk.com/api/admin/op/news";

    final response = await http.post(apiUrl, body: {
      "newsTitle": haberTitle,
      "newsText": haberText,
      "newsImageLink": haberImageLink,

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

  ///region Haberi Güncelle

  Future<bool> updateHaber(String haberTitle, String haberText, String haberImageLink,int Id) async {
    final String apiUrl = "http://mzkappv1-env.eba-i5znycbm.eu-central-1.elasticbeanstalk.com/api/admin/op/news/$Id";

    final response = await http.put(apiUrl, body: {
      "newsTitle": haberTitle,
      "newsText": haberText,
      "newsImageLink": haberImageLink,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      final String responseString = response.body;

      Fluttertoast.showToast(
          msg: "Haber başarıyla güncellendi.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);

      //Sayfa temizlenecek!!

      return true;
    } else {

      Fluttertoast.showToast(
          msg: "Haber güncelleme başarısız oldu.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    }
  }

  ///endregion

  ///#region  Haberi Serverdan Kaldırma
  Future<bool> deleteNews(int Id) async {
    final String apiUrl = "http://mzkappv1-env.eba-i5znycbm.eu-central-1.elasticbeanstalk.com/api/admin/op/news/$Id";

    final response = await http.delete(apiUrl,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final String responseString = response.body;

      Fluttertoast.showToast(
          msg: "Haber başarıyla silindi.",
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
          msg: "Haber silme başarısız oldu.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    }
  }
  ///#endregion

  ///#region  Yorumu Serverdan Kaldırma
  Future<bool> deleteNewsComment(int Id) async {
    final String apiUrl = "http://mzkappv1-env.eba-i5znycbm.eu-central-1.elasticbeanstalk.com/api/admin/op/comment/$Id";

    final response = await http.delete(apiUrl,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final String responseString = response.body;

      Fluttertoast.showToast(
          msg: "Yorum başarıyla silindi.",
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
          msg: "Yorum silme başarısız oldu.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    }
  }
  ///#endregion

  ///region görüntüle ve düzenle

  void editAndViewNews(News haber, int index) {
    setState(() {
      _haberBasligiControllerEdit.text = haber.newsTitle;
      _haberIcerigiControllerEdit.text = haber.newsText;
      _haberImageLinkControllerEdit.text = haber.newsImageLink;


      viewHaberBasligi = haber.newsTitle;
      viewHaberIcerigi = haber.newsText;
      viewHaberImageLink = haber.newsImageLink;
      haberIndex = index;


    });
  }

  void viewComment() {
    setState(() {

    });
  }

  ///endregion

  ///#region değişkenler
  static TextEditingController _haberIdController = TextEditingController();
  static TextEditingController _haberBasligiController = TextEditingController();
  static TextEditingController _haberIcerigiController = TextEditingController();
  static TextEditingController _haberImageLinkController = TextEditingController();

  static TextEditingController _haberIdControllerEdit = TextEditingController();
  static TextEditingController _haberBasligiControllerEdit = TextEditingController();
  static TextEditingController _haberIcerigiControllerEdit = TextEditingController();
  static TextEditingController _haberImageLinkControllerEdit = TextEditingController();

  String viewHaberBasligi = "",
      viewHaberIcerigi = "",
      viewHaberImageLink = "";
  int haberIndex = 0;

  ///#endregion

  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
        future: _fetchNewsList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<News> newsVideoList = snapshot.data;
            return Scaffold(
              backgroundColor: Renk_EggYellow,
              body: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                  Row(
                  children: [
                  Flexible(flex:2, child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.vertical,
                        itemCount: newsVideoList.length,
                        itemBuilder: (context, int index) {
                          return ListTile(
                            onTap: () {
                              editAndViewNews(
                                newsVideoList[index], index
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            title: Text(newsVideoList[index].newsTitle,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(" İçerik Açıklaması "),
                            hoverColor: Colors.white30,
                            //trailing: FaIcon(FontAwesomeIcons.edit,size: 20,color: ),
                          );
                        },
                      ),
                    ),
                  ),), // Haber Gönderileri Listesi
                  Container(width: 5, height: MediaQuery.of(context).size.height, color: Renk_Blackish,),
                  Flexible(flex: 4, child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                      Flexible(flex: 2, child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Padding(
                        child: Text(
                        "Haber Görüntüleme",
                          style: TextStyle(color: Renk_Blackish,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        padding: EdgeInsets.all(10),
                      ), //HABER GÖRÜNTÜLEME BAŞLIĞI
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          viewHaberBasligi,
                          style: TextStyle(color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ), //Haber Başlığı
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: CachedNetworkImage(
                          imageUrl: viewHaberImageLink,
                          imageBuilder:
                              (context, imageProvider) =>
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                height: 300,
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
                      ), //Haber Fotoğrafı
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          viewHaberIcerigi,
                          style: TextStyle(color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ), //Haber İçeriği
                      ],
                    ),
                    ),
                  )), //Haberi Görüntüleme
                        Container(height: 5, width: MediaQuery
                      .of(context)
                      .size
                      .width, color: Renk_Blackish,),
                        Flexible(flex: 1, child: SingleChildScrollView(
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                            child: ListView.builder(
                              padding: EdgeInsets.all(5),
                              scrollDirection: Axis.vertical,
                              itemCount: newsVideoList[haberIndex].comment.length,
                              itemBuilder: (context, int index) {
                                return ListTile(
                                  onTap: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  title: Text(
                                    newsVideoList[haberIndex].comment[index]
                                        .userName ?? 'deneme1', style: TextStyle(
                                      fontWeight: FontWeight.bold),),
                                  subtitle: Text(
                                    newsVideoList[haberIndex].comment[index]
                                        .commentText ?? 'deneme2',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),),
                                  hoverColor: Colors.white30,
                                    trailing: IconButton(
                                      icon: FaIcon(FontAwesomeIcons.trashAlt),
                                      color: Colors.black,
                                      hoverColor: Colors.grey.shade300,
                                      onPressed: (){
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
                                                  Navigator.of(ctx).pop();
                                                  deleteNewsComment(newsVideoList[haberIndex].comment[index].id);
                                                  setState(() {

                                                  });
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
                                    ),
                                  leading: newsVideoList[haberIndex].comment[index].commentStatus == 1 ?
                                new Tab(icon: FaIcon(FontAwesomeIcons.check,color: Colors.green,)) :
                                new Tab(icon: FaIcon(FontAwesomeIcons.minus,color: Colors.red,)),
                                );
                              },
                            ),
                          ),
                        ),),
//Haber Yorumları Görüntüleme
                  ],
                ),
              ),),//Haber İçeriği ve Yorumları Görüntüleme
                  Container(width: 5,height: MediaQuery.of(context).size.height,color: Renk_Blackish,),
                  Flexible(flex: 4,child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
          children: [
          Flexible(flex: 1,child: Container(
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
          onPressed: () {
            postHaber(
                _haberBasligiController.text,
                _haberIcerigiController.text,
                _haberImageLinkController.text);
            _haberBasligiController.clear();
            _haberIcerigiController.clear();
            _haberImageLinkController.clear();
            setState(() {

            });
          },
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
          Flexible(flex: 1,child: Container(
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
          onPressed: (){
            updateHaber(
                _haberBasligiControllerEdit.text,
                _haberIcerigiControllerEdit.text,
                _haberImageLinkControllerEdit.text,
                newsVideoList[haberIndex].id
            );
            _haberBasligiControllerEdit.clear();
            _haberIcerigiControllerEdit.clear();
            _haberImageLinkControllerEdit.clear();
            setState(() {

            });
          },
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
          onPressed: (){
            deleteNews(newsVideoList[haberIndex].id);
            _haberBasligiControllerEdit.clear();
            _haberIcerigiControllerEdit.clear();
            _haberImageLinkControllerEdit.clear();
            setState(() {

            });
          },
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
          } else if(snapshot.hasError){
          return ErrorPage();
          }
          ///#region Veriler Yüklenirken Gösterilecek Ekran
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
          ]
          ,
          );

          ///#endregion
        }
    );
  }
}
