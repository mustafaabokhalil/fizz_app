class AllOrdersModel {
  final bool? status;
  final String? message;
  final AllOrderData? data;

  AllOrdersModel({this.status, this.message, this.data});

  factory AllOrdersModel.fromJson(Map<String, dynamic> json) {
    return AllOrdersModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null ? AllOrderData.fromJson(json['data']) : null,
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

class AllOrderData {
  final List<allorderData>? current;
  final List<allorderData>? previous;

  AllOrderData({this.current, this.previous});

  factory AllOrderData.fromJson(Map<String, dynamic> json) {
    return AllOrderData(
      current: (json['current'] as List<dynamic>?)
          ?.map((item) => allorderData.fromJson(item as Map<String, dynamic>))
          .toList(),
      previous: (json['previous'] as List<dynamic>?)
          ?.map((item) => allorderData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current': current?.map((item) => item.toJson()).toList(),
      'previous': previous?.map((item) => item.toJson()).toList(),
    };
  }
}

class allorderData {
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
  final List<OrderItem>? orderItems;

  allorderData({
    this.id,
    this.orderId,
    this.orderCode,
    this.clientName,
    this.clientPhone,
    this.orderPrice,
    this.deliveryStatus,
    this.deliveryStatusString,
    this.shipping,
    this.tax,
    this.notes,
    this.paymentMethod,
    this.orderDate,
    this.orderTime,
    this.orderItems,
  });

  factory allorderData.fromJson(Map<String, dynamic> json) {
    return allorderData(
      id: json['id'] as int?,
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
      price: json['price'] as String?,
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
