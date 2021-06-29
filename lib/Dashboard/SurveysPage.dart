import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzkadmin/Dashboard/ErrorPage.dart';
import 'package:mzkadmin/Defaults/UsedColors.dart';
import 'package:mzkadmin/Json/Survey.dart';
import 'package:http/http.dart' as http;

class SurveysPage extends StatefulWidget {
  @override
  _SurveysPageState createState() => _SurveysPageState();
}

class _SurveysPageState extends State<SurveysPage> {
  @override

  void initState() {
    optionNumber=1;
    var  startdate = DateTime.now();
    var  finishdate = startdate.add(const Duration(days: 30));
    super.initState();
  }

  ///region Apiden anketi çekme
  Future<List<Survey>> _fetchSurveyList() async {
    final surveyListAPIUrl =
        "http://mzkappv1-env.eba-i5znycbm.eu-central-1.elasticbeanstalk.com/api/admin/op/surveys";
        //"https://run.mocky.io/v3/020d5488-d8ce-4fcc-84c1-39d3cbfb094d";
    final response =
    await http.get(surveyListAPIUrl, headers: <String, String>{});
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      return jsonResponse.map((survey) => new Survey.fromJson(survey)).toList();
    } else
      throw Exception('Failed to load jobs from API');
  }
  ///endregion

  ///#region Seçenekleri Gösterme
  void secenekleriGoster(){
    setState(() {
      optionNumber=int.parse(_anketSecenekSayisiController.text);
    });
  }

  List<TextEditingController> _controller = [
    for (int i = 0; i < 10; i++)
      TextEditingController()
  ];

  ///#endregion

  void editAndViewSurvey(Survey anket, int index) {
    setState(() {
      viewAnketBasligi = anket.surveyName;
      viewAnketSorusu = anket.surveyQuestion;
      viewAnketImageLink = anket.surveyImage;
      anketIndex = index;


    });
  }

  ///#region Server'a Haber Kaydetme
  Future<bool> postSurvey(
      String anketTitle, String anketQuestion, String anketImageLink, List<SurveyOption> anketSecenekleri) async {
    final String apiUrl =
        "http://mzkappv1-env.eba-i5znycbm.eu-central-1.elasticbeanstalk.com/api/admin/op/surveys";

    final response = await http.post(apiUrl, body: {
      "surveyName": anketTitle,
      "surveyQuestion": anketQuestion,
      "surveyImage": anketImageLink,
      "surveyOption": anketSecenekleri,
      "surveyStartDate": DateTime.now(),
      "surveyEndDate": DateTime.now().add(const Duration(days: 30)),
      "ısSurveyAvailable" : true,

    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      final String responseString = response.body;

      Fluttertoast.showToast(
          msg: "Anket başarıyla eklendi.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffDAA520),
          textColor: Colors.white,
          fontSize: 16.0);

      //Sayfa temizlenecek!!

      return true;
    } else {
      Fluttertoast.showToast(
          msg: "Anket oluşturma işlemi başarısız oldu.",
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
  static TextEditingController _anketBasligiController = TextEditingController();
  static TextEditingController _anketSorusuController = TextEditingController();
  static TextEditingController _anketFotografLinkController = TextEditingController();
  static TextEditingController _anketSecenekSayisiController = TextEditingController();
  int optionNumber;

  String  viewAnketBasligi = "",
          viewAnketSorusu = "",
          viewAnketImageLink = "";

  int     anketIndex = 0;

  List<SurveyOption> anketOptions= <SurveyOption>[];

  List anketListesi = [];
  ///endregion

  Widget build(BuildContext context) {
    return FutureBuilder<List<Survey>>(
      future: _fetchSurveyList(),
        builder: (context,snapshot){
        if(snapshot.hasData){
          List<Survey> surveyVideoList = snapshot.data;
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
                              itemCount: surveyVideoList.length,
                              itemBuilder: (context,int index){
                                return ListTile(
                                  onTap: () => editAndViewSurvey(surveyVideoList[index], index),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  title: Text(surveyVideoList[index].surveyName,style: TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle: Text(" Anket Açıklaması "),
                                  hoverColor: Colors.white30,
                                  //trailing: FaIcon(FontAwesomeIcons.edit,size: 20,color: ),
                                );
                              },
                            ),
                          ),
                        ),),// Anket Gönderileri Listesi
                        Container(width: 5,height: MediaQuery.of(context).size.height,color: Renk_Blackish,),
                        Flexible(flex:4,child: SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                Flexible(flex: 2,child: SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Padding(
                                          child: Text(
                                            "Anket Görüntüleme",
                                            style: TextStyle(color: Renk_Blackish,fontSize: 30,fontWeight: FontWeight.bold),
                                          ),
                                          padding: EdgeInsets.all(5),
                                        ),//Container Başlığı
                                        Container(height: 2,width: MediaQuery.of(context).size.width*0.15,color: Colors.black,),
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            viewAnketBasligi,
                                            style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                                          ),
                                        ),//Anket Başlığı
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            viewAnketSorusu,
                                            style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),
                                          ),
                                        ),//Anket Başlığı
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: CachedNetworkImage(
                                            imageUrl: viewAnketImageLink,
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
                                        //Anket Fotoğrafı
                                      ],
                                    ),
                                  ),
                                ),),//Anket İçeriği Görüntülernir
                                Container(height: 2,width: MediaQuery.of(context).size.width,color: Colors.white10,),
                                Flexible(flex: 1,child: SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height*(0.7),
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(5),
                                      scrollDirection: Axis.vertical,
                                      itemCount: surveyVideoList[anketIndex].surveyOption.length,
                                      itemBuilder: (context,int index){
                                        return ListTile(
                                          onTap: (){},
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          title: Text(
                                            surveyVideoList[anketIndex].surveyOption[index].surveyOption,
                                            style: TextStyle(fontWeight: FontWeight.bold),),
                                          leading: Text("${index+1} - ",style: TextStyle(fontWeight: FontWeight.bold),),
                                          hoverColor: Colors.white30,
                                          //trailing: FaIcon(FontAwesomeIcons.edit,size: 20,color: ),
                                        );
                                      },
                                    ),
                                  ),
                                ),),//Anketin Seçenekleri Görüntülernir
                              ],
                            ),
                          ),
                        )),//Anket Görüntüleme
                        Container(width: 5,height: MediaQuery.of(context).size.height,color: Renk_Blackish,),
                        Flexible(flex:4,child: SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                Flexible(flex: 1,child: SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Padding(
                                          child: Text(
                                            "Anket Oluştur",
                                            style: TextStyle(color: Renk_Blackish,fontSize: 30,fontWeight: FontWeight.bold),
                                          ),
                                          padding: EdgeInsets.all(5),
                                        ),//Container Başlığı
                                        SizedBox(height: 5,),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: TextField(
                                            controller: _anketBasligiController,
                                            cursorColor: Colors.black,
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: "Anket Başlığı : ",
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
                                        ),//Anket Başlığı Girişi
                                        SizedBox(height: 5,),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: TextField(
                                            controller: _anketSorusuController,
                                            cursorColor: Colors.black,
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: "Anket Sorusu : ",
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
                                        ),//Anket Sorusu Girişi
                                        SizedBox(height: 5,),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: TextField(
                                            controller: _anketFotografLinkController,
                                            cursorColor: Colors.black,
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: "Anket Fotoğraf Linki : ",
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
                                        ),//Anket Fotoğraf Linki
                                        SizedBox(height: 5,),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: TextField(
                                            controller: _anketSecenekSayisiController,
                                            cursorColor: Colors.black,
                                            maxLength: 1,
                                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: "Anketteki Seçenek Sayısı: ",
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
                                        ),//Anket Seçenek Sayısı
                                        SizedBox(height: 5,),
                                        FlatButton.icon(
                                          onPressed: () {
                                            secenekleriGoster();
                                          },
                                          icon: FaIcon(FontAwesomeIcons.plusSquare,color: Renk_EggYellow,),
                                          label: Text("Seçenekleri Oluştur"),
                                          textColor: Renk_EggYellow,
                                          color: Renk_Blackish,
                                          hoverColor: Colors.white30,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(color: Renk_Blackish,
                                            ),
                                          ),
                                          padding: EdgeInsets.all(15),
                                        ),//Seçenek Oluştur Butonu
                                        SizedBox(height: 5,),
                                      ],
                                    ),
                                  ),
                                ),),
                                Container(height: 2,width: MediaQuery.of(context).size.width,color: Renk_EggYellow,),
                                Flexible(flex: 1,child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height*(0.35),
                                        child: ListView.builder(
                                          padding: EdgeInsets.all(5),
                                          scrollDirection: Axis.vertical,
                                          itemCount: optionNumber ,
                                          itemBuilder: (context,int i){
                                            return Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(0),
                                              ),
                                              color: Renk_EggYellow,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 1),
                                                child: TextField(
                                                  controller: _controller[i],
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: " ${i+1}. Seçenek : ",
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
                                              ),//Anket Başlığı Girişi,
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.all(10),
                                        child:FlatButton.icon(
                                          onPressed: (){
                                            List<SurveyOption> anketOp= new List(optionNumber);
                                            //anketOp.length=optionNumber;
                                            for(int index=0;index<optionNumber;index++){
                                              anketOp[index].surveyOption=_controller[index].text;
                                              print(anketOp[index].surveyOption.toString());
                                            }
                                            postSurvey(
                                                _anketBasligiController.text,
                                                _anketSorusuController.text,
                                                _anketFotografLinkController.text,
                                                anketOp.toList(),
                                            );
                                          },
                                          icon: FaIcon(FontAwesomeIcons.plusSquare,color: Renk_EggYellow,),
                                          label: Text("Anketi Oluştur"),
                                          textColor: Renk_EggYellow,
                                          color: Renk_Blackish,
                                          hoverColor: Colors.white30,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: BorderSide(color: Renk_Blackish,
                                            ),
                                          ),
                                          padding: EdgeInsets.all(15),
                                        ),//Seçenek Oluştur Butonu ,
                                      ),
                                    ],
                                  ),
                                ),),
                              ],
                            ),
                          ),
                        )),//Anket Düzenleme ve Paylaşma
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        else if (snapshot.hasError){
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
