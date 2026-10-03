// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/competence.dart';
import 'package:appli_perso/definitionPerso/inventaires.dart';
import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:flutter/material.dart';

import '../database.dart';

class InvModif extends StatefulWidget {
  final Perso perso;
  final ObjInv objInv;

  InvModif(this.perso, this.objInv);

  @override
  _InvModifState createState() => _InvModifState();
}

class _InvModifState extends State<InvModif> {
  String name = "";
  TextEditingController controllerNom = new TextEditingController();
  TextEditingController controllerDesc = new TextEditingController();

  modif() {
    if (controllerNom.text != "") {
      widget.objInv.nom = controllerNom.text;
    }
    if (controllerDesc.text != "") {
      widget.objInv.desc = controllerDesc.text;
    }
    update(widget.perso);
  }

  @override
  Widget build(BuildContext context) {
    controllerNom.text = widget.objInv.nom;
    controllerDesc.text = widget.objInv.desc;
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
