import 'package:fizz/app_imports.dart';

class ImagePickerController extends GetxController {
  XFile? personalImageFile;
  XFile? licenseImageFile;

  Future captureImage(
      context, ImageSource imageSource, String imageType) async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(source: imageSource);
      if (pickedFile != null) {
        if (imageType == 'personal') {
          personalImageFile = pickedFile;
          Get.find<CreateAccountController>().personalImage!.value =
              personalImageFile;
        } else if (imageType == 'license') {
          licenseImageFile = pickedFile;
          Get.find<CreateAccountController>().licenseImage!.value =
              licenseImageFile;
        }
      }
      update(); // Update the UI after capturing the image
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void resetImages() {
    personalImageFile = null;
    licenseImageFile = null;
    update();
  }

  void showPicker(BuildContext context, String imageType) async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading:
                      Icon(Icons.photo_library, color: AppColors.primaryColor),
                  title: const Text('المعرض'),
                  onTap: () {
                    captureImage(context, ImageSource.gallery, imageType);
                  },
                ),
                ListTile(
                  leading:
                      Icon(Icons.photo_camera, color: AppColors.primaryColor),
                  title: const Text('الكاميرا'),
                  onTap: () {
                    captureImage(context, ImageSource.camera, imageType);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
