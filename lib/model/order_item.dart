import 'dart:convert';

class OrderItem {
  final int? id;
  final String? label;
  int quantity;
  double price;
  double total;
  final String? image;

  OrderItem({
    this.id,
    this.label,
    required this.quantity,
    required this.price,
    required this.total,
    this.image,
  });

  factory OrderItem.fromMap(Map<String, dynamic> data) => OrderItem(
        id: data['id'] as int?,
        label: data['label'] as String?,
        quantity: data['quantity'] as int,
        price: (data['price'] as num).toDouble(),
        total: (data['total'] as num).toDouble(),
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'label': label,
        'quantity': quantity,
        'price': price,
        'total': total,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderItem].
  factory OrderItem.fromJson(String data) {
    return OrderItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderItem] to a JSON string.
  String toJson() => json.encode(toMap());
}
