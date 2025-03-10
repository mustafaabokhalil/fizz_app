class OrderResponse {
  final bool? status;
  final String? message;
  final OrderDetailsData? data;

  OrderResponse({this.status, this.message, this.data});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data:
          json['data'] != null ? OrderDetailsData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class OrderDetailsData {
  final int? id;
  final String? orderId;
  final String? orderCode;
  final String? clientName;
  final String? clientPhone;
  final String? orderPrice;
  final int? deliveryStatus;
  final String? deliveryStatusString;
  final String? shipping;
  final String? tax;
  final String? notes;
  final String? paymentMethod;
  final String? orderDate;
  final String? orderTime;
  final String? addressFrom;
  final String? latFrom;
  final String? latTo;
  final String? longTo;
  final String? addressTo;
  final String? longFrom;
  final String? phoneFrom;

  final List<OrderItem>? orderItems;

  OrderDetailsData({
    this.id,
    this.orderId,
    this.orderCode,
    this.phoneFrom,
    this.clientName,
    this.clientPhone,
    this.orderPrice,
    this.deliveryStatus,
    this.deliveryStatusString,
    this.shipping,
    this.longFrom,
    this.tax,
    this.latTo,
    this.addressTo,
    this.longTo,
    this.latFrom,
    this.addressFrom,
    this.notes,
    this.paymentMethod,
    this.orderDate,
    this.orderTime,
    this.orderItems,
  });
  factory OrderDetailsData.fromJson(Map<String, dynamic> json) {
    return OrderDetailsData(
      id: json['id'] as int?,
      latTo: json['lat_to'],
      longTo: json['long_to'],
      addressFrom: json['address_from'],
      addressTo: json['address_to'],
      latFrom: json['lat_from'],
      longFrom: json['long_from'],
      phoneFrom: json['phone_from'],
      orderId: json['order_id'] as String?,
      orderCode: json['order_code'] as String?,
      clientName: json['client_name'] as String?,
      clientPhone: json['client_phone'] as String?,
      orderPrice: json['order_price'] as String?,
      deliveryStatus: json['delivery_status'] as int?,
      deliveryStatusString: json['delivery_status_string'] as String?,
      shipping: json['shipping'] as String?,
      tax: json['tax'] as String?,
      notes: json['notes'] as String?,
      paymentMethod: json['payment_method'] as String?,
      orderDate: json['order_date'] as String?,
      orderTime: json['order_time'] as String?,
      orderItems: (json['order_items'] as List<dynamic>?)
          ?.map((item) => OrderItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'order_code': orderCode,
      'client_name': clientName,
      'client_phone': clientPhone,
      'order_price': orderPrice,
      'delivery_status': deliveryStatus,
      'delivery_status_string': deliveryStatusString,
      'shipping': shipping,
      'tax': tax,
      'notes': notes,
      'payment_method': paymentMethod,
      'order_date': orderDate,
      'order_time': orderTime,
      'order_items': orderItems?.map((item) => item.toJson()).toList(),
    };
  }
}

class OrderItem {
  final String? name;
  final String? price;
  final String? quantity;

  OrderItem({this.name, this.price, this.quantity});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      name: json['name'] as String?,
      price: json['wight'] as String?,
      quantity: json['quantity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}
