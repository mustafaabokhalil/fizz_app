import 'package:fizz/app_imports.dart';

class OrderStatusModel {
  String name;
  int id;
  String image;
  OrderStatusModel({
    required this.id,
    required this.image,
    required this.name,
  });
}

List<OrderStatusModel> orderStatusList = [
  OrderStatusModel(
    id: 2,
    image: AppAssets.status1,
    name: 'تم استلام الطلب من المندوب',
  ),
  OrderStatusModel(
    id: 3,
    image: AppAssets.status2,
    name: 'طلبك ف الطريق',
  ),
  OrderStatusModel(
    id: 4,
    image: AppAssets.status3,
    name: 'تم تسليم الطلب',
  ),
  OrderStatusModel(
    id: 5,
    image: AppAssets.status4,
    name: 'لم يتم استلام الطلب من العميل',
  ),
];
