import 'dart:convert';

List<ModelKtTempat> modelSpotFromJson(String str) =>
    new List<ModelKtTempat>.from(
        json.decode(str).map((x) => ModelKtTempat.fromJson(x)));

String modelSpotToJson(List<ModelKtTempat> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ModelKtTempat {
  String idKtTempat;
  String nmKtTempat;
  String imgKtTempat;

  ModelKtTempat({
    this.idKtTempat,
    this.nmKtTempat,
    this.imgKtTempat,
  });

  factory ModelKtTempat.fromJson(Map<String, dynamic> json) =>
      new ModelKtTempat(
        idKtTempat: json["id_kt_tempat"],
        nmKtTempat: json["nm_kt_tempat"],
        imgKtTempat: json["img_kt_tempat"],
      );

  Map<String, dynamic> toJson() => {
        "id_kt_tempat": idKtTempat,
        "nm_kt_tempat": nmKtTempat,
        "img_kt_tempat": imgKtTempat,
      };
}
