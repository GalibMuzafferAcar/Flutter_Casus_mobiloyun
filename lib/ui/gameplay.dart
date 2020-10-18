import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spy_for_kavacik/models/oyun.dart';

class Gameplay extends StatefulWidget {
  @override
  _GameplayState createState() => _GameplayState();
}

class _GameplayState extends State<Gameplay> {
  int sayac = 0;

  @override
  Widget build(BuildContext context) {
    oyunuHazirla();
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width/1.5,
          child: Center(
            child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemBuilder: _oyunElemanlariniOlustur,
                          itemCount: Oyuncular.tumOyuncular.length,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Oyunu Bitir"),
                      color: Colors.red,
                    )
                  ],
                ),
          ),
        ),
      ),
    );


  }

  Widget _oyunElemanlariniOlustur(BuildContext context, int index) {
    sayac++;
    if (Oyuncular.tumOyuncular[index].konum == "?????????") {
      return RaisedButton(
        onPressed: () {
          return showDialog(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 260,bottom: 270),
                  child: AlertDialog(
                    title: Text("Casus"),
                    content: Column(
                      children: [
                        Text("Konum:" + Oyuncular.tumOyuncular[index].konum),
                        Text("Casuslar:" + Oyuncular.tumOyuncular[index].rol)
                      ],
                    ),
                  actions: [new FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Tamam"))],),
                );
              });
        },
        child: Text(Oyuncular.tumOyuncular[index].ad),
      );
    } else {
      return RaisedButton(
        onPressed: () {
          return showDialog(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 260,bottom: 270),
                  child: AlertDialog(
                    title: Text("Davetli"),
                    content: Column(
                      children: [
                        Text("Konum:" + Oyuncular.tumOyuncular[index].konum),
                      ],
                    ),
                    actions: [new FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Tamam"))],),
                );
              });
        },
        child: Text(Oyuncular.tumOyuncular[index].ad),
      );
    }
  }
}

oyunuHazirla() {
  var rng = new Random();
  int rastgele = rng.nextInt(lokasyonlar.length);
  var secilenlokasyon = oyunlokasyon[rastgele];
  oyunlokasyon.removeAt(rastgele);
  List<int> casuslar = [];
  for (var i = 0; i < SpySayisi; i++) {
    casuslar.add(rng.nextInt(Oyuncular.tumOyuncular.length));
    if (i > 0 && casuslar[i] == casuslar[i - 1]) {
      while (true) {
        casuslar[i] = rng.nextInt(Oyuncular.tumOyuncular.length);
        if (casuslar[i] != casuslar[i - 1]) break;
      }
    }
  }
  if (casuslar.length == 1) {
    casuslar.add(casuslar[0]);
  }
  for (int i = 0; i < Oyuncular.tumOyuncular.length; i++) {
    if (i == casuslar[0] || i == casuslar[1]) {
      Oyuncular.tumOyuncular[i].konum = "?????????";
      if (casuslar[1] != null) {
        Oyuncular.tumOyuncular[i].konum = "?????????";
        Oyuncular.tumOyuncular[i].rol =
            Oyuncular.tumOyuncular[casuslar[i == casuslar[0] ? 1 : 0]].ad;
      }
    } else {
      Oyuncular.tumOyuncular[i].konum = secilenlokasyon;
    }
  }
}
