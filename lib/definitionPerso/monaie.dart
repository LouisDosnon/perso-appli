import 'dart:convert';

class Monaies {
  int or;
  int argent;
  int bronze;

  Monaies(
    this.or,
    this.argent,
    this.bronze,
  );

  Map<String, dynamic> toJson() => {
        'or': or,
        'argent': argent,
        'bronze': bronze,
      };

  factory Monaies.fromJson(Map<String, dynamic> json) {
    return Monaies(
        json["or"],
        json["argent"],
        json["bronze"]
    );
  }
  int getOr() {
    return or;
  }

  void setOr(int or) {
    this.or = or;
  }

  int getArgent() {
    return argent;
  }

  void setArgent(int argent) {
    this.argent = argent;
  }

  int getBronze() {
    return bronze;
  }

  void setBronze(int bronze) {
    this.bronze = bronze;
  }

  @override
  String toString() {
    return "Monaies{or=" +
        or.toString() +
        ", argent=" +
        argent.toString() +
        ", bronze=" +
        bronze.toString() +
        '}';
  }
}
