// ignore_for_file: file_names, empty_constructor_bodies

import 'dart:convert';

import 'package:appli_perso/caracteristique/caracModif.dart';
import 'package:appli_perso/definitionPerso/caracteristiques.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'caracList.dart';
import 'package:http/http.dart' as http;

class CaracPerso extends StatefulWidget {
  final String idPerso;
  Caracteristiques carac;
  String token;

  CaracPerso(this.idPerso, this.carac, this.token);

  @override
  _CaracPersoState createState() => _CaracPersoState();
}

class _CaracPersoState extends State<CaracPerso> {

  void reload() {
    SmartDialog.showLoading();
    Future<Caracteristiques> futureCarac = fetchCarac();
    futureCarac.then((value) => {
      setState(() {
        widget.carac = value;
      })
    });
    SmartDialog.dismiss();
    SmartDialog.showToast('chargement des personnages terminé');
  }


  Future<Caracteristiques> fetchCarac() async {
    final response = await http
        .get(Uri.parse("https://pers-api.onrender.com/persos"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Caracteristiques carac = Caracteristiques.fromJson(jsonDecode(response.body));
      return carac;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load perso');
    }
  }

  @override
  void initState() {
    reload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var resMag = ((widget.carac.courage +
        widget.carac.intelligence +
        widget.carac.force) / 3);
    var magPhy = ((widget.carac.adresse +
        widget.carac.intelligence) /2);
    Map<String, String> map = {
      "charisme" : widget.carac.charisme.toString(),
      "courage" : widget.carac.courage.toString(),
      "adresse" : widget.carac.adresse.toString(),
      "intelligence" : widget.carac.intelligence.toString(),
      "force" : widget.carac.force.toString(),
      "resistance magique" : resMag.ceil().toString().toString(),
      "magie physique" : magPhy.ceil().toString().toString(),
      "attaque" : widget.carac.attaque.toString(),
      "parade" : widget.carac.parade.toString(),
      "energie astrale" : widget.carac.energieAstral.toString() + "/" + widget.carac.energieAstralMax.toString(),
      "destin" : widget.carac.destin.toString(),
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("Caracteristique"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CaracList(map),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CaracModif(widget.carac, widget.idPerso, widget.token)),
          ).then((value) => {
            setState(() {}),
          }),
        },
      ),
    );
  }
}
