// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/equipement.dart';
import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:appli_perso/equipement/equipModif.dart';
import 'package:flutter/material.dart';

class AutreList extends StatefulWidget {
  final Perso perso;
  final List<Equip> listEquip;

  AutreList(this.perso, this.listEquip);

  @override
  _AutreListState createState() => _AutreListState();
}

class _AutreListState extends State<AutreList> {
  Future<void> remove(equip){
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('supprimez l\'équipement ?',
              style: TextStyle(color: Colors.red,),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  widget.listEquip.remove(equip);
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
      itemCount: widget.listEquip.length,
      itemBuilder: (context, index) {
        var equip = widget.listEquip[index];
        return Card(
          child: Row(children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(equip.nom),
                subtitle: Text(equip.desc),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () =>{
                    remove(equip),
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
                IconButton(
                  icon: const Icon(Icons.login),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EquipModif(widget.perso, equip),
                      ),
                    ).then((value) => {
                      setState(() {}),
                    }),
                  },
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
