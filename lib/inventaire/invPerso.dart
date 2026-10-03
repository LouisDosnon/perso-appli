// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/inventaires.dart';
import 'package:flutter/material.dart';
import 'invList.dart';
import '../definitionPerso/perso.dart';
import 'invModif.dart';

class InvPerso extends StatefulWidget {
  final Perso perso;

  InvPerso(this.perso);

  @override
  _InvPersoState createState() => _InvPersoState();
}

class _InvPersoState extends State<InvPerso> {
  ObjInv add(){
    ObjInv obj = ObjInv("", "");
    widget.perso.inventaires.listObjInv.add(obj);
    return obj;
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
                  child: InvList(widget.perso, widget.perso.inventaires.getList_Obj_Inv()),
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
                InvModif(widget.perso, add()),
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












