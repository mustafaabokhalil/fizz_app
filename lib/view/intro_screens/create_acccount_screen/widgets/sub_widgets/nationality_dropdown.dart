import 'package:fizz/app_imports.dart';
import 'package:fizz/controller/nationality_controller.dart';
import 'package:fizz/models/nationality_model.dart';

class NationalityDropdown extends StatelessWidget {
  const NationalityDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NationalityController(),
      builder: (controller) => Obx(
        () => controller.stages.value == NationalityControllerStages.loading
            ? SizedBox()
            : Container(
                width: 1.sw,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.nationality,
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: DropdownButton<Nationalities>(
                        underline: SizedBox(),
                        isExpanded: true,
                        hint: Text('الجنسيه'),
                        value: Get.find<CreateAccountController>()
                            .selectedNationalities
                            .value,
                        items: controller.citiesResponse.value!.nationalities
                            .map((Nationalities city) {
                          return DropdownMenuItem<Nationalities>(
                            value: city,
                            child: Text(city.name),
                          );
                        }).toList(),
                        onChanged: (Nationalities? newCity) {
                          Get.find<CreateAccountController>()
                              .selectedNationalities
                              .value = newCity;
                        },
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 10.w),
              ),
      ),
    );
  }
}
