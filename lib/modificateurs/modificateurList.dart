// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/competence.dart';
import 'package:appli_perso/definitionPerso/modificateurs.dart';
import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:flutter/material.dart';

import '../database.dart';
import 'modificateurModif.dart';

class ModificateurList extends StatefulWidget {
  final Perso perso;

  ModificateurList(this.perso);

  @override
  _ModificateurListState createState() => _ModificateurListState();
}

class _ModificateurListState extends State<ModificateurList> {
  Future<void> remove(modif, listModif){
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('supprimez le modificateur ?',
              style: TextStyle(color: Colors.red,),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  listModif.remove(modif);
                  setState(() {});
                  update(widget.perso);
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
    List<Modificateur> listModif = widget.perso.getModificateurs().getlistModif();
    return ListView.builder(
      itemCount: listModif.length,
      itemBuilder: (context, index) {
        var modif = listModif[index];
        return Card(
          child: Row(children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text(modif.attribut + " : " + modif.difference.toString()),
              subtitle: Text(modif.desc),
            )),
            Row(
              children: [
                IconButton(
                  onPressed: () => {
                    remove(modif, listModif),
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          ModificateurModif(widget.perso, index),
                      ),
                    ).then((value) => {
                      setState(() {}),
                    }),
                  },
                  icon: Icon(Icons.mode_edit),
                ),
              ],
            )
          ]),
        );
      },
    );
  }
}
