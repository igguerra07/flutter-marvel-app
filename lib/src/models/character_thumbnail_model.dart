class CharacterThumbnailModel {
  final String path;

  CharacterThumbnailModel({
    required this.path,
  });

  factory CharacterThumbnailModel.fromJson(Map<String, dynamic> json) =>
      CharacterThumbnailModel(path: json["path"]);
}
