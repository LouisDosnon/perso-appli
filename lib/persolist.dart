// ignore_for_file: file_names

import 'package:appli_perso/database.dart';
import 'package:appli_perso/pstPerso.dart';
import 'package:flutter/material.dart';
import 'definitionPerso/perso.dart';

class PersoList extends StatefulWidget {
  final List<Perso> listPersos;
  String token;

  PersoList(this.listPersos, this.token);

  @override
  _PersoListState createState() => _PersoListState();
}

class _PersoListState extends State<PersoList> {
  void onClick(perso) {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PstPerso(perso, widget.token)));
    });
  }

  Future<void> remove(perso){
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('supprimez le personage ?',
            style: TextStyle(color: Colors.red,),
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.listPersos.remove(perso);
                delete(perso);
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text(
                'supprimer',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('annuler'),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listPersos.length,
      itemBuilder: (context, index) {
        var perso = widget.listPersos[index];
        return Card(
          child: Row(children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text(perso.nom),
              subtitle: Text(perso.race + " " + perso.classe),
            )),
            IconButton(
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              onPressed: () => {
                remove(perso),
              },
            ),
            IconButton(
              icon: const Icon(Icons.login),
              onPressed: () => {
                onClick(perso),
              },
            ),
          ]),
        );
      },
    );
  }
}
