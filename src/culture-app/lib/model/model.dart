class Model {
  int? id;
  String? name;
  String? desc;
  String? tarian;
  String? pakaian;
  String? rumah;
  String? senjata;

  Model(this.id, this.name, this.desc, this.tarian, this.pakaian, this.rumah,
      this.senjata);

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    tarian = json['tarian'];
    pakaian = json['pakaian'];
    rumah = json['rumah'];
    senjata = json['senjata'];
  }
}
