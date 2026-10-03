// ignore_for_file: file_names, empty_constructor_bodies

import 'package:flutter/material.dart';
import 'monaieList.dart';
import '../definitionPerso/perso.dart';
import 'monaieModif.dart';

class MonaiePerso extends StatefulWidget {
  final Perso perso;

  MonaiePerso(this.perso);

  @override
  _MonaiePersoState createState() => _MonaiePersoState();
}

class _MonaiePersoState extends State<MonaiePerso> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> map = {
      "or" : widget.perso.monaies.or.toString(),
      "argent" : widget.perso.monaies.argent.toString(),
      "bronze" : widget.perso.monaies.bronze.toString(),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.perso.nom),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MonaieList(map),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MonaieModif(widget.perso, widget.perso.monaies),
            ),
          ).then((value) => {
            setState(() {}),
          }),
        },
      ),
    );
  }
}
