import 'dart:convert';

class Modificateur {
  String attribut;
  String desc;
  int difference;

  Modificateur(
      this.attribut,
      this.desc,
      this.difference,
      );
  Map<String, dynamic> toJson() => {
    'attribut': attribut,
    'desc': desc,
    'difference' : difference,
  };

  factory Modificateur.fromJson(Map<String, dynamic> jsonData) {
    return Modificateur(
      jsonData['attribut'],
      jsonData['desc'],
      jsonData['difference']
    );
  }

  String getAttribut() {
    return attribut;
  }

  void setAttribut(String attribut) {
    this.attribut = attribut;
  }

  String getDesc() {
    return desc;
  }

  void setDesc(String desc) {
    this.desc = desc;
  }

  int getDifference() {
    return difference;
  }

  void setDifference(int difference) {
    this.difference = difference;
  }

  @override
  String toString() {
    return attribut + "(" + desc + ")";
  }
}

class Modificateurs {
  List<Modificateur> listModif;

  Modificateurs(
      this.listModif,
      );

  Map<String, dynamic> toJson() {
    var compTab = [];
    listModif.forEach((element) {
      compTab.add(element.toJson());
    });

    return {
      'listModif': compTab,
    };
  }

  void addComp(Modificateur comp) {
    listModif.add(comp);
  }

  void removeComp(Modificateur comp) {
    listModif.remove(comp);
  }

  void modifComp(Modificateur comp, String n, String desc, int diff) {
    int id = listModif.indexOf(comp);
    listModif.remove(comp);
    listModif.add(Modificateur(n, desc, diff));
  }

  List<Modificateur> getlistModif() {
    return listModif;
  }

  @override
  String toString() {
    return "Modificateurs{list_modif=" + listModif.toString() + '}';
  }
}
