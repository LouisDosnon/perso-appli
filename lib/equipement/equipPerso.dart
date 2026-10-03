// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/equipement.dart';
import 'package:flutter/material.dart';
import 'equipList.dart';
import 'autreList.dart';
import '../definitionPerso/perso.dart';
import 'equipModif.dart';

class EquipPerso extends StatefulWidget {
  final Perso perso;

  EquipPerso(this.perso);

  @override
  _EquipPersoState createState() => _EquipPersoState();
}

class _EquipPersoState extends State<EquipPerso> {
  Equip add(){
    Equip equip = Equip("", "");
    widget.perso.equipements.autre.add(Equip("", ""));
    return equip;
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
                  child: EquipList(widget.perso),
                ),
                Expanded(
                  child: AutreList(widget.perso, widget.perso.equipements.getAutre()),
                ),
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
                EquipModif(widget.perso, add()),
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
