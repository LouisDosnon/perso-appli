// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:flutter/material.dart';

import '../database.dart';

class ModificateurModif extends StatefulWidget {
  final Perso perso;
  final int index;

  ModificateurModif(this.perso, this.index);

  @override
  _ModificateurModifState createState() => _ModificateurModifState();
}

class _ModificateurModifState extends State<ModificateurModif> {
  String name = "";
  TextEditingController controllerAttribut = new TextEditingController();
  TextEditingController controllerDesc = new TextEditingController();
  TextEditingController controllerDiff = new TextEditingController();

  modif() {
    if (controllerAttribut.text != "") {
      widget.perso.getModificateurs().getlistModif()[widget.index].attribut = controllerAttribut.text;
    }
    if (controllerDesc.text != "") {
      widget.perso.getModificateurs().getlistModif()[widget.index].desc = controllerDesc.text;
    }
    if (controllerDesc.text != "") {
      widget.perso.getModificateurs().getlistModif()[widget.index].difference = int.parse(controllerDiff.text);
    }
    update(widget.perso);
  }

  @override
  Widget build(BuildContext context) {
    controllerAttribut.text = widget.perso.getModificateurs().getlistModif()[widget.index].attribut;
    controllerDesc.text = widget.perso.getModificateurs().getlistModif()[widget.index].desc;
    controllerDiff.text = widget.perso.getModificateurs().getlistModif()[widget.index].difference.toString();
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
                    controller: controllerAttribut,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    controller: controllerDiff,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    keyboardType: TextInputType.number,
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
