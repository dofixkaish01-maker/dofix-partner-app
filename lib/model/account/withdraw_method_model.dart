class WithdrawMethodModel {
  final String? responseCode;
  final String? message;
  final WithdrawMethodContent? content;
  final List<dynamic>? errors;

  WithdrawMethodModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
  });

  factory WithdrawMethodModel.fromJson(Map<String, dynamic> json) {
    return WithdrawMethodModel(
      responseCode: json['response_code'],
      message: json['message'],
      content: json['content'] != null
          ? WithdrawMethodContent.fromJson(json['content'])
          : null,
      errors: json['errors'] ?? [],
    );
  }
}

class WithdrawMethodContent {
  final int? currentPage;
  final List<WithdrawMethodData>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  WithdrawMethodContent({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory WithdrawMethodContent.fromJson(Map<String, dynamic> json) {
    return WithdrawMethodContent(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => WithdrawMethodData.fromJson(e))
              .toList() ??
          [],
      firstPageUrl: json['first_page_url'] ?? '',
      from: (json['from'] as num?)?.toInt() ?? 0,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 0,
      lastPageUrl: json['last_page_url'] ?? '',
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => Link.fromJson(e))
              .toList() ??
          [],
      nextPageUrl: json['next_page_url'],
      path: json['path'] ?? '',
      perPage: (json['per_page'] as num?)?.toInt() ?? 0,
      prevPageUrl: json['prev_page_url'],
      to: (json['to'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );
  }
}

class WithdrawMethodData {
  final String? id;
  final String? methodName;
  final List<MethodField>? methodFields;
  final int? isDefault;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? translations;

  WithdrawMethodData({
    this.id,
    this.methodName,
    this.methodFields,
    this.isDefault,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.translations,
  });

  factory WithdrawMethodData.fromJson(Map<String, dynamic> json) {
    return WithdrawMethodData(
      id: json['id'] ?? '',
      methodName: json['method_name'] ?? '',
      methodFields: (json['method_fields'] as List<dynamic>?)
              ?.map((e) => MethodField.fromJson(e))
              .toList() ??
          [],
      isDefault: (json['is_default'] as num?)?.toInt() ?? 0,
      isActive: (json['is_active'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] != null && json['created_at'] != ''
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null && json['updated_at'] != ''
          ? DateTime.parse(json['updated_at'])
          : null,
      translations: json['translations'] ?? [],
    );
  }
}

class MethodField {
  final String? inputType;
  final String? inputName;
  final String? placeholder;
  final int? isRequired;

  MethodField({
    this.inputType,
    this.inputName,
    this.placeholder,
    this.isRequired,
  });

  factory MethodField.fromJson(Map<String, dynamic> json) {
    return MethodField(
      inputType: json['input_type'] ?? '',
      inputName: json['input_name'] ?? '',
      placeholder: json['placeholder'] ?? '',
      isRequired: (json['is_required'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'input_type': inputType,
      'input_name': inputName,
      'placeholder': placeholder,
      'is_required': isRequired,
    };
  }
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'] ?? '',
      active: json['active'] ?? false,
    );
  }
}
