// ignore_for_file: unnecessary_this

class Coup {
  String nom;
  String desc;

  Coup(
    this.nom,
    this.desc,
  );

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'desc': desc,
      };

  factory Coup.fromJson(Map<String, dynamic> json) {
    return Coup(
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
    return this.nom + "(" + this.desc + ")";
  }
}

class Coup_speciaux {
  List<Coup> listCoup;

  Coup_speciaux(this.listCoup);

  void addObj(Coup obj) {
    listCoup.add(obj);
  }

  void removeComp(Coup obj) {
    listCoup.remove(obj);
  }

  void modifComp(Coup obj, String n, String d) {
    int id = listCoup.indexOf(obj);
    listCoup.remove(obj);
    listCoup.add(Coup(n, d));
  }

  List<Coup> getList_Coup() {
    return listCoup;
  }

  Map<String, dynamic> toJson() {
    var coupTab = [];
    listCoup.forEach((element) {
      coupTab.add(element.toJson());
    });

    return {
      'listCoup': coupTab,
    };
  }

  @override
  String toString() {
    return "Coup_speciaux{list_Coup=" + listCoup.toString() + '}';
  }

}
