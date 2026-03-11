class CategoryDDModel {
  String? responseCode;
  String? message;
  List<CategoryDD>? content;

  CategoryDDModel({
    this.responseCode,
    this.message,
    this.content,
  });

  factory CategoryDDModel.fromJson(Map<String, dynamic> json) {
    return CategoryDDModel(
      responseCode: json['response_code'],
      message: json['message'],
      content: json['content'] != null
          ? (json['content'] as List)
          .map((e) => CategoryDD.fromJson(e))
          .toList()
          : [],
    );
  }
}

class CategoryDD {
  String? id;
  String? name;

  CategoryDD({this.id, this.name});

  factory CategoryDD.fromJson(Map<String, dynamic> json) {
    return CategoryDD(
      id: json['id'],
      name: json['name'],
    );
  }
}