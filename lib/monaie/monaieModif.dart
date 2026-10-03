// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/monaie.dart';
import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../database.dart';

class MonaieModif extends StatefulWidget {
  final Perso perso;
  final Monaies monaie;

  MonaieModif(this.perso, this.monaie);

  @override
  _MonaieModifState createState() => _MonaieModifState();
}

class _MonaieModifState extends State<MonaieModif> {
  String name = "";
  TextEditingController controllerOr = new TextEditingController();
  TextEditingController controllerArgent = new TextEditingController();
  TextEditingController controllerBronze = new TextEditingController();

  modif() {
    if (controllerOr.text != "") {
      widget.monaie.or = int.parse(controllerOr.text);
    }
    if (controllerArgent.text != "") {
      widget.monaie.argent = int.parse(controllerArgent.text);
    }
    if (controllerBronze.text != "") {
      widget.monaie.bronze = int.parse(controllerBronze.text);
    }
    update(widget.perso);
  }

  @override
  Widget build(BuildContext context) {
    controllerOr.text = widget.monaie.or.toString();
    controllerArgent.text = widget.monaie.argent.toString();
    controllerBronze.text = widget.monaie.bronze.toString();
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
                    keyboardType: TextInputType.number,
                    controller: controllerOr,
                    decoration: const InputDecoration(
                      labelText: 'Or',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerArgent,
                    decoration: const InputDecoration(
                      labelText: 'Argent',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerBronze,
                    decoration: const InputDecoration(
                      labelText: 'Bronze',
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
