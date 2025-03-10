import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/models/wallet_model.dart';

enum WalletControllerStages { loading, error, done }

class WalletController extends GetxController {
  Rxn<WalletControllerStages> stages = Rxn<WalletControllerStages>();
  Rxn<Wallet> walletData = Rxn<Wallet>();
  Future<void> getWalletData() async {
    stages.value = WalletControllerStages.loading;
    try {
      var headers = {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Authorization': 'Bearer ${LocalStorage.token}'
      };
      var request =
          MultipartRequest('GET', Uri.parse('${ApiConstants.domain}/wallet'));

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final responseMap = await ApiConstants.getResponseMap(response);
      log(responseMap.toString());
      if (response.statusCode == 200) {
        walletData.value = Wallet.fromJson(responseMap['data']);
        stages.value = WalletControllerStages.done;
      } else {
        stages.value = WalletControllerStages.error;
      }
    } catch (e) {
      stages.value = WalletControllerStages.error;

      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    getWalletData();
    super.onInit();
  }
}
