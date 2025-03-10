import 'package:fizz/app_imports.dart';

enum HomeControllerStages { Loading, error, Done }

class HomeController extends GetxController {
  Rxn<HomeControllerStages> homeStages = Rxn<HomeControllerStages>();
  Rxn<HomeModel> homeResponse = Rxn<HomeModel>();
  Future<void> getHome() async {
    try {
      homeStages.value = HomeControllerStages.Loading;
      var headers = {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Authorization': 'Bearer ${LocalStorage.token}'
      };
      var request =
          MultipartRequest('GET', Uri.parse('${ApiConstants.domain}/home'));

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final responseMap = await ApiConstants.getResponseMap(response);
      debugPrint(responseMap.toString());
      if (response.statusCode == 200) {
        homeResponse.value = HomeModel.fromJson(responseMap);
        homeStages.value = HomeControllerStages.Done;
      } else {
        homeStages.value = HomeControllerStages.error;
        print(response.reasonPhrase);
      }
    } catch (e) {
      homeStages.value = HomeControllerStages.error;
      print(e);
    }
  }

  @override
  void onInit() {
    getHome();
    super.onInit();
  }
}
