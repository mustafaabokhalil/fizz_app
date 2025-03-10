class PusherOrder {
  final int id;
  final String orderId;
  final String orderCode;
  final String deliveryStatusString;
  final String paymentMethod;
  final String orderDate;
  final String orderTime;
  // final List<OrderItem> orderItems;

  PusherOrder({
    required this.id,
    required this.orderId,
    required this.orderCode,
    required this.deliveryStatusString,
    required this.paymentMethod,
    required this.orderDate,
    required this.orderTime,
    // required this.orderItems,
  });

  factory PusherOrder.fromJson(Map<String, dynamic> json) {
    return PusherOrder(
      id: json['id'],
      orderId: json['order_id'],
      orderCode: json['order_code'],
      deliveryStatusString: json['delivery_status_string'],
      paymentMethod: json['payment_method'],
      orderDate: json['order_date'],
      orderTime: json['order_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'order_code': orderCode,
      'delivery_status_string': deliveryStatusString,
      'payment_method': paymentMethod,
      'order_date': orderDate,
      'order_time': orderTime,
    };
  }
}
