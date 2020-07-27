class FeedModel {
  final String id;
  final String idMember;
  final String idSpot;
  final String createdDate;
  final String caption;
  final String photo;
  final String nm_spot;
  final String namaLengkap;
  final String idUploaders;
  final String photoUploaders;
  final String idTempat;
  final String viewers;

  FeedModel({
    this.id,
    this.idMember,
    this.idSpot,
    this.createdDate,
    this.caption,
    this.photo,
    this.nm_spot,
    this.namaLengkap,
    this.idUploaders,
    this.photoUploaders,
    this.idTempat,
    this.viewers,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      id: json['id'],
      idMember: json['idMember'],
      idSpot: json['idSpot'],
      createdDate: json['createdDate'],
      caption: json['caption'],
      photo: json['photo'],
      nm_spot: json['nm_spot'],
      namaLengkap: json['namaLengkap'],
      idUploaders: json['idUploaders'],
      photoUploaders: json['photoUploaders'],
      idTempat: json['idTempat'],
      viewers: json['viewers'],
    );
  }
}
