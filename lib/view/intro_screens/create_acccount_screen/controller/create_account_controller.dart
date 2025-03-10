import 'package:fizz/app_imports.dart';
import 'package:fizz/models/cities_model.dart';
import 'package:fizz/models/nationality_model.dart';
import 'package:intl/intl.dart';

enum CreateAccountControllerStages { loading, error, done }

List<String> gender = ['ذكر', ' انثى'];

class CreateAccountController extends GetxController {
  RxInt selectedGenderIndex = 0.obs;
  RxInt registerIndex = 0.obs;
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  Rxn<CreateAccountControllerStages> stages =
      Rxn<CreateAccountControllerStages>();
  TextEditingController nameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController carTypeController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isMale = false;
  Rxn<XFile>? personalImage = Rxn<XFile>();
  Rxn<XFile>? licenseImage = Rxn<XFile>();

  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  Rxn<City> selectedCity = Rxn<City>();
  Rxn<Nationalities> selectedNationalities = Rxn<Nationalities>();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate.value = pickedDate;
      update();
    }
    update();
  }

  Future<void> createAccount(context) async {
    try {
      stages.value = CreateAccountControllerStages.loading;
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${LocalStorage.token}'
      };
      var request = MultipartRequest(
          'POST', Uri.parse('${ApiConstants.domain}/register'));
      request.fields.addAll({
        'name': nameController.text,
        'nationality_id': selectedNationalities.value!.id.toString(),
        'city_id': selectedCity.value!.id.toString(),
        'ID_number': idNumberController.text,
        'birth_day': birthDayController.text.isNotEmpty
            ? formatter.format(selectedDate.value!)
            : '1994-07-30',
        'is_male': selectedGenderIndex.value.toString(),
        'car_type': carTypeController.text,
        'car_model': carModelController.text,
        'car_number': carNumberController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'fcm': FirebaseMessagingService.instance.fcmToken.toString()
      });
      request.files.add(await MultipartFile.fromPath(
          'image', '${personalImage!.value!.path}'));
      request.files.add(await MultipartFile.fromPath(
          'car_license_image', '${licenseImage!.value!.path}'));
      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final responseMap = await ApiConstants.getResponseMap(response);
      debugPrint(responseMap.toString());
      if (response.statusCode == 200) {
        resetRegisterValues();
        AppFunctions.showSnackBar(
            context: context, message: responseMap['message']);
        stages.value = CreateAccountControllerStages.done;
        Get.to(() => LoginScreen());
      } else {
        AppFunctions.showErrorSnackBar(
            context: context, message: responseMap['message']);
        stages.value = CreateAccountControllerStages.error;

        print(response.reasonPhrase);
      }
    } catch (e) {
      stages.value = CreateAccountControllerStages.error;

      print(e);
    }
  }

  bool isFormValidStepOne() {
    return nameController.text.isNotEmpty &&
        selectedNationalities.value != null &&
        selectedCity.value != null &&
        idNumberController.text.isNotEmpty;
  }

  String getErrorMessage() {
    if (nameController.text.isEmpty) {
      return "الرجاء إدخال الاسم";
    } else if (selectedNationalities.value == null) {
      return "الرجاء إدخال الجنسية";
    } else if (selectedCity.value == null) {
      return "الرجاء إدخال المدينة";
    } else if (idNumberController.text.isEmpty) {
      return "الرجاء إدخال رقم الهوية";
    } else if (selectedDate.value == null) {
      return "الرجاء إدخال تاريخ الميلاد";
    }
    return "الرجاء تعبئة جميع الحقول المطلوبة";
  }

  bool isFormStepTwoValid() {
    final registerController = Get.find<CreateAccountController>();
    return registerController.carTypeController.text.isNotEmpty &&
        registerController.carModelController.text.isNotEmpty;
  }

  String getStepTwoErrorMessage() {
    final registerController = Get.find<CreateAccountController>();

    if (registerController.carTypeController.text.isEmpty) {
      return "الرجاء إدخال نوع السيارة";
    } else if (registerController.carModelController.text.isEmpty) {
      return "الرجاء إدخال موديل السيارة";
    }
    return "الرجاء تعبئة جميع الحقول المطلوبة";
  }

  void resetRegisterValues() {
    // Clear all controllers
    nameController.clear();
    nationalityController.clear();
    cityController.clear();
    idNumberController.clear();
    birthDayController.clear();
    carTypeController.clear();
    carModelController.clear();
    carNumberController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    selectedCity.value = null;
    selectedNationalities.value = null;
    // Reset images
    personalImage!.value = null;
    licenseImage!.value = null;
  }
}
