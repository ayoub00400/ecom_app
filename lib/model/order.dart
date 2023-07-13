import 'dart:convert';

import 'package:collection/collection.dart';

import 'order_item.dart';

class Order {
  final int? id;
  final double? total;
  final List<OrderItem>? orderItems;

  const Order({this.id, this.total, this.orderItems});

  factory Order.fromMap(Map<String, dynamic> data) => Order(
        id: data['id'] as int?,
        total: (data['total'] as num?)?.toDouble(),
        orderItems:
            (data['orderItems'] as List<dynamic>?)?.map((e) => OrderItem.fromMap(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'total': total,
        'orderItems': orderItems?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Order].
  factory Order.fromJson(String data) {
    return Order.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Order] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Order) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ total.hashCode ^ orderItems.hashCode;
}
