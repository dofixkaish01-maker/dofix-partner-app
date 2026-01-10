import 'dart:convert';

ExtraServicesModel extraServicesModelFromJson(String str) =>
    ExtraServicesModel.fromJson(json.decode(str));

String extraServicesModelToJson(ExtraServicesModel data) =>
    json.encode(data.toJson());

class ExtraServicesModel {
  final String? responseCode;
  final String? message;
  final List<AddOnContent>? content;
  final List<dynamic>? errors;

  ExtraServicesModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
  });

  factory ExtraServicesModel.fromJson(Map<String, dynamic> json) =>
      ExtraServicesModel(
        responseCode: json["response_code"],
        message: json["message"],
        content: json["content"] == null
            ? []
            : List<AddOnContent>.from(
                json["content"].map((x) => AddOnContent.fromJson(x))),
        errors: json["errors"] == null
            ? []
            : List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "message": message,
        "content": content == null
            ? []
            : List<dynamic>.from(content!.map((x) => x.toJson())),
        "errors":
            (errors == null) ? [] : List<dynamic>.from(errors!.map((x) => x)),
      };
}

class AddOnContent {
  final String? id;
  final String? name;
  final String? shortDescription;
  final String? description;
  final String? coverImage;
  final String? thumbnail;
  final String? categoryId;
  final String? subCategoryId;
  final double? tax;
  final int? orderCount;
  final int? isActive;
  final int? ratingCount;
  final double? avgRating;
  final String? minBiddingPrice;
  final DateTime? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final VariationsAppFormat? variationsAppFormat;
  final String? thumbnailFullPath;
  final String? coverImageFullPath;
  final Category? category;
  final List<Variation>? variations;
  final List<dynamic>? serviceDiscount;
  final List<dynamic>? campaignDiscount;
  final List<dynamic>? translations;
  // final dynamic storageThumbnail;
  // final dynamic storageCoverImage;

  AddOnContent({
    this.id,
    this.name,
    this.shortDescription,
    this.description,
    this.coverImage,
    this.thumbnail,
    this.categoryId,
    this.subCategoryId,
    this.tax,
    this.orderCount,
    this.isActive,
    this.ratingCount,
    this.avgRating,
    this.minBiddingPrice,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.variationsAppFormat,
    this.thumbnailFullPath,
    this.coverImageFullPath,
    this.category,
    this.variations,
    this.serviceDiscount,
    this.campaignDiscount,
    this.translations,
    // this.storageThumbnail,
    // this.storageCoverImage,
  });

  factory AddOnContent.fromJson(Map<String, dynamic> json) => AddOnContent(
        id: json["id"],
        name: json["name"],
        shortDescription: json["short_description"],
        description: json["description"],
        coverImage: json["cover_image"],
        thumbnail: json["thumbnail"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        tax: json["tax"]?.toDouble(),
        orderCount: json["order_count"] is int
            ? json["order_count"]
            : int.tryParse(json["order_count"]?.toString() ?? "0"),
        isActive: json["is_active"] is int
            ? json["is_active"]
            : int.tryParse(json["is_active"]?.toString() ?? "0"),
        ratingCount: json["rating_count"] is int
            ? json["rating_count"]
            : int.tryParse(json["rating_count"]?.toString() ?? "0"),
        avgRating: json["avg_rating"]?.toDouble(),
        minBiddingPrice: json["min_bidding_price"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        variationsAppFormat: json["variations_app_format"] == null
            ? null
            : VariationsAppFormat.fromJson(json["variations_app_format"]),
        thumbnailFullPath: json["thumbnail_full_path"],
        coverImageFullPath: json["cover_image_full_path"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        variations: json["variations"] == null
            ? []
            : List<Variation>.from(
                json["variations"].map((x) => Variation.fromJson(x))),
        serviceDiscount: json["service_discount"] == null
            ? []
            : List<dynamic>.from(json["service_discount"].map((x) => x)),
        campaignDiscount: json["campaign_discount"] == null
            ? []
            : List<dynamic>.from(json["campaign_discount"].map((x) => x)),
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"].map((x) => x)),
        // storageThumbnail: json["storage_thumbnail"],
        // storageCoverImage: json["storage_cover_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_description": shortDescription,
        "description": description,
        "cover_image": coverImage,
        "thumbnail": thumbnail,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "tax": tax,
        "order_count": orderCount,
        "is_active": isActive,
        "rating_count": ratingCount,
        "avg_rating": avgRating,
        "min_bidding_price": minBiddingPrice,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "variations_app_format": variationsAppFormat?.toJson(),
        "thumbnail_full_path": thumbnailFullPath,
        "cover_image_full_path": coverImageFullPath,
        "category": category?.toJson(),
        "variations": variations == null
            ? []
            : List<dynamic>.from(variations!.map((x) => x.toJson())),
        "service_discount": serviceDiscount == null
            ? []
            : List<dynamic>.from(serviceDiscount!.map((x) => x)),
        "campaign_discount": campaignDiscount == null
            ? []
            : List<dynamic>.from(campaignDiscount!.map((x) => x)),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        // "storage_thumbnail": storageThumbnail,
        // "storage_cover_image": storageCoverImage,
      };
}

class Category {
  final String? id;
  final String? parentId;
  final String? name;
  final String? image;
  final int? position;
  final String? description;
  final int? isActive;
  final int? isFeatured;
  final int? topRated;
  final int? quickRepair;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? imageFullPath;
  final List<ZonesBasicInfo>? zonesBasicInfo;
  final List<dynamic>? categoryDiscount;
  final List<dynamic>? translations;
  // final dynamic storage;

  Category({
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
    this.zonesBasicInfo,
    this.categoryDiscount,
    this.translations,
    // this.storage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        parentId: json["parent_id"]?.toString(),
        name: json["name"],
        image: json["image"],
        position: json["position"] is int
            ? json["position"]
            : int.tryParse(json["position"]?.toString() ?? "0"),
        description: json["description"]?.toString() ?? "",
        isActive: json["is_active"] is int
            ? json["is_active"]
            : int.tryParse(json["is_active"]?.toString() ?? "0"),
        isFeatured: json["is_featured"] is int
            ? json["is_featured"]
            : int.tryParse(json["is_featured"]?.toString() ?? "0"),
        topRated: json["top_rated"] is int
            ? json["top_rated"]
            : int.tryParse(json["top_rated"]?.toString() ?? "0"),
        quickRepair: json["quick_repair"] is int
            ? json["quick_repair"]
            : int.tryParse(json["quick_repair"]?.toString() ?? "0"),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        imageFullPath: json["image_full_path"],
        zonesBasicInfo: json["zones_basic_info"] == null
            ? []
            : List<ZonesBasicInfo>.from(json["zones_basic_info"]
                .map((x) => ZonesBasicInfo.fromJson(x))),
        categoryDiscount: json["category_discount"] == null
            ? []
            : List<dynamic>.from(json["category_discount"].map((x) => x)),
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"].map((x) => x)),
        // storage: json["storage"],
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
        "zones_basic_info": zonesBasicInfo == null
            ? []
            : List<dynamic>.from(zonesBasicInfo!.map((x) => x.toJson())),
        "category_discount": categoryDiscount == null
            ? []
            : List<dynamic>.from(categoryDiscount!.map((x) => x)),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        // "storage": storage,
      };
}

class ZonesBasicInfo {
  final String? id;
  final String? name;
  // final Coordinates? coordinates;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;
  final List<dynamic>? translations;

  ZonesBasicInfo({
    this.id,
    this.name,
    // this.coordinates,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.pivot,
    this.translations,
  });

  factory ZonesBasicInfo.fromJson(Map<String, dynamic> json) => ZonesBasicInfo(
        id: json["id"],
        name: json["name"] ?? "",
        // coordinates: json["coordinates"] == null
        //     ? null
        //     : Coordinates.fromJson(json["coordinates"]),
        isActive: json["is_active"] is int
            ? json["is_active"]
            : int.tryParse(json["is_active"]?.toString() ?? "0"),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "coordinates": coordinates?.toJson(),
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
      };
}

// class Coordinates {
//   final Type? type;
//   final List<List<List<double>>>? coordinates;

//   Coordinates({
//     this.type,
//     this.coordinates,
//   });

//   factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
//         type: typeValues.map[json["type"]]!,
//         coordinates: json["coordinates"] == null
//             ? []
//             : List<List<List<double>>>.from(json["coordinates"]!.map((x) =>
//                 List<List<double>>.from(x.map(
//                     (x) => List<double>.from(x.map((x) => x?.toDouble())))))),
//       );

//   Map<String, dynamic> toJson() => {
//         "type": typeValues.reverse[type],
//         "coordinates": coordinates == null
//             ? []
//             : List<dynamic>.from(coordinates!.map((x) => List<dynamic>.from(
//                 x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
//       };
// }

class Pivot {
  final String? categoryId;
  final String? zoneId;

  Pivot({
    this.categoryId,
    this.zoneId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        categoryId: json["category_id"],
        zoneId: json["zone_id"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "zone_id": zoneId,
      };
}

class Variation {
  final int? id;
  final String? variant;
  final String? variantKey;
  final String? serviceId;
  final String? zoneId;
  final String? mrpPrice;
  final String? discount;
  final int? price;
  final String? convenienceFee;
  final int? convenienceGst;
  final String? aggregatorFee;
  final int? aggregatorGst;
  final String? varDescription;
  final String? varDuration;
  final String? durationHour;
  final String? durationMinute;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Zone? zone;

  Variation({
    this.id,
    this.variant,
    this.variantKey,
    this.serviceId,
    this.zoneId,
    this.mrpPrice,
    this.discount,
    this.price,
    this.convenienceFee,
    this.convenienceGst,
    this.aggregatorFee,
    this.aggregatorGst,
    this.varDescription,
    this.varDuration,
    this.durationHour,
    this.durationMinute,
    this.createdAt,
    this.updatedAt,
    this.zone,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["id"] is int
            ? json["id"]
            : int.tryParse(json["id"]?.toString() ?? "0"),
        variant: json["variant"],
        variantKey: json["variant_key"],
        serviceId: json["service_id"],
        zoneId: json["zone_id"],
        mrpPrice: json["mrp_price"]?.toString(),
        discount: json["discount"]?.toString(),
        price: json["price"] is int
            ? json["price"]
            : int.tryParse(json["price"]?.toString() ?? "0"),
        convenienceFee: json["convenience_fee"]?.toString(),
        convenienceGst: json["convenience_gst"] is int
            ? json["convenience_gst"]
            : int.tryParse(json["convenience_gst"]?.toString() ?? "0"),
        aggregatorFee: json["aggregator_fee"]?.toString(),
        aggregatorGst: json["aggregator_gst"] is int
            ? json["aggregator_gst"]
            : int.tryParse(json["aggregator_gst"]?.toString() ?? "0"),
        varDescription: json["var_description"]?.toString(),
        varDuration: json["var_duration"]?.toString(),
        durationHour: json["duration_hour"]?.toString() ?? "",
        durationMinute: json["duration_minute"]?.toString() ?? "",
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        zone: json["zone"] == null ? null : Zone.fromJson(json["zone"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "variant": variant,
        "variant_key": variantKey,
        "service_id": serviceId,
        "zone_id": zoneId,
        "mrp_price": mrpPrice,
        "discount": discount,
        "price": price,
        "convenience_fee": convenienceFee,
        "convenience_gst": convenienceGst,
        "aggregator_fee": aggregatorFee,
        "aggregator_gst": aggregatorGst,
        "var_description": varDescription,
        "var_duration": varDuration,
        "duration_hour": durationHour,
        "duration_minute": durationMinute,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "zone": zone?.toJson(),
      };
}

class Zone {
  final String? id;
  final String? name;
  final List<dynamic>? translations;

  Zone({
    this.id,
    this.name,
    this.translations,
  });

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json["id"],
        name: json["name"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
      };
}

class VariationsAppFormat {
  final String? zoneId;
  final int? defaultPrice;

  VariationsAppFormat({
    this.zoneId,
    this.defaultPrice,
  });

  factory VariationsAppFormat.fromJson(Map<String, dynamic> json) =>
      VariationsAppFormat(
        zoneId: json["zone_id"]?.toString(),
        defaultPrice: json["default_price"] is int
            ? json["default_price"]
            : int.tryParse(json["default_price"]?.toString() ?? "0"),
      );

  Map<String, dynamic> toJson() => {
        "zone_id": zoneId,
        "default_price": defaultPrice,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
