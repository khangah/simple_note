List<NoteModel> noteListFromJsonList(Map<String, dynamic> json) {
  return List<NoteModel>.from(json["list"].map((x) => NoteModel.fromJson(x)));
}

class NoteModel {
  NoteModel({
    required this.text,
    required this.createTime,
    required this.editTime,
  });

  String text;
  int createTime;
  int editTime;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        text: json["text"],
        createTime: json["createTime"],
        editTime: json["editTime"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "createTime": createTime,
        "editTime": editTime,
      };
}
