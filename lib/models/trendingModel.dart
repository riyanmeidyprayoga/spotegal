class TrendingModel {
  final String trending;
  final String viewers;
  final String upload;
  final String totalCounting;
  final String idSpot;
  final String photo;
  final String nmSpot;
  final String nmTempat;
  final String harga;
  final String desc_spot;

  TrendingModel({
    this.trending,
    this.viewers,
    this.upload,
    this.totalCounting,
    this.idSpot,
    this.photo,
    this.nmSpot,
    this.nmTempat,
    this.harga,
    this.desc_spot,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      trending: json['trending'],
      viewers: json['viewers'],
      upload: json['upload'],
      totalCounting: json['totalCounting'],
      idSpot: json['idSpot'],
      photo: json['photo'],
      nmSpot: json['nmSpot'],
      nmTempat: json['nmTempat'],
      harga: json['harga'],
      desc_spot: json['desc_spot'],
    );
  }
}
