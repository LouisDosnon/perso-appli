// ignore_for_file: file_names, empty_constructor_bodies

import 'package:appli_perso/definitionPerso/equipement.dart';
import 'package:appli_perso/definitionPerso/perso.dart';
import 'package:appli_perso/equipement/equipModif.dart';
import 'package:flutter/material.dart';

class EquipList extends StatefulWidget {
  final Perso perso;

  EquipList(this.perso);

  @override
  _EquipListState createState() => _EquipListState();
}

class _EquipListState extends State<EquipList> {
  @override
  Widget build(BuildContext context) {
    List<Equip> listEquip = [
      widget.perso.equipements.getTete_int(),
      widget.perso.equipements.getTete_ext(),
      widget.perso.equipements.getTorse_int(),
      widget.perso.equipements.getTorse_ext(),
      widget.perso.equipements.getJambe_int(),
      widget.perso.equipements.getJambe_ext(),
      widget.perso.equipements.getPied_int(),
      widget.perso.equipements.getPied_ext(),
      widget.perso.equipements.getArme(),
    ];
    return ListView.builder(
      itemCount: 9,
      itemBuilder: (context, index) {
        var equip = listEquip[index];
        var str = "";
        if (index == 0) str = "tete interieur";
        if (index == 1) str = "tete exterieur";
        if (index == 2) str = "torse interieur";
        if (index == 3) str = "torse exterieur";
        if (index == 4) str = "jambe interieur";
        if (index == 5) str = "jambe exterieur";
        if (index == 6) str = "pied interieur";
        if (index == 7) str = "pied exterieur";
        if (index == 8) str = "arme";
        return Card(
          child: Row(children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(str),
                subtitle: Text(equip.nom + "(" + equip.desc + ")"),
              ),
            ),
            Row(
              children: [
                IconButton(
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
                  icon: Icon(Icons.mode_edit),
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
