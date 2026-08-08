import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';


class CoffeeRecordsModel {
   int? id;
   String? title;
   String? des;
   double? amount;
   DateTime? date;
   String? docId;

  CoffeeRecordsModel({
     this.id,
     this.title,
     this.des,
     this.amount,
     this.date,
     this.docId,
  });

  /// Factory constructor to create a [CoffeeRecordsModel] from a JSON map.
  factory CoffeeRecordsModel.fromJson(Map<String, dynamic> json) {
    return CoffeeRecordsModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      des: json['des'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      date:(json['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      docId: json['doc_id'] as String? ?? '',
    );
  }

  /// Converts this instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'des': des,
      'amount': amount,
      'date': Timestamp.fromDate(date ?? DateTime.now()),
      'doc_id': docId,
    };
  }

  /// Helper method to parse a JSON array string into a List<CoffeeRecordsModel>.
  static List<CoffeeRecordsModel> listFromJson(String source) {
    final List<dynamic> list = json.decode(source) as List<dynamic>;
    return list
        .map((item) =>
            CoffeeRecordsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Convert List<CoffeeRecordsModel> to JSON String
  static String listToJson(List<CoffeeRecordsModel> list) {
    return json.encode(
      list.map((item) => item.toJson()).toList(),
    );
  }
}