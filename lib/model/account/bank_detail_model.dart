class BankDetailModel {
  final String? responseCode;
  final String? message;
  final Content? content;
  final List<dynamic>? errors;

  BankDetailModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
  });

  factory BankDetailModel.fromJson(Map<String, dynamic> json) =>
      BankDetailModel(
        responseCode: json["response_code"],
        message: json["message"],
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        errors: json["errors"] ?? [],
      );
}

class Content {
  final String? id;
  final String? providerId;
  final dynamic bankName;
  final String? branchName;
  final String? accNo;
  final String? accHolderName;
  final String? ifscCode;
  final dynamic routingNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Cancelcheck>? cancelcheck;

  Content({
    this.id,
    this.providerId,
    this.bankName,
    this.branchName,
    this.accNo,
    this.accHolderName,
    this.ifscCode,
    this.routingNumber,
    this.createdAt,
    this.updatedAt,
    this.cancelcheck,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        providerId: json["provider_id"],
        bankName: json["bank_name"],
        branchName: json["branch_name"],
        accNo: json["acc_no"],
        accHolderName: json["acc_holder_name"],
        ifscCode: json["ifsc_code"],
        routingNumber: json["routing_number"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        cancelcheck: json["cancelcheck"] == null
            ? []
            : List<Cancelcheck>.from(
                json["cancelcheck"].map((x) => Cancelcheck.fromJson(x))),
      );
}

class Cancelcheck {
  final String? id;
  final String? bankDocs;
  final dynamic logoFullPath;

  Cancelcheck({
    this.id,
    this.bankDocs,
    this.logoFullPath,
  });

  factory Cancelcheck.fromJson(Map<String, dynamic> json) => Cancelcheck(
        id: json["id"],
        bankDocs: json["bank_docs"],
        logoFullPath: json["logo_full_path"],
      );
}
