class SubscriptionDetailModel {
  final String? responseCode;
  final String? message;
  final SubscriptionPackage? content;
  final List<dynamic>? errors;

  SubscriptionDetailModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
  });
}

class SubscriptionPackage {
  final String id;
  final String providerId;
  final String subscriptionPackageId;
  final String packageSubscriberLogId;
  final String packageName;
  final String packagePrice;
  final String packageStartDate;
  final String packageEndDate;
  final int trialDuration;
  final int vatPercentage;
  final double vatAmount;
  final String? paymentMethod;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int isCanceled;
  final String paymentId;
  final int isNotified;
  final double totalAmount;
  final int numberOfUses;
  final String description;
  final List<String> featureList;
  final Package? package;

  SubscriptionPackage({
    required this.id,
    required this.providerId,
    required this.subscriptionPackageId,
    required this.packageSubscriberLogId,
    required this.packageName,
    required this.packagePrice,
    required this.packageStartDate,
    required this.packageEndDate,
    required this.trialDuration,
    required this.vatPercentage,
    required this.vatAmount,
    required this.paymentMethod,
    required this.createdAt,
    required this.updatedAt,
    required this.isCanceled,
    required this.paymentId,
    required this.isNotified,
    required this.totalAmount,
    required this.numberOfUses,
    required this.description,
    required this.featureList,
    this.package,
  });

  factory SubscriptionPackage.fromJson(Map<String, dynamic> json) {
    return SubscriptionPackage(
      id: json['id'] ?? '',
      providerId: json['provider_id'] ?? '',
      subscriptionPackageId: json['subscription_package_id'] ?? '',
      packageSubscriberLogId: json['package_subscriber_log_id'] ?? '',
      packageName: json['package_name'] ?? '',
      packagePrice: json['package_price'] ?? '',
      packageStartDate: json['package_start_date'] ?? '',
      packageEndDate: json['package_end_date'] ?? '',
      trialDuration: (json['trial_duration'] as num?)?.toInt() ?? 0,
      vatPercentage: (json['vat_percentage'] as num?)?.toInt() ?? 0,
      vatAmount: (json['vat_amount'] as num?)?.toDouble() ?? 0.0,
      paymentMethod: json['payment_method'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      isCanceled: (json['is_canceled'] as num?)?.toInt() ?? 0,
      paymentId: json['payment_id'] ?? '',
      isNotified: (json['is_notified'] as num?)?.toInt() ?? 0,
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0.0,
      numberOfUses: (json['number_of_uses'] as num?)?.toInt() ?? 0,
      description: json['description'] ?? '',
      featureList: (json['feature_list'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      package:
          json['package'] != null ? Package.fromJson(json['package']) : null,
    );
  }
}

class Package {
  final String? id;
  final String? name;
  final String? price;
  final int? duration;
  final int? isActive;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Package({
    this.id,
    this.name,
    this.price,
    this.duration,
    this.isActive,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      isActive: (json['is_active'] as num?)?.toInt() ?? 0,
      description: json['description'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
