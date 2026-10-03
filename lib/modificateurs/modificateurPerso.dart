// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/competence.dart';
import 'package:appli_perso/definitionPerso/modificateurs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'modificateurList.dart';
import '../definitionPerso/perso.dart';
import 'modificateurModif.dart';

class ModificateurPerso extends StatefulWidget {
  final Perso perso;

  ModificateurPerso(this.perso);

  @override
  _ModificateurPersoState createState() => _ModificateurPersoState();
}

class _ModificateurPersoState extends State<ModificateurPerso> {
  Modificateur add(){
    var modif = Modificateur("", "", 0);
    widget.perso.modificateurs.getlistModif().add(modif);
    return modif;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.perso.nom),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Icon(
                Icons.repeat,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ModificateurList(widget.perso),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                ModificateurModif(widget.perso, widget.perso.modificateurs.getlistModif().indexOf(add())),
            ),
          ).then((value) => {
            setState(() {}),
          }),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
