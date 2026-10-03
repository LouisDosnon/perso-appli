// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/competence.dart';
import 'package:flutter/material.dart';
import 'compList.dart';
import '../definitionPerso/perso.dart';
import 'compModif.dart';

class CompPerso extends StatefulWidget {
  final Perso perso;

  CompPerso(this.perso);

  @override
  _CompPersoState createState() => _CompPersoState();
}

class _CompPersoState extends State<CompPerso> {
  Competence add(){
    var comp = Competence("", "");
    widget.perso.competences.listComp.add(comp);
    return comp;
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
            child: Column(
              children: <Widget>[
                Expanded(
                  child: CompList(widget.perso),
                )
              ],
            ),
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
                CompModif(widget.perso, widget.perso.competences.getListComp().indexOf(add())),
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
