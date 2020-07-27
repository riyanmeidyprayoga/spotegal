import 'dart:convert';

List<ModelTempat> modelTempatFromJson(String str) => new List<ModelTempat>.from(
    json.decode(str).map((x) => ModelTempat.fromJson(x)));

String modelTempatToJson(List<ModelTempat> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ModelTempat {
  String idTempat;
  String nmTempat;
  String tktTempat;
  String lokTempat;
  String desTempat;
  String imgTempat;
  double latTempat;
  double longTempat;
  String tglTempat;

  ModelTempat({
    this.idTempat,
    this.nmTempat,
    this.tktTempat,
    this.lokTempat,
    this.desTempat,
    this.imgTempat,
    this.latTempat,
    this.longTempat,
    this.tglTempat,
  });

  factory ModelTempat.fromJson(Map<String, dynamic> json) => new ModelTempat(
        idTempat: json["id_tempat"],
        nmTempat: json["nm_tempat"],
        tktTempat: json["tkt_tempat"],
        lokTempat: json["lok_tempat"],
        desTempat: json["des_tempat"],
        imgTempat: json["img_tempat"],
        latTempat: double.parse(json["lat_tempat"]),
        longTempat: double.parse(json["long_tempat"]),
        tglTempat: json["tgl_ad_tempat"],
      );

  Map<String, dynamic> toJson() => {
        "id_tempat": idTempat,
        "nm_tempat": nmTempat,
        "tkt_tempat": tktTempat,
        "lok_tempat": lokTempat,
        "des_tempat": desTempat,
        "img_tempat": imgTempat,
        "lat_tempat": latTempat,
        "long_tempat": longTempat,
        "tgl_ad_tempat": tglTempat,
      };
}
