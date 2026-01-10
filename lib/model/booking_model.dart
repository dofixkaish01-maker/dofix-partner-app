class BookingList {
  List<Booking>? data;

  BookingList({this.data});

  factory BookingList.fromJson(dynamic json) {
    try {
      // Handle the case where json might be null or not contain 'data'
      if (json == null) {
        return BookingList(data: []);
      }

      // Check if json has 'data' key and it's a List
      // if (json['data'] != null &&
      //     json['data'] is List &&
      //     json['data'].isNotEmpty) {
      //   return BookingList(
      //     data: (json['data'] as List).map((e) => Booking.fromJson(e)).toList(),
      //   );
      // } else {
      //   return BookingList(data: []);
      // }
      if (json['data'] != null && json['data'] is List) {
        return BookingList(
          data: (json['data'] as List).map((e) => Booking.fromJson(e)).toList(),
        );
      } else {
        return BookingList(data: []);
      }
    } catch (e) {
      print("Error parsing BookingList: $e");
      return BookingList(data: []);
    }
  }
}

class Booking {
  dynamic id;
  dynamic readableId;
  dynamic customerId;
  dynamic providerId;
  dynamic zoneId;
  dynamic bookingStatus;
  dynamic isPaid;
  dynamic paymentMethod;
  dynamic transactionId;
  dynamic totalBookingAmount;
  dynamic totalTaxAmount;
  dynamic totalDiscountAmount;
  dynamic serviceSchedule;
  dynamic serviceAddressId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic categoryId;
  dynamic subCategoryId;
  dynamic servicemanId;
  dynamic customer;
  dynamic subCategory;
  dynamic serviceAddress;
  dynamic evidencePhotos;
  dynamic preVideos;
  dynamic postVideos;

  Booking({
    this.evidencePhotos,
    this.preVideos,
    this.postVideos,
    this.id,
    this.readableId,
    this.customerId,
    this.providerId,
    this.zoneId,
    this.bookingStatus,
    this.isPaid,
    this.paymentMethod,
    this.transactionId,
    this.totalBookingAmount,
    this.totalTaxAmount,
    this.totalDiscountAmount,
    this.serviceSchedule,
    this.serviceAddressId,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.subCategoryId,
    this.servicemanId,
    this.customer,
    this.subCategory,
    this.serviceAddress,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    List<dynamic> safeList(dynamic value) {
      if (value == null) return [];
      if (value is List) return value;
      return [];
    }

    return Booking(
      evidencePhotos: safeList(json['evidence_photos']),
      preVideos: safeList(json['pre_videos']),
      postVideos: safeList(json['post_videos']),
      id: json['id'],
      readableId: json['readable_id'],
      customerId: json['customer_id'],
      providerId: json['provider_id'],
      zoneId: json['zone_id'],
      bookingStatus: json['booking_status'],
      isPaid: json['is_paid'],
      paymentMethod: json['payment_method'],
      transactionId: json['transaction_id'],
      totalBookingAmount: json['total_booking_amount'],
      totalTaxAmount: json['total_tax_amount'],
      totalDiscountAmount: json['total_discount_amount'],
      serviceSchedule: json['service_schedule'],
      serviceAddressId: (json['service_address_id'] == null ||
              json['service_address_id'] == "null")
          ? null
          : json['service_address_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
      servicemanId: json['serviceman_id'],
      customer:
          json['customer'] != null ? Customer.fromJson(json['customer']) : null,
      subCategory: json['sub_category'] != null
          ? SubCategory.fromJson(json['sub_category'])
          : null,
      serviceAddress: json['service_address'] != null
          ? AddressModel.fromJson(json['service_address'])
          : null,
    );
  }

  // factory Booking.fromJson(Map<String, dynamic> json) {
  //   return Booking(
  //     id: json['id'],
  //     readableId: json['readable_id'],
  //     customerId: json['customer_id'],
  //     providerId: json['provider_id'],
  //     zoneId: json['zone_id'],
  //     bookingStatus: json['booking_status'],
  //     isPaid: json['is_paid'],
  //     paymentMethod: json['payment_method'],
  //     transactionId: json['transaction_id'],
  //     totalBookingAmount: json['total_booking_amount'],
  //     totalTaxAmount: json['total_tax_amount'],
  //     totalDiscountAmount: json['total_discount_amount'],
  //     serviceSchedule: json['service_schedule'],
  //     serviceAddressId: json['service_address_id'],
  //     createdAt: json['created_at'],
  //     updatedAt: json['updated_at'],
  //     categoryId: json['category_id'],
  //     subCategoryId: json['sub_category_id'],
  //     servicemanId: json['serviceman_id'],
  //     customer:
  //         json['customer'] != null ? Customer.fromJson(json['customer']) : null,
  //     subCategory: json['sub_category'] != null
  //         ? SubCategory.fromJson(json['sub_category'])
  //         : null,
  //     serviceAddress: json['service_address'] != null
  //         ? AddressModel.fromJson(json['service_address'])
  //         : null,
  //   );
  // }
}

class Customer {
  dynamic id;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic phone;

  Customer({this.id, this.firstName, this.lastName, this.email, this.phone});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}

class SubCategory {
  dynamic id;
  dynamic name;

  SubCategory({this.id, this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
    );
  }
}

class AddressModel {
  final String? id;
  final String? userId;
  final String? lat;
  final String? lon;
  final String? city;
  final String? street;
  final String? zipCode;
  final String? country;
  final String? address;
  final String? createdAt;
  final String? updatedAt;
  final String? addressType;
  final String? contactPersonName;
  final String? contactPersonNumber;
  final String? addressLabel;
  final String? zoneId;
  final String? isGuest;
  final String? house;
  final String? floor;

  AddressModel({
    this.id,
    this.userId,
    this.lat,
    this.lon,
    this.city,
    this.street,
    this.zipCode,
    this.country,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.addressType,
    this.contactPersonName,
    this.contactPersonNumber,
    this.addressLabel,
    this.zoneId,
    this.isGuest,
    this.house,
    this.floor,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    // return AddressModel(
    //   id: json['id']?.toString() ?? '',
    //   userId: json['user_id'].toString(),
    //   lat: json['lat'].toString(),
    //   lon: json['lon'].toString(),
    //   city: json['city'].toString(),
    //   street: json['street'].toString(),
    //   zipCode: json['zip_code'].toString(),
    //   country: json['country'].toString(),
    //   address: json['address'].toString(),
    //   createdAt: json['created_at'].toString(),
    //   updatedAt: json['updated_at'].toString(),
    //   addressType: json['address_type'].toString(),
    //   contactPersonName: json['contact_person_name'].toString(),
    //   contactPersonNumber: json['contact_person_number'].toString(),
    //   addressLabel: json['address_label'].toString(),
    //   zoneId: json['zone_id'].toString(),
    //   isGuest: json['is_guest'].toString(),
    //   house: json['house'].toString(),
    //   floor: json['floor'].toString(),
    // );
    return AddressModel(
      id: json['id']?.toString() ?? '',
      userId: json['user_id']?.toString(), // ← Add ?. here
      lat: json['lat']?.toString(), // ← Add ?. here
      lon: json['lon']?.toString(), // ← Add ?. here
      city: json['city']?.toString(), // ← Add ?. here
      street: json['street']?.toString(), // ← Add ?. here
      zipCode: json['zip_code']?.toString(), // ← Add ?. here
      country: json['country']?.toString(), // ← Add ?. here
      address: json['address']?.toString(), // ← Add ?. here
      createdAt: json['created_at']?.toString(), // ← Add ?. here
      updatedAt: json['updated_at']?.toString(), // ← Add ?. here
      addressType: json['address_type']?.toString(), // ← Add ?. here
      contactPersonName:
          json['contact_person_name']?.toString(), // ← Add ?. here
      contactPersonNumber:
          json['contact_person_number']?.toString(), // ← Add ?. here
      addressLabel: json['address_label']?.toString(), // ← Add ?. here
      zoneId: json['zone_id']?.toString(), // ← Add ?. here
      isGuest: json['is_guest']?.toString(), // ← Add ?. here
      house: json['house']?.toString(), // ← Add ?. here
      floor: json['floor']?.toString(), // ← Add ?. here
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'lat': lat,
      'lon': lon,
      'city': city,
      'street': street,
      'zip_code': zipCode,
      'country': country,
      'address': address,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'address_type': addressType,
      'contact_person_name': contactPersonName,
      'contact_person_number': contactPersonNumber,
      'address_label': addressLabel,
      'zone_id': zoneId,
      'is_guest': isGuest,
      'house': house,
      'floor': floor,
    };
  }
}
