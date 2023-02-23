// To parse this JSON data, do
//
//     final qrCode = qrCodeFromJson(jsonString);

import 'dart:convert';

QrCode qrCodeFromJson(String str) => QrCode.fromJson(json.decode(str));

String qrCodeToJson(QrCode data) => json.encode(data.toJson());

class QrCode {
    QrCode({
        required this.qrId,
        required this.qrUnique,
        required this.qrUse,
        required this.qrReedemed,
        required this.qrRupees,
        required this.qrReedemedby,
        required this.qrReedemstatus,
    });

    int qrId;
    String qrUnique;
    int qrUse;
    int qrReedemed;
    int qrRupees;
    String qrReedemedby;
    int qrReedemstatus;

    factory QrCode.fromJson(Map<String, dynamic> json) => QrCode(
        qrId: json["qr_id"],
        qrUnique: json["qr_unique"],
        qrUse: json["qr_use"],
        qrReedemed: json["qr_reedemed"],
        qrRupees: json["qr_rupees"],
        qrReedemedby: json["qr_reedemedby"],
        qrReedemstatus: json["qr_reedemstatus"],
    );

    Map<String, dynamic> toJson() => {
        "qr_id": qrId,
        "qr_unique": qrUnique,
        "qr_use": qrUse,
        "qr_reedemed": qrReedemed,
        "qr_rupees": qrRupees,
        "qr_reedemedby": qrReedemedby,
        "qr_reedemstatus": qrReedemstatus,
    };
}
