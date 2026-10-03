// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/coup_speciaux.dart';
import 'package:flutter/material.dart';
import 'CPList.dart';
import '../definitionPerso/perso.dart';
import 'CPModif.dart';

class CPPerso extends StatefulWidget {
  final Perso perso;

  CPPerso(this.perso);

  @override
  _CPPersoState createState() => _CPPersoState();
}

class _CPPersoState extends State<CPPerso> {
  Coup add(){
    var coup = Coup("", "");
    widget.perso.getCP().getList_Coup().add(coup);
    return coup;
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
                  child: CPList(widget.perso, widget.perso.getCP().getList_Coup()),
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
                CPModif(widget.perso, add()),
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












