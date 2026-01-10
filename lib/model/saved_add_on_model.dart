import 'dart:convert';

List<SavedAddOnModel> savedAddOnModelFromJson(String str) =>
    List<SavedAddOnModel>.from(
        json.decode(str).map((x) => SavedAddOnModel.fromJson(x)));

String savedAddOnModelToJson(List<SavedAddOnModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SavedAddOnModel {
  final int? id;
  final String? bookingId;
  final String? serviceId;
  final String? serviceName;
  final String? variantKey;
  final int? serviceCost;
  final int? quantity;
  final int? discountAmount;
  final int? taxAmount;
  final int? totalCost;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? campaignDiscountAmount;
  final int? overallCouponDiscountAmount;
  final int? variationId;
  final int? isAddon;

  SavedAddOnModel({
    this.id,
    this.bookingId,
    this.serviceId,
    this.serviceName,
    this.variantKey,
    this.serviceCost,
    this.quantity,
    this.discountAmount,
    this.taxAmount,
    this.totalCost,
    this.createdAt,
    this.updatedAt,
    this.campaignDiscountAmount,
    this.overallCouponDiscountAmount,
    this.variationId,
    this.isAddon,
  });

  factory SavedAddOnModel.fromJson(Map<String, dynamic> json) =>
      SavedAddOnModel(
        id: json["id"],
        bookingId: json["booking_id"],
        serviceId: json["service_id"],
        serviceName: json["service_name"],
        variantKey: json["variant_key"],
        serviceCost: json["service_cost"],
        quantity: json["quantity"],
        discountAmount: json["discount_amount"],
        taxAmount: json["tax_amount"],
        totalCost: json["total_cost"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        campaignDiscountAmount: json["campaign_discount_amount"],
        overallCouponDiscountAmount: json["overall_coupon_discount_amount"],
        variationId: json["variation_id"],
        isAddon: json["is_addon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "service_id": serviceId,
        "service_name": serviceName,
        "variant_key": variantKey,
        "service_cost": serviceCost,
        "quantity": quantity,
        "discount_amount": discountAmount,
        "tax_amount": taxAmount,
        "total_cost": totalCost,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "campaign_discount_amount": campaignDiscountAmount,
        "overall_coupon_discount_amount": overallCouponDiscountAmount,
        "variation_id": variationId,
        "is_addon": isAddon,
      };
}
