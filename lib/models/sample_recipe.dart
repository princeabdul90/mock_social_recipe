class SampleRecipe {
  String id;
  String dishImage;
  String title;
  String duration;
  String source;
  List<String> information;

  SampleRecipe({
    required this.id,
    required this.dishImage,
    required this.title,
    required this.duration,
    required this.source,
    required this.information,
  });

  factory SampleRecipe.fromJson(Map<String, dynamic> json) {
    return SampleRecipe(
      id: json['id'] as String,
      dishImage: json['dishImage'] as String,
      title: json['title'] as String,
      duration: json['duration'] as String,
      source: json['source'] as String,
      information: json['information'].cast<String>() as List<String>,
    );
  }
}
