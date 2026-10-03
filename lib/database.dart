// ignore: import_of_legacy_library_into_null_safe

import 'package:appli_perso/definitionPerso/caracteristiques.dart';
import 'package:appli_perso/definitionPerso/competence.dart';
import 'package:appli_perso/definitionPerso/coup_speciaux.dart';
import 'package:appli_perso/definitionPerso/equipement.dart';
import 'package:appli_perso/definitionPerso/inventaires.dart';
import 'package:appli_perso/definitionPerso/modificateurs.dart';
import 'package:appli_perso/definitionPerso/monaie.dart';
import 'definitionPerso/perso.dart';
import 'package:flutter/foundation.dart';


void savePerso(Perso perso, String user) {
  debugPrint("ajout en cour...");
}

void update(Perso perso) {
  debugPrint("update");
}

void delete(Perso perso) {
  debugPrint("delete");
}

Future<List<Perso>> getAllPerso(String user) async {
  Map? val = new Map();
  List<Perso> persos = [];
  if (val != null) {
    val.forEach((key, value) {

      List<Equip> autre = [];
      if (value['equipement']!=null) {
        if (value['equipement']['autre'] != null) {
          value['equipement']['autre'].forEach((element) {
            autre.add(Equip(element['nom'], element['desc']));
          });
        }
      }

      List<Competence> comp = [];

      if (value['competence']!=null) {
        if (value['competence']['listObj'] != null) {
          value['competence']['listObj'].forEach((element) {
            comp.add(Competence(element['nom'], element['desc']));
          });
        }
      }

      List<ObjInv> inv = [];

      if (value['inventaire']!=null) {
        if (value['inventaire']['listObj'] != null) {
          value['inventaire']['listObj'].forEach((element) {
            inv.add(ObjInv(element['nom'], element['desc']));
          });
        }
      }

      List<Coup> coup = [];
      if (value['coupSpeciaux']!=null) {
        if (value['coupSpeciaux']['listCoup'] != null) {
          value['coupSpeciaux']['listCoup'].forEach((element) {
            coup.add(Coup(element['nom'], element['desc']));
          });
        }
      }

      List<Modificateur> modificateur = [];
      if (value['modificateurs']!=null) {
        if (value['modificateurs']['listModif'] != null) {
          value['modificateurs']['listModif'].forEach((element) {
            modificateur.add(Modificateur(element['attribut'], element['desc'], element['difference']));
          });
        }
      }


      Perso perso = Perso(
        value['id'],
        value['nom'],
        value['niveau'],
        value['race'],
        value['classe'],
        value['xp'],
        value['xp_max'],
        value['pv'],
        value['pv_max'],
        Caracteristiques(
            value['caracteristique']['charisme'],
            value['caracteristique']['courage'],
            value['caracteristique']['adresse'],
            value['caracteristique']['intelligence'],
            value['caracteristique']['force'],
            value['caracteristique']['energie_astrale'],
            value['caracteristique']['energie_astrale_max'],
            value['caracteristique']['attaque'],
            value['caracteristique']['parade'],
            value['caracteristique']['destin']),
        Competences(comp),
        Monaies(value['monaie']['or'], value['monaie']['argent'],
            value['monaie']['bronze']),
        Inventaires(inv),
        Equipement(
            //tete
            Equip(value['equipement']['tete_int']['nom'],
                value['equipement']['tete_int']['desc']),
            Equip(value['equipement']['tete_ext']['nom'],
                value['equipement']['tete_ext']['desc']),
            //torse
            Equip(value['equipement']['torse_int']['nom'],
                value['equipement']['torse_int']['desc']),
            Equip(value['equipement']['torse_ext']['nom'],
                value['equipement']['tete_ext']['desc']),
            //jambe
            Equip(value['equipement']['jambe_int']['nom'],
                value['equipement']['jambe_int']['desc']),
            Equip(value['equipement']['jambe_ext']['nom'],
                value['equipement']['jambe_ext']['desc']),
            //main
            Equip(value['equipement']['pied_int']['nom'],
                value['equipement']['pied_int']['desc']),
            Equip(value['equipement']['pied_ext']['nom'],
                value['equipement']['pied_ext']['desc']),
            //arme
            Equip(value['equipement']['arme']['nom'],
                value['equipement']['arme']['desc']),
            autre),
        Coup_speciaux(coup),
        Modificateurs(modificateur),
      );
      persos.add(perso);
      persos.sort((a, b) => b.getNom().compareTo(a.getNom()));
    });
  }
  return persos;
}
