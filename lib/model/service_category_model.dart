import 'dart:convert';

ServiceCategoryModel serviceCategoryModelFromJson(String str) =>
    ServiceCategoryModel.fromJson(json.decode(str));

String serviceCategoryModelToJson(ServiceCategoryModel data) =>
    json.encode(data.toJson());

class ServiceCategoryModel {
  final String? responseCode;
  final String? message;
  final List<CategoryData>? content;
  final List<dynamic>? errors;

  ServiceCategoryModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
  });

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) =>
      ServiceCategoryModel(
        responseCode: json["response_code"],
        message: json["message"],
        content: json["content"] == null
            ? []
            : List<CategoryData>.from(
                json["content"]!.map((x) => CategoryData.fromJson(x))),
        errors: json["errors"] == null
            ? []
            : List<dynamic>.from(json["errors"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "message": message,
        "content": content == null
            ? []
            : List<dynamic>.from(content!.map((x) => x.toJson())),
        "errors":
            errors == null ? [] : List<dynamic>.from(errors!.map((x) => x)),
      };
}

class CategoryData {
  final String? id;
  final String? parentId;
  final String? name;
  final String? image;
  final int? position;
  final dynamic description;
  final int? isActive;
  final int? isFeatured;
  final int? topRated;
  final int? quickRepair;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? imageFullPath;
  final List<dynamic>? translations;
  final dynamic storage;

  CategoryData({
    this.id,
    this.parentId,
    this.name,
    this.image,
    this.position,
    this.description,
    this.isActive,
    this.isFeatured,
    this.topRated,
    this.quickRepair,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.imageFullPath,
    this.translations,
    this.storage,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        image: json["image"],
        position: json["position"],
        description: json["description"],
        isActive: json["is_active"],
        isFeatured: json["is_featured"],
        topRated: json["top_rated"],
        quickRepair: json["quick_repair"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        imageFullPath: json["image_full_path"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        storage: json["storage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
        "image": image,
        "position": position,
        "description": description,
        "is_active": isActive,
        "is_featured": isFeatured,
        "top_rated": topRated,
        "quick_repair": quickRepair,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "image_full_path": imageFullPath,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "storage": storage,
      };
}
