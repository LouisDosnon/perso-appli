// ignore_for_file: file_names

import 'dart:convert';

import 'package:appli_perso/definitionPerso/modificateurs.dart';
import 'package:appli_perso/definitionPerso/coup_speciaux.dart';

import 'caracteristiques.dart';
import 'competence.dart';
import 'monaie.dart';
import 'inventaires.dart';
import 'equipement.dart';

class Perso {
  String id;
  String nom;
  int niveau;
  int xp_max;
  int xp;
  int pv_max;
  int pv;
  String race;
  String classe;
  Caracteristiques caracteristiques;
  Competences competences;
  Monaies monaies;
  Inventaires inventaires;
  Equipement equipements;
  Coup_speciaux coupSpeciaux;
  Modificateurs modificateurs;

  Perso(
      this.id,
    this.nom,
    this.niveau,
    this.race,
    this.classe,
    this.xp,
    this.xp_max,
    this.pv,
    this.pv_max,
    this.caracteristiques,
    this.competences,
    this.monaies,
    this.inventaires,
    this.equipements,
    this.coupSpeciaux,
    this.modificateurs,
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'niveau': niveau,
        'race': race,
        'classe': classe,
        'xp': xp,
        'xp_max': xp_max,
        'pv': pv,
        'pv_max': pv_max,
        'caracteristique': caracteristiques.toJson(),
        'competence': competences.toJson(),
        'monaie': monaies.toJson(),
        'inventaire': inventaires.toJson(),
        'equipement': equipements.toJson(),
        'coupSpeciaux': coupSpeciaux.toJson(),
        'modificateurs' : modificateurs.toJson(),
      };

  factory Perso.fromJson(Map<String, dynamic> json){
    List<dynamic>? compElems = json["competences"];
    List<dynamic>? invElems = json["inventaire"];
    List<dynamic>? autreElems = json["equipement"]["autre"];
    List<dynamic>? coupSElems = json["coup_speciaux"];
    List<dynamic>? modifElems = json["modificateurs"];

    return Perso(
      json["id"],
      json["nom"],
      json["niveau"],
      json["race"],
      json["classe"],
      json["xp"],
      json["xp_max"],
      json["pv"],
      json["pv_max"],
      Caracteristiques.fromJson(json["caracteristique"]),
      compElems != null ? Competences(compElems.map((comp) => Competence.fromJson(comp)).toList()) : Competences([]),
      Monaies.fromJson(json["monaie"]),
      invElems != null ? Inventaires(invElems.map((objInv) => ObjInv.fromJson(objInv)).toList()) : Inventaires([]),
      Equipement(
        Equip.fromJson(json["equipement"]["tete_int"]),
        Equip.fromJson(json["equipement"]["tete_ext"]),
        Equip.fromJson(json["equipement"]["torse_int"]),
        Equip.fromJson(json["equipement"]["torse_ext"]),
        Equip.fromJson(json["equipement"]["jambe_int"]),
        Equip.fromJson(json["equipement"]["jambe_ext"]),
        Equip.fromJson(json["equipement"]["pied_int"]),
        Equip.fromJson(json["equipement"]["pied_ext"]),
        Equip.fromJson(json["equipement"]["arme"]),
        autreElems != null ? autreElems.map((equip) => Equip.fromJson(equip)).toList() : []
      ),
      coupSElems != null ? Coup_speciaux(coupSElems.map((coupS) => Coup.fromJson(coupS)).toList()) : Coup_speciaux([]),
      modifElems != null ? Modificateurs(modifElems.map((modif) => Modificateur.fromJson(modif)).toList()) : Modificateurs([]),
    );
  }

  void setCaracteristiques(Caracteristiques caracteristiques) {
    caracteristiques = caracteristiques;
  }

  void setCompetences(Competences competences) {
    competences = competences;
  }

  void setMonaies(Monaies monaies) {
    monaies = monaies;
  }

  void setInventaires(Inventaires inventaires) {
    inventaires = inventaires;
  }

  void setEquipements(Equipement equipements) {
    equipements = equipements;
  }

  void setCP(Coup_speciaux cp) {
    coupSpeciaux = cp;
  }

  void setModificateurs(Modificateurs modificateurs) {
    modificateurs = modificateurs;
  }

  String getId() {
    return id;
  }

  void setId(String id) {
    id = id;
  }

  String getNom() {
    return nom;
  }

  void setNom(String nom) {
    nom = nom;
  }

  int getNiveau() {
    return niveau;
  }

  void setNiveau(int niveau) {
    niveau = niveau;
  }

  int getXp_max() {
    return xp_max;
  }

  void setXp_max(int xp_max) {
    xp_max = xp_max;
  }

  int getXp() {
    return xp;
  }

  void setXp(int xp) {
    xp = xp;
  }

  int getPv_max() {
    return pv_max;
  }

  void setPv_max(int pv_max) {
    pv_max = pv_max;
  }

  int getPv() {
    return pv;
  }

  void setPv(int pv) {
    pv = pv;
  }

  String getRace() {
    return race;
  }

  void setRace(String race) {
    race = race;
  }

  String getClasse() {
    return classe;
  }

  void setClasse(String classe) {
    classe = classe;
  }

  Caracteristiques getCaracteristiques() {
    return caracteristiques;
  }

  Competences getCompetences() {
    return competences;
  }

  Monaies getMonaies() {
    return monaies;
  }

  Inventaires getInventaires() {
    return inventaires;
  }

  Equipement getEquipements() {
    return equipements;
  }

  Coup_speciaux getCP(){
    return this.coupSpeciaux;
  }

  Modificateurs getModificateurs(){
    return this.modificateurs;
  }

  @override
  String toString() {
    return "Perso{" +
        "nom='" +
        nom.toString() +
        '\'' +
        ", niveau=" +
        niveau.toString() +
        ", xp_max=" +
        xp_max.toString() +
        ", xp=" +
        xp.toString() +
        ", race='" +
        race +
        '\'' +
        ", classe='" +
        classe +
        '\'' +
        ", caracteristiques=" +
        caracteristiques.toString() +
        ", competences=" +
        competences.toString() +
        ", monaies=" +
        monaies.toString() +
        ", inventaires=" +
        inventaires.toString() +
        ", equipements=" +
        equipements.toString() +
        ", coup speciaux=" +
        coupSpeciaux.toString() +
        ", modificateurs=" +
        modificateurs.toString() +
        '}';
  }
}
