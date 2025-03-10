import 'package:fizz/models/pusher_order_model.dart';

class HomeModel {
  bool? status;
  String? message;
  Data? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<PusherOrder>? orders;
  int? numberOfTodayOrders;
  int? numberOfWeekOrders;
  bool? available;
  Wallet? wallet;

  Data(
      {this.orders,
      this.numberOfTodayOrders,
      this.numberOfWeekOrders,
      this.available,
      this.wallet});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <PusherOrder>[];
      json['orders'].forEach((v) {
        orders!.add(new PusherOrder.fromJson(v));
      });
    }
    numberOfTodayOrders = json['Number_of_today_orders'];
    numberOfWeekOrders = json['Number_of_week_orders'];
    available = json['available'];
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    data['Number_of_today_orders'] = this.numberOfTodayOrders;
    data['Number_of_week_orders'] = this.numberOfWeekOrders;
    data['available'] = this.available;
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? orderId;
  String? orderCode;
  String? deliveryStatusString;
  String? paymentMethod;
  String? orderDate;
  String? orderTime;

  Orders(
      {this.id,
      this.orderId,
      this.orderCode,
      this.deliveryStatusString,
      this.paymentMethod,
      this.orderDate,
      this.orderTime});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    orderCode = json['order_code'];
    deliveryStatusString = json['delivery_status_string'];
    paymentMethod = json['payment_method'];
    orderDate = json['order_date'];
    orderTime = json['order_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['order_code'] = this.orderCode;
    data['delivery_status_string'] = this.deliveryStatusString;
    data['payment_method'] = this.paymentMethod;
    data['order_date'] = this.orderDate;
    data['order_time'] = this.orderTime;
    return data;
  }
}

class Wallet {
  String? wallet;
  String? today;
  String? thisWeek;
  String? thisMonth;

  Wallet({this.wallet, this.today, this.thisWeek, this.thisMonth});

  Wallet.fromJson(Map<String, dynamic> json) {
    wallet = json['wallet'];
    today = json['today'];
    thisWeek = json['this_week'];
    thisMonth = json['this_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet'] = this.wallet;
    data['today'] = this.today;
    data['this_week'] = this.thisWeek;
    data['this_month'] = this.thisMonth;
    return data;
  }
}
