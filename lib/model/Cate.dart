// @dart=2.9
import 'dart:convert';

Cate cateFromJson(String str) => Cate.fromJson(json.decode(str));

String cateToJson(Cate data) => json.encode(data.toJson());

class Cate {
    Cate({
         this.cateId,
         this.cateName,
         this.cateDescription,
         this.cateUrl,
         this.cateActive,
    });

    int cateId;
    String cateName;
    String cateDescription;
    String cateUrl;
    int cateActive;

    factory Cate.fromJson(Map<String, dynamic> json) => Cate(
        cateId: json["cate_id"],
        cateName: json["cate_name"],
        cateDescription: json["cate_description"],
        cateUrl: json["cate_url"],
        cateActive: json["cate_active"],
    );

    Map<String, dynamic> toJson() => {
        "cate_id": cateId,
        "cate_name": cateName,
        "cate_description": cateDescription,
        "cate_url": cateUrl,
        "cate_active": cateActive,
    };
}
