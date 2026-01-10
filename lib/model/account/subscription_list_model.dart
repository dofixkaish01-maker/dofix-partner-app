class SubscriptionListModel {
  final String? responseCode;
  final String? message;
  final List<PackageModel>? content;
  final List<dynamic>? errors;

  SubscriptionListModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
  });
}

class PackageModel {
  final String id;
  final String name;
  final String price;
  final int duration;
  final int isActive;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> featureList;
  final FeatureLimit? featureLimit;

  PackageModel({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
    required this.isActive,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.featureList,
    required this.featureLimit,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      duration: json['duration'] ?? 0,
      isActive: json['is_active'] ?? 0,
      description: json['description'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      featureList: (json['feature_list'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      featureLimit: json['feature_limit'] != null
          ? FeatureLimit.fromJson(json['feature_limit'])
          : null,
    );
  }
}

class FeatureLimit {
  final dynamic booking;
  final int? category;

  FeatureLimit({
    this.booking,
    this.category,
  });
  factory FeatureLimit.fromJson(Map<String, dynamic> json) {
    return FeatureLimit(
      booking: json['booking'],
      category: json['category'],
    );
  }
}
