class AddonCartItem {
  final String serviceId;
  final String variantKey;
  final String serviceName;
  final String variantName;
  final int price;
  final int mrpPrice;
  final String? duration;
  final String? description;
  int quantity;
  final String? thumbnailPath;
  final String variationId;

  AddonCartItem({
    required this.serviceId,
    required this.variantKey,
    required this.serviceName,
    required this.variantName,
    required this.price,
    required this.mrpPrice,
    this.duration,
    this.description,
    this.quantity = 1,
    this.thumbnailPath,
    required this.variationId,
  });

  // Calculate total price for this item (price * quantity)
  int get totalPrice => price * quantity;

  // Calculate total MRP for this item (mrpPrice * quantity)
  int get totalMrp => mrpPrice * quantity;

  // Calculate total savings for this item
  int get totalSavings => totalMrp - totalPrice;

  // Create a copy with updated quantity
  AddonCartItem copyWith({
    String? serviceId,
    String? variantKey,
    String? serviceName,
    String? variantName,
    int? price,
    int? mrpPrice,
    String? duration,
    String? description,
    int? quantity,
    String? thumbnailPath,
  }) {
    return AddonCartItem(
      serviceId: serviceId ?? this.serviceId,
      variantKey: variantKey ?? this.variantKey,
      serviceName: serviceName ?? this.serviceName,
      variantName: variantName ?? this.variantName,
      price: price ?? this.price,
      mrpPrice: mrpPrice ?? this.mrpPrice,
      duration: duration ?? this.duration,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      variationId: variationId,
    );
  }

  // Convert to JSON for API calls
  Map<String, dynamic> toJson() {
    return {
      'service_id': serviceId,
      'variant_key': variantKey,
      'service_name': serviceName,
      'variant_name': variantName,
      'price': price,
      'mrp_price': mrpPrice,
      'duration': duration,
      'description': description,
      'quantity': quantity,
      'thumbnail_path': thumbnailPath,
      'variation_id': variationId,
    };
  }

  // Create from JSON
  factory AddonCartItem.fromJson(Map<String, dynamic> json) {
    return AddonCartItem(
      serviceId: json['service_id'] ?? '',
      variantKey: json['variant_key'] ?? '',
      serviceName: json['service_name'] ?? '',
      variantName: json['variant_name'] ?? '',
      price: json['price'] ?? 0,
      mrpPrice: json['mrp_price'] ?? 0,
      duration: json['duration'],
      description: json['description'],
      quantity: json['quantity'] ?? 1,
      thumbnailPath: json['thumbnail_path'],
      variationId: json['variation_id'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddonCartItem &&
        other.serviceId == serviceId &&
        other.variantKey == variantKey;
  }

  @override
  int get hashCode => serviceId.hashCode ^ variantKey.hashCode;

  @override
  String toString() {
    return 'AddonCartItem(serviceId: $serviceId, variantKey: $variantKey, serviceName: $serviceName, variantName: $variantName, price: $price, quantity: $quantity)';
  }
}

class AddonCart {
  final List<AddonCartItem> items;

  AddonCart({this.items = const []});

  // Get total number of items in cart
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  // Get total price of all items
  int get totalPrice => items.fold(0, (sum, item) => sum + item.totalPrice);

  // Get total MRP of all items
  int get totalMrp => items.fold(0, (sum, item) => sum + item.totalMrp);

  // Get total savings
  int get totalSavings => totalMrp - totalPrice;

  // Check if cart is empty
  bool get isEmpty => items.isEmpty;

  // Check if cart is not empty
  bool get isNotEmpty => items.isNotEmpty;

  // Get item by service and variant key
  AddonCartItem? getItem(String serviceId, String variantKey) {
    try {
      return items.firstWhere(
        (item) => item.serviceId == serviceId && item.variantKey == variantKey,
      );
    } catch (e) {
      return null;
    }
  }

  // Check if item exists in cart
  bool hasItem(String serviceId, String variantKey) {
    return getItem(serviceId, variantKey) != null;
  }

  // Get quantity of specific item
  int getItemQuantity(String serviceId, String variantKey) {
    final item = getItem(serviceId, variantKey);
    return item?.quantity ?? 0;
  }

  // Create a copy with modified items
  AddonCart copyWith({List<AddonCartItem>? items}) {
    return AddonCart(items: items ?? this.items);
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'total_items': totalItems,
      'total_price': totalPrice,
      'total_mrp': totalMrp,
      'total_savings': totalSavings,
    };
  }

  // Create from JSON
  factory AddonCart.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itemsJson = json['items'] ?? [];
    final List<AddonCartItem> items =
        itemsJson.map((itemJson) => AddonCartItem.fromJson(itemJson)).toList();
    return AddonCart(items: items);
  }
}
