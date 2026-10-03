// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/coup_speciaux.dart';
import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:flutter/material.dart';

import 'CPModif.dart';

class CPList extends StatefulWidget {
  final Perso perso;
  final List<Coup> list;

  CPList(this.perso, this.list);

  @override
  _CPListState createState() => _CPListState();
}

class _CPListState extends State<CPList> {
  Future<void> remove(obj){
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('supprimez l\'objet ?',
              style: TextStyle(color: Colors.red,),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  widget.list.remove(obj);
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
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        var coup = widget.list[index];
        return Card(
          child: Row(children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(coup.nom),
                subtitle: Text(coup.desc),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => {
                    remove(coup),
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          CPModif(widget.perso, coup),
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
