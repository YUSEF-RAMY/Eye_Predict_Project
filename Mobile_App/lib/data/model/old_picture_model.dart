class OldPictureModel {
  final String accuracy;
  final String result;
  final String image;
  final String date;

  OldPictureModel({
    required this.accuracy,
    required this.result,
    required this.image,
    required this.date,
  });

  factory OldPictureModel.fromjson(Map<String, dynamic> json) {
    return OldPictureModel(
      accuracy: json['Accuracy'],
      result: json['Result'],
      image: json['image'],
      date: json['date'],
    );
  }
}
