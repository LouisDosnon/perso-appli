// ignore_for_file: file_names, empty_constructor_bodies
import 'package:appli_perso/modificateurs/modificateurPerso.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'coupSpeciaux/CPPerso.dart';
import 'pstList.dart';
import 'caracteristique/caracPerso.dart';
import 'competence/compPerso.dart';
import 'monaie/monaiePerso.dart';
import 'equipement/equipPerso.dart';
import 'inventaire/invPerso.dart';
import 'pstPersoModif.dart';
import 'definitionPerso/perso.dart';

class PstPerso extends StatefulWidget {
  final Perso perso;
  String token;

  PstPerso(this.perso, this.token);

  @override
  _PstPersoState createState() => _PstPersoState();
}

class _PstPersoState extends State<PstPerso> {
  final String _url = 'https://drive.google.com/drive/folders/1CYzzMHcfktuqojg_5CbRUxEH6aoeui-j?usp=sharing';

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> stat = {
      "id" : widget.perso.id,
      "nom" : widget.perso.nom,
      "niveau" : widget.perso.niveau.toString(),
      "race" : widget.perso.race,
      "classe" : widget.perso.classe,
      "xp" : widget.perso.xp.toString() + "/" + widget.perso.xp_max.toString(),
      "pv" : widget.perso.pv.toString() + "/" + widget.perso.pv_max.toString(),
    };

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
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PstList(stat),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Home'),
            ),
            ListTile(
              title: const Text('Caracteristique'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CaracPerso(widget.perso.id, widget.perso.getCaracteristiques(), widget.token)));
              },
            ),
            ListTile(
              title: const Text('Competence'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompPerso(widget.perso)));
              },
            ),
            ListTile(
              title: const Text('Monaie'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MonaiePerso(widget.perso)));
              },
            ),
            ListTile(
              title: const Text('Equipement'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EquipPerso(widget.perso)));
              },
            ),
            ListTile(
              title: const Text('Inventaire'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InvPerso(widget.perso)));
              },
            ),
            ListTile(
              title: const Text('Coup Speciaux'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CPPerso(widget.perso)));
              },
            ),
            ListTile(
              title: const Text('Modificateurs'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ModificateurPerso(widget.perso)));
              },
            ),
            ListTile(
              title: const Text('lien drive'),
              onTap: () {
                _launchURL();
              },
            )
          ],
        ),
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
                      PstPersoModif(widget.perso),
              ),
          ).then((value) => {
                    setState(() {}),
          }),
        },
      ),
    );
  }
}

class _caracteristique extends StatelessWidget {
  final Perso perso;

  _caracteristique(this.perso);

  @override
  Widget build(BuildContext context) {
    Map<String, String> stat = {
      "nom" : perso.nom,
      "niveau" : perso.niveau.toString(),
      "race" : perso.race,
      "classe" : perso.classe,
      "xp" : perso.xp.toString() + "/" + perso.xp_max.toString(),
      "pv" : perso.pv.toString() + "/" + perso.pv_max.toString(),
    };

    return Expanded(
      child: PstList(stat),
    );
  }
}
