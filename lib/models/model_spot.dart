import 'dart:convert';

List<ModelSpot> modelSpotFromJson(String str) => new List<ModelSpot>.from(
    json.decode(str).map((x) => ModelSpot.fromJson(x)));

String modelSpotToJson(List<ModelSpot> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSpot {
  String idSpot;
  String nmSpot;
  String tktSpot;
  // String lokSpot;
  String loktmpSpot;
  String desSpot;
  String imgSpot;
  String tglSpot;

  ModelSpot({
    this.idSpot,
    this.nmSpot,
    this.tktSpot,
    // this.lokSpot,
    this.loktmpSpot,
    this.desSpot,
    this.imgSpot,
    this.tglSpot,
  });

  factory ModelSpot.fromJson(Map<String, dynamic> json) => new ModelSpot(
        idSpot: json["id_spot"],
        nmSpot: json["nm_spot"],
        tktSpot: json["tkt_spot"],
        // lokSpot: json["id_tempat_spot"],
        loktmpSpot: json["nm_tempat_spot"],
        desSpot: json["des_spot"],
        imgSpot: json["img_spot"],
        tglSpot: json["tgl_ad_spot"],
      );

  Map<String, dynamic> toJson() => {
        "id_spot": idSpot,
        "nm_spot": nmSpot,
        "tkt_spot": tktSpot,
        // "id_tempat_spot": lokSpot,
        "nm_tempat_spot": loktmpSpot,
        "des_spot": desSpot,
        "img_spot": imgSpot,
        "tgl_ad_spot": tglSpot,
      };
}
