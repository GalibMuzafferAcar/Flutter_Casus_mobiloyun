import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:spy_for_kavacik/models/oyun.dart';
import 'package:spy_for_kavacik/ui/gameplay.dart';
import 'package:spy_for_kavacik/main.dart';

class index extends StatefulWidget {
  @override
  _indexState createState() => _indexState();
}

//var oyuncular = List<Widget>();
//var oyun = List<Widget>();
//var ekran = List.generate(
//    2, (i) => List<Widget>.generate(0, (j) => RaisedButton(onPressed: null)),
//    growable: false);
//int secilenekran=0;
//List<Oyuncular> tumOyuncular;
TextEditingController textFieldController = TextEditingController();
String sehir = "";
//var Oyuncular = List.generate(10, (i) => List(10), growable: false);
//int oyuncuSayac = 0;

class _indexState extends State<index> {
  static int sayac = 0;
  bool darkModeSwitch = false;
  @override
  void dispose() {
    // TODO: implement dispose-
    super.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    Oyuncular.tumOyuncular = [];

  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: secim),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Casus"),
              Switch(
                value: darkModeSwitch,
                onChanged: (bool) {
                  setState(() {
                    darkModeSwitch = bool;
                    if (darkModeSwitch) {
                      secim = Brightness.dark;
                    } else {
                      secim = Brightness.light;
                    }
                  });
                },
              )
            ],
          ),
        ),
        body: uygulamaGovdesi(),
      ),
    );
  }

  Widget uygulamaGovdesi() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Oyuncu Adı",
                        hintText: "Oyuncu adını giriniz",
                        hintStyle: TextStyle(fontSize: 18),
                        labelStyle: TextStyle(fontSize: 22, color: Colors.teal),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.teal))),
                    controller: textFieldController,
                    style: TextStyle(fontSize: 24, color: Colors.green),
                  ),
                ),
                ButtonTheme(
                  height: MediaQuery.of(context).size.height / 12,
                  minWidth: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 1.5,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        Oyuncular.tumOyuncular.add(Oyuncular(
                            textFieldController.text, rastgeleRenkOlustur()));
                      });
                    },
                    child: Text("Oyuncu Ekle"),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemBuilder: _listeElemanlariniOlustur,
                  itemCount: Oyuncular.tumOyuncular.length,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: "1",
                      groupValue: sehir,
                      onChanged: (deger) {
                        setState(() {
                          SpySayisi = int.parse(deger);
                          sehir = deger;
                          debugPrint(deger);
                        });
                      },
                    ),
                    Text("Tek Spy"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: "2",
                      groupValue: sehir,
                      onChanged: (deger) {
                        setState(() {
                          SpySayisi = int.parse(deger);
                          sehir = deger;
                          debugPrint(deger);
                        });
                      },
                    ),
                    Text("Çift Spy")
                  ],
                ),
              ],
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 13,
              child: RaisedButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Gameplay()));
                  textFieldController.clear();
                  FocusScope.of(context).unfocus();
                  Navigator.pushNamed(context, '/Gameplay');

                }
                /*() {
                            var spy = new List<int>();
                            bool x = false;
                            if (SpySayisi == 0) SpySayisi = 1;
                            var rng = new Random();
                            var secilenlokasyon =
                                lokasyonlar[rng.nextInt(lokasyonlar.length)];
                            // debugPrint(SpySayisi.toString());
                            for (var i = 0; i < SpySayisi; i++) {
                                spy.add(rng.nextInt(oyuncuSayac));
                                if(i>0&&spy[i]==spy[i-1]){
                                  while(true){
                                    spy[i]=rng.nextInt(oyuncuSayac);
                                    if(spy[i]!=spy[i-1]) break;
                                  }
                                }

                              debugPrint(spy[i].toString());
                            }

                            for (var i = 0; i < oyuncuSayac; i++) {
                              if (SpySayisi==2 ? spy[0]==i || spy[1]==i: spy[0]==i ) {
                                ekran[1].add(RaisedButton(
                                  onPressed: () {
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Spy"),
                                            content: Text("Konum: ???????"),
                                          );
                                        });
                                  },
                                  child: Text(Oyuncular[i][0]),
                                ));
                              } else {
                                ekran[1].add(RaisedButton(
                                  onPressed: () {
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Oyuncu"),
                                            content: Text("Konum:" + secilenlokasyon),
                                          );
                                        });
                                  },
                                  child: Text(Oyuncular[i][0].toString()),
                                ));
                              }
                            }
                            setState(() {
                              secilenekran=1;
                            });
                          }*/
                ,
                child: Text("Oyunu Başlat"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget uygulamaGovdesii() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: textFieldController,
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: _listeElemanlariniOlustur,
              itemCount: Oyuncular.tumOyuncular.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listeElemanlariniOlustur(BuildContext context, int index) {
    sayac++;
    return Dismissible(
      key: Key(sayac.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        setState(() {
          Oyuncular.tumOyuncular.removeAt(index);
        });
      },
      child: Card(
        shadowColor: Oyuncular.tumOyuncular[index].renk,
        elevation: 15,
        margin: EdgeInsets.all(10),
        child: ListTile(
          leading: Icon(
            Icons.person,
            color: Oyuncular.tumOyuncular[index].renk,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Oyuncular.tumOyuncular[index].renk,
          ),
          title: Text(Oyuncular.tumOyuncular[index].ad),
        ),
      ),
    );
  }
}

Color rastgeleRenkOlustur() {
  return Color.fromARGB(150 + Random().nextInt(105), Random().nextInt(255),
      Random().nextInt(255), Random().nextInt(255));
}
