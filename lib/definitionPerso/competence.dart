import 'dart:convert';

class Competence {
  String nom;
  String desc;

  Competence(
    this.nom,
    this.desc,
  );
  Map<String, dynamic> toJson() => {
        'nom': nom,
        'desc': desc,
      };

  factory Competence.fromJson(Map<String, dynamic> jsonData) {
    return Competence(
      jsonData['nom'],
      jsonData['desc'],
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
    return nom + "(" + desc + ")";
  }
}

class Competences {
  List<Competence> listComp;

  Competences(
    this.listComp,
  );

  Map<String, dynamic> toJson() {
    var compTab = [];
    listComp.forEach((element) {
      compTab.add(element.toJson());
    });

    return {
      'listObj': compTab,
    };
  }

  void addComp(Competence comp) {
    listComp.add(comp);
  }

  void removeComp(Competence comp) {
    listComp.remove(comp);
  }

  void modifComp(Competence comp, String n, String d) {
    int id = listComp.indexOf(comp);
    listComp.remove(comp);
    listComp.add(Competence(n, d));
  }

  List<Competence> getListComp() {
    return listComp;
  }

  @override
  String toString() {
    return "Competences{list_comp=" + listComp.toString() + '}';
  }
}
