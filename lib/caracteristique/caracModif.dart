// ignore_for_file: file_names, empty_constructor_bodies

import 'dart:convert';

import 'package:appli_perso/definitionPerso/caracteristiques.dart';
import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;

import '../database.dart';

class CaracModif extends StatefulWidget {
  final Caracteristiques carac;
  final String idPerso;
  String token;

  CaracModif(this.carac, this.idPerso, this.token);

  @override
  _CaracModifState createState() => _CaracModifState();
}

class _CaracModifState extends State<CaracModif> {
  String name = "";
  TextEditingController controllerCharisme = new TextEditingController();
  TextEditingController controllerCourage = new TextEditingController();
  TextEditingController controllerAdresse = new TextEditingController();
  TextEditingController controllerIntelligence = new TextEditingController();
  TextEditingController controllerForce = new TextEditingController();
  TextEditingController controllerEnergAstr = new TextEditingController();
  TextEditingController controllerAttaque = new TextEditingController();
  TextEditingController controllerParade = new TextEditingController();
  TextEditingController controllerDestin = new TextEditingController();

  modif() {
    if (controllerCharisme.text != "") {
      http.put(
          Uri.parse("https://pers-api.onrender.com/persos/" + widget.idPerso + "/caracteristique/charisme"),
          headers: <String, String> {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + widget.token
          },
          body: controllerCharisme.text
      );
      SmartDialog.showToast("modif charisme");
    }
    if (controllerCourage.text != "") {
      http.put(
          Uri.parse("https://pers-api.onrender.com/persos/" + widget.idPerso + "/caracteristique/courage"),
          headers: <String, String> {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + widget.token
          },
          body: controllerCourage.text
      );
      SmartDialog.showToast("modif courage");
    }
    if (controllerAdresse.text != "") {
      http.put(
          Uri.parse("https://pers-api.onrender.com/persos/" + widget.idPerso + "/caracteristique/adresse"),
          headers: <String, String> {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + widget.token
          },
          body: int.parse(controllerAdresse.text)
      );
    }
    if (controllerIntelligence.text != "") {
      http.put(
          Uri.parse("https://pers-api.onrender.com/persos/" + widget.idPerso + "/caracteristique/intelligence"),
          headers: <String, String> {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + widget.token
          },
          body: controllerIntelligence.text
      );
    }
    if (controllerForce.text != "") {
      http.put(
          Uri.parse("https://pers-api.onrender.com/persos/" + widget.idPerso + "/caracteristique/force"),
          headers: <String, String> {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + widget.token
          },
          body: controllerForce.text
      );
    }
    if (controllerAttaque.text != "") {
      http.put(
          Uri.parse("https://pers-api.onrender.com/persos/" + widget.idPerso + "/caracteristique/attaque"),
          headers: <String, String> {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + widget.token
          },
          body: controllerAttaque.text
      );
    }
    if (controllerParade.text != "") {
      http.put(
          Uri.parse("https://pers-api.onrender.com/persos/" + widget.idPerso + "/caracteristique/parade"),
          headers: <String, String> {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + widget.token
          },
          body: controllerParade.text
      );
    }
    if (controllerEnergAstr.text != "") {
      http.put(
          Uri.parse("https://pers-api.onrender.com/persos/" + widget.idPerso + "/caracteristique/energie_astrale"),
          headers: <String, String> {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + widget.token
          },
          body: controllerEnergAstr.text
      );
    }
    if (controllerDestin.text != "") {
      http.put(
          Uri.parse("https://pers-api.onrender.com/persos/" + widget.idPerso + "/caracteristique/destin"),
          headers: <String, String> {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + widget.token
          },
          body: controllerDestin.text
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    controllerCharisme.text = widget.carac.charisme.toString();
    controllerCourage.text = widget.carac.courage.toString();
    controllerAdresse.text = widget.carac.adresse.toString();
    controllerIntelligence.text = widget.carac.intelligence.toString();
    controllerForce.text = widget.carac.force.toString();
    controllerAttaque.text = widget.carac.attaque.toString();
    controllerParade.text = widget.carac.parade.toString();
    controllerEnergAstr.text = widget.carac.energieAstral.toString();
    controllerDestin.text = widget.carac.destin.toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("modification"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerCharisme,
                    decoration: const InputDecoration(
                      labelText: 'Charisme',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerCourage,
                    decoration: const InputDecoration(
                      labelText: 'Courage',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerAdresse,
                    decoration: const InputDecoration(
                      labelText: 'Adresse',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerIntelligence,
                    decoration: const InputDecoration(
                      labelText: 'Intelligence',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerForce,
                    decoration: const InputDecoration(
                      labelText: 'Force',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerAttaque,
                    decoration: const InputDecoration(
                      labelText: 'Attaque',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerParade,
                    decoration: const InputDecoration(
                      labelText: 'Parade',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerEnergAstr,
                    decoration: const InputDecoration(
                      labelText: 'energie astrale',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerDestin,
                    decoration: const InputDecoration(
                      labelText: 'Destin',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_rounded),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          modif();
          Navigator.pop(context);
        },
      ),
    );
  }
}
