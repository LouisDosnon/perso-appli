// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pstList.dart';
import 'caracteristique/caracPerso.dart';
import 'competence/compPerso.dart';
import 'monaie/monaiePerso.dart';
import 'equipement/equipPerso.dart';
import 'inventaire/invPerso.dart';
import 'definitionPerso/perso.dart';
import 'database.dart';

class PstPersoModif extends StatefulWidget {
  final Perso perso;

  PstPersoModif(this.perso);

  @override
  _PstPersoModifState createState() => _PstPersoModifState();
}

class _PstPersoModifState extends State<PstPersoModif> {
  String name = "";
  TextEditingController controllerNom = new TextEditingController();
  TextEditingController controllerNiveau = new TextEditingController();
  TextEditingController controllerRace = new TextEditingController();
  TextEditingController controllerClasse = new TextEditingController();
  TextEditingController controllerXp = new TextEditingController();
  TextEditingController controllerXpMax = new TextEditingController();
  TextEditingController controllerPv = new TextEditingController();
  TextEditingController controllerPvMax = new TextEditingController();

  modif() {
    if (controllerNom.text != "") {
      widget.perso.nom = controllerNom.text;
    }
    if (controllerNiveau.text != "") {
      widget.perso.niveau = int.parse(controllerNiveau.text);
    }
    if (controllerRace.text != "") {
      widget.perso.race = controllerRace.text;
    }
    if (controllerClasse.text != "") {
      widget.perso.classe = controllerClasse.text;
    }
    if (controllerXp.text != "") {
      widget.perso.xp = int.parse(controllerXp.text);
    }
    if (controllerXpMax.text != "") {
      widget.perso.xp_max = int.parse(controllerXpMax.text);
    }
    if (controllerPv.text != "") {
      widget.perso.pv = int.parse(controllerPv.text);
    }
    if (controllerPvMax.text != "") {
      widget.perso.pv_max = int.parse(controllerPvMax.text);
    }
    update(widget.perso);
  }

  @override
  Widget build(BuildContext context) {
    controllerNom.text = widget.perso.nom;
    controllerNiveau.text = widget.perso.niveau.toString();
    controllerClasse.text = widget.perso.classe;
    controllerRace.text = widget.perso.race;
    controllerXp.text = widget.perso.xp.toString();
    controllerXpMax.text = widget.perso.xp_max.toString();
    controllerPv.text = widget.perso.pv.toString();
    controllerPvMax.text = widget.perso.pv_max.toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.perso.nom),
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
                    controller: controllerNom,
                    decoration: const InputDecoration(
                      labelText: 'Nom',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerNiveau,
                    decoration: const InputDecoration(
                      labelText: 'Niveau',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    controller: controllerRace,
                    decoration: const InputDecoration(
                      labelText: 'Race',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    controller: controllerClasse,
                    decoration: const InputDecoration(
                      labelText: 'Classe',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerXp,
                    decoration: const InputDecoration(
                      labelText: 'xp',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerXpMax,
                    decoration: const InputDecoration(
                      labelText: 'xp max',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerPv,
                    decoration: const InputDecoration(
                      labelText: 'pv',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerPvMax,
                    decoration: const InputDecoration(
                      labelText: 'pv max',
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
