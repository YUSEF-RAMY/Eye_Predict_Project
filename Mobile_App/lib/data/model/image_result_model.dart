class ImageResultModel {
  final String accuracy;
  final String result;
  final String image;

  ImageResultModel({
    required this.accuracy,
    required this.result,
    required this.image,
  });

  factory ImageResultModel.fromjson(Map<String, dynamic> json) {
    return ImageResultModel(
      accuracy: json['location']['name'],
      result: json['result'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
