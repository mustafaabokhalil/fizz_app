import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/helper/constants/api_constants.dart';
import 'package:fizz/models/pusher_order_model.dart';
import 'package:fizz/view/navigation_screens/orders_screen/controller/orders_controller.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherServices {
  static final PusherServices instance = PusherServices._internal();

  PusherServices._internal();

  final PusherChannelsFlutter _pusher = PusherChannelsFlutter.getInstance();

  String? authToken;

  final privatePostChannelName = "private-postChannel";
  final privateCommentChannelName = "private-commentChannel";
  static const highlightsImagePostEvent = "imagePosts";
  static const highlightsVideoPostEvent = "videoPosts";
  static const localNewsEvent = "localPosts";
  static const commentEvent = "newComment";
  static const deleteCommentEvent = "deleteComment";
  static const worldNewsEvent = "internationalPosts";
  static const connected = "CONNECTED";
  static const disconnected = "DISCONNECTED";

  Future<void> initializePusher({String? token}) async {
    try {
      // authToken = token;
      await _pusher.init(
          apiKey: ApiConstants.pusherKey,
          cluster: ApiConstants.pusherCluster,
          onConnectionStateChange: (String currentState, String previousState) {
            debugPrint("Connection currentState: $currentState");
            debugPrint("Connection previousState: $previousState");
          },
          onAuthorizer: onAuthorizer);

      subscribe(channelName: "Orders");

      await _pusher.connect();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
    }
  }

  dynamic onAuthorizer(
    String channelName,
    String socketId,
    dynamic options,
  ) async {
    return {
      "auth": "$socketId:$channelName",
      "channel_data": '{"user_id": "sl<UserData>().userData!.id"}',
      "shared_secret": "AppConstants.pusherSecret"
    };
  }

  Future<void> subscribe({
    required String channelName,
    BuildContext? context,
  }) async {
    await _pusher.subscribe(
      channelName: channelName,
      onSubscriptionError: onError,
      onSubscriptionSucceeded: onSubscriptionSucceeded,
      // onMemberAdded: (member) {},
      // onMemberRemoved: (member) {},
      onEvent: (event) {
        PusherEvent newEvent = event as PusherEvent;
        log(event.channelName.toString());
        debugPrint("onEvent222222::: ${newEvent.data}");
        List<dynamic> jsonData = jsonDecode(newEvent.data.toString());
        debugPrint("onEvent344234234234::: ${jsonData}");
        List<PusherOrder> orders = [];
        orders.clear();
        Get.find<OrdersController>().pusherOrders.clear();
        orders = (jsonData)
            .map((orderJson) => PusherOrder.fromJson(orderJson))
            .toList();
        Get.find<OrdersController>().pusherOrders.addAll(orders);
        debugPrint(
            "response::: ${Get.find<OrdersController>().pusherOrders.length}");
      },
    );
  }

  onSubscriptionSucceeded(dynamic data) {
    debugPrint("onSubscriptionSucceeded: data: $data");
  }

  void onError(String? message, int? code, dynamic e) {}
}
