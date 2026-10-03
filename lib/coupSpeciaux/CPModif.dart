// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/coup_speciaux.dart';
import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:flutter/material.dart';

import '../database.dart';

class CPModif extends StatefulWidget {
  final Perso perso;
  final Coup coup;

  CPModif(this.perso, this.coup);

  @override
  _CPModifState createState() => _CPModifState();
}

class _CPModifState extends State<CPModif> {
  String name = "";
  TextEditingController controllerNom = new TextEditingController();
  TextEditingController controllerDesc = new TextEditingController();

  modif() {
    if (controllerNom.text != "") {
      widget.coup.nom = controllerNom.text;
    }
    if (controllerDesc.text != "") {
      widget.coup.desc = controllerDesc.text;
    }
    update(widget.perso);
  }

  @override
  Widget build(BuildContext context) {
    controllerNom.text = widget.coup.nom;
    controllerDesc.text = widget.coup.desc;
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
                    controller: controllerDesc,
                    decoration: const InputDecoration(
                      labelText: 'Description',
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
