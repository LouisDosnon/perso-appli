// ignore_for_file: file_names, empty_constructor_bodies

import 'dart:convert';

import 'package:appli_perso/definitionPerso/modificateurs.dart';
import 'package:appli_perso/definitionPerso/coup_speciaux.dart';
import 'package:appli_perso/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'definitionPerso/caracteristiques.dart';
import 'definitionPerso/competence.dart';
import 'definitionPerso/monaie.dart';
import 'definitionPerso/inventaires.dart';
import 'definitionPerso/equipement.dart';
import 'persolist.dart';
import 'definitionPerso/perso.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  String user;

  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Perso> listPerso = [];
  String token = "";

  void newPerso() {
    var perso = Perso(
      (listPerso.length+1).toString(),
      "New Character",
      0,
      "Race",
      "Classe",
      0,
      0,
      0,
      0,
      Caracteristiques(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      Competences([]),
      Monaies(0, 0, 0),
      Inventaires([]),
      Equipement(
        Equip("null", "null"),
        Equip("null", "null"),
        Equip("null", "null"),
        Equip("null", "null"),
        Equip("null", "null"),
        Equip("null", "null"),
        Equip("null", "null"),
        Equip("null", "null"),
        Equip("null", "null"),
        [],
      ),
      Coup_speciaux([]),
      Modificateurs([]),
    );
    setState(() {
      listPerso.add(perso);
    });
  }

  Future<List<Perso>> fetchPerso() async {
    final responseJwt = await http
        .get(Uri.parse("https://pers-api.onrender.com/jwtGenerator/louis3022&29d55de952ef175aca7752b2e610a58b"));

    if (responseJwt.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      this.token = responseJwt.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to get jwt token');
    }
    
    final response = await http
        .get(Uri.parse("https://pers-api.onrender.com/persos"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> elements = jsonDecode(response.body);
      List<Perso> persoList = elements.map((element) => Perso.fromJson(element)).toList();
      debugPrint(persoList.toString());
      return persoList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load perso');
    }
  }

  void reload() {
    SmartDialog.showLoading();
    Future<List<Perso>> list = fetchPerso();
    setState(() {
      listPerso = [];
    });
    list.then((value) => value.forEach((element) {
          setState(() {
            listPerso.add(element);
          });
        }));
    SmartDialog.dismiss();
    SmartDialog.showToast('chargement des personnages terminé');
  }

  @override
  void initState() {
    reload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                reload();
              },
              child: Icon(
                Icons.repeat,
                size: 26.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.save,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: PersoList(listPerso, token)),
          Text(token)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        splashColor: Colors.lightBlue[50],
        onPressed: () => {
          newPerso(),
        },
      ),
    );
  }
}
