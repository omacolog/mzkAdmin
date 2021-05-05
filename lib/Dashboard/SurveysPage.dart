import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mzkadmin/Defaults/UsedColors.dart';

class SurveysPage extends StatefulWidget {
  @override
  _SurveysPageState createState() => _SurveysPageState();
}

class _SurveysPageState extends State<SurveysPage> {
  @override

  void initState() {
    super.initState();
  }

  ///#region Seçenekleri Gösterme
  void secenekleriGoster(){
    setState(() {
      optionNumber=int.parse(_anketSecenekSayisiController.text);
    });
  }

  ///#endregion

  static TextEditingController _anketBasligiController = TextEditingController();
  static TextEditingController _anketSorusuController = TextEditingController();
  static TextEditingController _anketFotografLinkController = TextEditingController();
  static TextEditingController _anketSecenekSayisiController = TextEditingController();
  int optionNumber=1;


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
                            title: Text("${i+1}. Anket Başlığı ",style: TextStyle(fontWeight: FontWeight.bold),),
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
                          Flexible(flex: 1,child: SingleChildScrollView(
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
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              text: "Başlangıç Tarihi : ",
                                              style: TextStyle(color: Renk_Blackish,fontSize: 12,fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: "18/04/2021 15:47",
                                                    style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.w500)
                                                )
                                              ]
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),//Başlangıç Tarihi
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              text: "Bitiş Tarihi : ",
                                              style: TextStyle(color: Renk_Blackish,fontSize: 12,fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: "25/04/2021 18:00",
                                                    style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.w500)
                                                ),
                                              ]
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),//Bitiş Tarihi
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      " Youtube Gönderi Başlığı",
                                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                                    ),
                                  ),//Anket Başlığı
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "Anket Sorusu Anket Sorusu Anket Sorusu Anket Sorusu ?",
                                      style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),
                                    ),
                                  ),//Anket Başlığı
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Container(
                                      height: 200,
                                      child: Image(
                                        image: AssetImage("images/logo.png",),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),//Anket Fotoğrafı
                                  Padding(padding: EdgeInsets.all(15),child: FlatButton.icon(
                                    onPressed: (){
                                      secenekleriGoster();
                                    },
                                    icon: FaIcon(FontAwesomeIcons.eye),
                                    label: Text("Seçenekleri Göster"),
                                    textColor: Renk_EggYellow,
                                    color: Renk_Blackish,
                                    hoverColor: Colors.white30,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Renk_Blackish,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(15),
                                  ),),
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
                                    itemCount: 5,
                                    itemBuilder: (context,int i){
                                      return ListTile(
                                        onTap: (){},
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        title: Text("${i+1}. Seçenek ",style: TextStyle(fontWeight: FontWeight.bold),),
                                        trailing: Text("Oy Sayısı"),
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
                                  ),//Anket Fotoğraf Linki
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: TextField(
                                      controller: _anketSecenekSayisiController,
                                      cursorColor: Colors.black,
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
                                  ),//Anket Fotoğraf Linki
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
                                /*Padding(
                                  child: Text(
                                    "Seçenekler",
                                    style: TextStyle(color: Renk_Blackish,fontSize: 30,fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(5),
                                ),*///Container Başlığı
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
                                            controller: _anketBasligiController,
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
                                    onPressed: (){},
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
}
