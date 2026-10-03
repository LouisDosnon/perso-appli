// ignore_for_file: unnecessary_this

class ObjInv {
  String nom;
  String desc;

  ObjInv(
    this.nom,
    this.desc,
  );

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'desc': desc,
      };

  factory ObjInv.fromJson(Map<String, dynamic> json) {
    return ObjInv(
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

class Inventaires {
  List<ObjInv> listObjInv;

  Inventaires(this.listObjInv);

  void addObj(ObjInv obj) {
    listObjInv.add(obj);
  }

  void removeComp(ObjInv obj) {
    listObjInv.remove(obj);
  }

  void modifComp(ObjInv obj, String n, String d) {
    int id = listObjInv.indexOf(obj);
    listObjInv.remove(obj);
    listObjInv.add(ObjInv(n, d));
  }

  List<ObjInv> getList_Obj_Inv() {
    return listObjInv;
  }

  Map<String, dynamic> toJson() {
    var objTab = [];
    listObjInv.forEach((element) {
      objTab.add(element.toJson());
    });

    return {
      'listObj': objTab,
    };
  }

  @override
  String toString() {
    return "Inventaires{list_Obj_Inv=" + listObjInv.toString() + '}';
  }
}
