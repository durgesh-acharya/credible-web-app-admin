
// To parse this JSON data, do
//
//     final subCate = subCateFromJson(jsonString);
// @dart=2.9
import 'dart:convert';

SubCate subCateFromJson(String str) => SubCate.fromJson(json.decode(str));

String subCateToJson(SubCate data) => json.encode(data.toJson());

class SubCate {
    SubCate({
         this.subcateId,
         this.subcateName,
        this.subcateDesctiption,
         this.subcateUrl,
         this.subcateCate,
         this.subcateStatus,
    });

    int subcateId;
    String subcateName;
    dynamic subcateDesctiption;
    String subcateUrl;
    int subcateCate;
    int subcateStatus;

    factory SubCate.fromJson(Map<String, dynamic> json) => SubCate(
        subcateId: json["subcate_id"],
        subcateName: json["subcate_name"],
        subcateDesctiption: json["subcate_desctiption"],
        subcateUrl: json["subcate_url"],
        subcateCate: json["subcate_cate"],
        subcateStatus: json["subcate_status"],
    );

    Map<String, dynamic> toJson() => {
        "subcate_id": subcateId,
        "subcate_name": subcateName,
        "subcate_desctiption": subcateDesctiption,
        "subcate_url": subcateUrl,
        "subcate_cate": subcateCate,
        "subcate_status": subcateStatus,
    };
}
