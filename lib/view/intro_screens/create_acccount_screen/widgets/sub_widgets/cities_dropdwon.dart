import 'package:fizz/app_imports.dart';
import 'package:fizz/controller/cities_controller.dart';
import 'package:fizz/models/cities_model.dart';

class CitiesDropDown extends StatelessWidget {
  const CitiesDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CitiesController(),
      builder: (controller) => Obx(
        () => controller.stages.value == CitiesControllerStages.loading
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
                      AppAssets.city,
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: DropdownButton<City>(
                        underline: SizedBox(),
                        isExpanded: true,
                        hint: Text('المدينة'),
                        value: Get.find<CreateAccountController>()
                            .selectedCity
                            .value,
                        items: controller.citiesResponse.value!.cities
                            .map((City city) {
                          return DropdownMenuItem<City>(
                            value: city,
                            child: Text(city.name),
                          );
                        }).toList(),
                        onChanged: (City? newCity) {
                          Get.find<CreateAccountController>()
                              .selectedCity
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
