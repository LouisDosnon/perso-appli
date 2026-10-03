import 'dart:convert';

class Caracteristiques {
  int charisme;
  int adresse;
  int intelligence;
  int force;
  int energieAstral;
  int energieAstralMax;
  int attaque;
  int parade;
  int destin;
  int courage;

  Caracteristiques(
    this.charisme,
    this.courage,
    this.adresse,
    this.intelligence,
    this.force,
    this.energieAstral,
    this.energieAstralMax,
    this.attaque,
    this.parade,
    this.destin,
  );

  Map<String, dynamic> toJson() => {
        'charisme': charisme,
        'courage': courage,
        'adresse': adresse,
        'intelligence': intelligence,
        'force': force,
        'energie_astrale': energieAstral,
        'energie_astrale_max': energieAstralMax,
        'attaque': attaque,
        'parade': parade,
        'destin': destin,
      };

  factory Caracteristiques.fromJson(Map<String, dynamic> json) {
    return Caracteristiques(
        json["charisme"],
        json["courage"],
        json["adresse"],
        json["intelligence"],
        json["force"],
        json["energie_astrale"],
        json["energie_astrale_max"],
        json["attaque"],
        json["parade"],
        json["destin"]
    );
  }

  int getCharisme() {
    return charisme;
  }

  void setCharisme(int charisme) {
    this.charisme = charisme;
  }

  int getAdresse() {
    return adresse;
  }

  void setAdresse(int adresse) {
    this.adresse = adresse;
  }

  int getIntelligence() {
    return intelligence;
  }

  void setIntelligence(int intelligence) {
    this.intelligence = intelligence;
  }

  int getForce() {
    return force;
  }

  void setForce(int force) {
    this.force = force;
  }

  int getResistanceMagique() {
    return energieAstral;
  }

  void setResistanceMagique(int energieAstral) {
    this.energieAstral = energieAstral;
  }

  int getAttaque() {
    return attaque;
  }

  void setAttaque(int attaque) {
    this.attaque = attaque;
  }

  int getParade() {
    return parade;
  }

  void setParade(int parade) {
    this.parade = parade;
  }

  int getDestin() {
    return destin;
  }

  void setDestin(int destin) {
    this.destin = destin;
  }

  int getCourage() {
    return courage;
  }

  void setCourage(int courage) {
    this.courage = courage;
  }

  @override
  String toString() {
    return "Competence{" +
        "charisme=" +
        charisme.toString() +
        ", adresse=" +
        adresse.toString() +
        ", intelligence=" +
        intelligence.toString() +
        ", force=" +
        force.toString() +
        ", energie astrale=" +
        energieAstral.toString() +
        ", attaque=" +
        attaque.toString() +
        ", parade=" +
        parade.toString() +
        ", destin=" +
        destin.toString() +
        ", courage=" +
        courage.toString() +
        '}';
  }
}
