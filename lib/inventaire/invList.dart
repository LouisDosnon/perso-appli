// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/database.dart';
import 'package:appli_perso/definitionPerso/inventaires.dart';
import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:flutter/material.dart';

import 'invModif.dart';

class InvList extends StatefulWidget {
  final Perso perso;
  final List<ObjInv> list;

  InvList(this.perso, this.list);

  @override
  _InvListState createState() => _InvListState();
}

class _InvListState extends State<InvList> {
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
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        var objInv = widget.list[index];
        return Card(
          child: Row(children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(objInv.nom),
                subtitle: Text(objInv.desc),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => {
                    remove(objInv),
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          InvModif(widget.perso, objInv),
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
