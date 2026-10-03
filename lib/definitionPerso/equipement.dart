import 'dart:convert';
// ignore_for_file: file_names, non_constant_identifier_names

class Equip {
  String nom;
  String desc;

  Equip(
    this.nom,
    this.desc,
  );

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'desc': desc,
      };

  factory Equip.fromJson(Map<String, dynamic> json) {
    return Equip(
      json["nom"],
      json["desc"]
    );
  }
  String getNom() {
    return nom;
  }

  void setNom(String nom) {
    this.nom = nom;
  }

  String getDesc() {
    return desc;
  }

  void setDesc(String desc) {
    this.desc = desc;
  }

  @override
  String toString() {
    // ignore: unnecessary_this
    return this.nom + "(" + this.desc + ")";
  }
}

class Equipement {
  Equip tete_int;
  Equip tete_ext;
  Equip torse_int;
  Equip torse_ext;
  Equip jambe_int;
  Equip jambe_ext;
  Equip pied_int;
  Equip pied_ext;
  Equip arme;
  List<Equip> autre;

  Equipement(
    this.tete_int,
    this.tete_ext,
    this.torse_int,
    this.torse_ext,
    this.jambe_int,
    this.jambe_ext,
    this.pied_int,
    this.pied_ext,
    this.arme,
    this.autre,
  );

  Map<String, dynamic> toJson() {
    var autreTab = [];
    autre.forEach((element) {
      autreTab.add(element.toJson());
    });

    return {
      'tete_int': tete_int.toJson(),
      'tete_ext': tete_ext.toJson(),
      'torse_int': torse_int.toJson(),
      'torse_ext': torse_ext.toJson(),
      'jambe_int': jambe_int.toJson(),
      'jambe_ext': jambe_ext.toJson(),
      'pied_int': pied_int.toJson(),
      'pied_ext': pied_ext.toJson(),
      'arme': arme.toJson(),
      'autre': autreTab,
    };
  }

  Equip getTete_int() {
    return tete_int;
  }

  void setTete_int(Equip teteInt) {
    this.tete_int = teteInt;
  }

  Equip getTete_ext() {
    return tete_ext;
  }

  void setTete_ext(Equip teteExt) {
    this.tete_ext = teteExt;
  }

  Equip getTorse_int() {
    return torse_int;
  }

  void setTorse_int(Equip torseInt) {
    this.torse_int = torseInt;
  }

  Equip getTorse_ext() {
    return torse_ext;
  }

  void setTorse_ext(Equip torseExt) {
    this.torse_ext = torseExt;
  }

  Equip getJambe_int() {
    return jambe_int;
  }

  void setJambe_int(Equip jambeInt) {
    this.jambe_int = jambeInt;
  }

  Equip getJambe_ext() {
    return jambe_ext;
  }

  void setJambe_ext(Equip jambeExt) {
    this.jambe_ext = jambeExt;
  }

  Equip getPied_int() {
    return pied_int;
  }

  void setPied_int(Equip piedInt) {
    this.pied_int = piedInt;
  }

  Equip getPied_ext() {
    return pied_ext;
  }

  void setPied_ext(Equip piedExt) {
    this.pied_ext = piedExt;
  }

  Equip getArme() {
    return arme;
  }

  void setArme(Equip arme) {
    this.arme = arme;
  }

  void addAutre(Equip equip) {
    autre.add(equip);
  }

  void removeAutre(Equip equip) {
    autre.remove(equip);
  }

  void modifAutre(Equip equip, String n, String d) {
    int id = autre.indexOf(equip);
    autre.remove(equip);
    autre.add(Equip(n, d));
  }

  List<Equip> getAutre() {
    return autre;
  }

  @override
  String toString() {
    return "Equipements{" +
        "tete_int=" +
        tete_int.toString() +
        ", tete_ext=" +
        tete_ext.toString() +
        ", torse_int=" +
        torse_int.toString() +
        ", torse_ext=" +
        torse_ext.toString() +
        ", jambe_int=" +
        jambe_int.toString() +
        ", jambe_ext=" +
        jambe_ext.toString() +
        ", pied_int=" +
        pied_int.toString() +
        ", pied_ext=" +
        pied_ext.toString() +
        ", arme=" +
        arme.toString() +
        ", autre=" +
        autre.toString() +
        '}';
  }
}
