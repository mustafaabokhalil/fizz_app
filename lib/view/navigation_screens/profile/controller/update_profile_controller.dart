import 'package:fizz/app_imports.dart';
import 'package:intl/intl.dart';

enum EditProfileStates { loading, error, done }

class EditProfileController extends GetxController {
  Rxn<EditProfileStates> editProfileStates = Rxn<EditProfileStates>();
  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

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
      birthday.text = formatter.format(selectedDate.value!);
      update();
    }
    update();
  }

  Future<void> updateProfileData(context) async {
    try {
      editProfileStates.value = EditProfileStates.loading;
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${LocalStorage.token}',
        'Accept-Language': Get.locale!.languageCode,
      };
      var request = MultipartRequest(
          'POST', Uri.parse('${ApiConstants.domain}/update_profile'));
      request.fields.addAll({
        '_method': 'PUT',
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'birth_day': birthday.text,
      });
      if (Get.find<ImagePickerController>().personalImageFile != null) {
        request.files.add(await MultipartFile.fromPath('image',
            Get.find<ImagePickerController>().personalImageFile!.path));
      }
      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final responseMap = await ApiConstants.getResponseMap(response);
      print(responseMap.toString());
      print(request.fields.toString());
      if (response.statusCode == 200) {
        editProfileStates.value = EditProfileStates.done;
        Get.find<ProfileController>().getProfileData();
        AppFunctions.showSnackBar(
            context: context, message: responseMap['message']);
      } else {
        AppFunctions.showSnackBar(
            context: context, message: responseMap['message']);
        editProfileStates.value = EditProfileStates.error;
      }
    } catch (e) {
      editProfileStates.value = EditProfileStates.error;
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthday = TextEditingController();
  addInitialValues() {
    final profileController = Get.find<ProfileController>();
    if (profileController.user.value != null) {
      nameController.text = profileController.user.value!.name ?? '';
      nationalityController.text =
          profileController.user.value!.nationality ?? '';
      emailController.text = profileController.user.value!.email ?? '';
      phoneController.text = profileController.user.value!.phone ?? '';
      birthday.text = profileController.user.value!.birthDay ?? '';
    }
    update();
  }

  @override
  void onInit() {
    addInitialValues();
    super.onInit();
  }
}
