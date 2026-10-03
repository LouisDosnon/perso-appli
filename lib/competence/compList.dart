// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/competence.dart';
import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:flutter/material.dart';

import '../database.dart';
import 'compModif.dart';

class CompList extends StatefulWidget {
  final Perso perso;

  CompList(this.perso);

  @override
  _CompListState createState() => _CompListState();
}

class _CompListState extends State<CompList> {
  Future<void> remove(comp, listComp){
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('supprimez la compétence ?',
              style: TextStyle(color: Colors.red,),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  listComp.remove(comp);
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
    List<Competence> listComp = widget.perso.getCompetences().getListComp();
    return ListView.builder(
      itemCount: listComp.length,
      itemBuilder: (context, index) {
        var comp = listComp[index];
        return Card(
          child: Row(children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text(comp.nom),
              subtitle: Text(comp.desc),
            )),
            Row(
              children: [
                IconButton(
                  onPressed: () => {
                    remove(comp, listComp),
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          CompModif(widget.perso, index),
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
