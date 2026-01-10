import 'package:dofix_technichian/model/booking_model.dart';
import 'package:dofix_technichian/model/variation_model.dart';

import 'category_model.dart';

class ServiceModel {
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
  final int? isFavorite;
  final String? thumbnailFullPath;
  final String? coverImageFullPath;
  final Category? category;
  final SubCategory? subCategory;
  final List<Variation>? variations;

  ServiceModel({
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
    this.isFavorite,
    this.thumbnailFullPath,
    this.coverImageFullPath,
    this.category,
    this.subCategory,
    this.variations,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    int? parseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is String) return int.tryParse(value);
      return null;
    }

    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    return ServiceModel(
      id: json['id'],
      name: json['name'],
      shortDescription: json['short_description'],
      description: json['description'],
      coverImage: json['cover_image'],
      thumbnail: json['thumbnail'],
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
      tax: parseDouble(json['tax']),
      orderCount: parseInt(json['order_count']),
      isActive: parseInt(json['is_active']),
      ratingCount: parseInt(json['rating_count']),
      avgRating: parseDouble(json['avg_rating']),
      minBiddingPrice: json['min_bidding_price'],
      isFavorite: parseInt(json['is_favorite']),
      thumbnailFullPath: json['thumbnail_full_path'],
      coverImageFullPath: json['cover_image_full_path'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'short_description': shortDescription,
      'description': description,
      'cover_image': coverImage,
      'thumbnail': thumbnail,
      'category_id': categoryId,
      'sub_category_id': subCategoryId,
      'tax': tax,
      'order_count': orderCount,
      'is_active': isActive,
      'rating_count': ratingCount,
      'avg_rating': avgRating,
      'min_bidding_price': minBiddingPrice,
      'is_favorite': isFavorite,
      'thumbnail_full_path': thumbnailFullPath,
      'cover_image_full_path': coverImageFullPath,
      'category': category?.toJson(),
    };
  }
}

class Services {
  List<ServiceModel>? data;

  Services({this.data});

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      data: json['data'] != null
          ? (json['data'] as List).map((e) => ServiceModel.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class SubCategoryModel {
  List<subcategories>? data;

  SubCategoryModel({this.data});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      data: json['data'] != null
          ? (json['data'] as List)
              .map((e) => subcategories.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class subcategories {
  final String? id;
  final String? name;

  final String? thumbnailFullPath;
  final String? coverImageFullPath;

  subcategories({
    this.id,
    this.name,
    this.thumbnailFullPath,
    this.coverImageFullPath,
  });

  factory subcategories.fromJson(Map<String, dynamic> json) {
    return subcategories(
      id: json['id'],
      name: json['name'],
      thumbnailFullPath: json['image_full_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_full_path': thumbnailFullPath,
    };
  }
}
