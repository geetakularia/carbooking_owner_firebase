import 'package:car_booking_owner/Classes/manage_data.dart';
import 'package:car_booking_owner/Components/Buttons/SimpleButton.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/VechicleLocal_data.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? selectedCategory;
  Map<String, dynamic> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    if (VehicleLocalData.vehicleDataFilter.isNotEmpty) {
      selectedCategory = VehicleLocalData.vehicleDataFilter.first.keys.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> vehicleData = VehicleLocalData.vehicleDataFilter;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      insetPadding: EdgeInsets.all(15.sp),
      child: Container(
        padding: EdgeInsets.all(10.0.sp),
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 1,
                    child: ScrollConfiguration(
                      behavior: ScrollBehavior().copyWith(overscroll: false),
                      child: ListView.builder(
                        itemCount: vehicleData.length,
                        itemBuilder: (context, index) {
                          String key = vehicleData[index].keys.first;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = key;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0.h),
                              child: Text(
                                key,
                                style: manageData.appTextTheme.fs14Normal,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.grey),
                  Flexible(
                    flex: 2,
                    child: _buildCategoryOptions(
                        selectedCategory ?? vehicleData.first.keys.first,
                        vehicleData,
                        manageData),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SimpleButton(
                title: languageconst.save.tr,
                onPressed: () {
                  // print(selectedOptions);
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryOptions(
    String category,
    List<Map<String, dynamic>> vehicleData,
    ConstantSheet manageData,
  ) {
    var categoryData =
        vehicleData.firstWhere((data) => data.keys.first == category);
    print("-----------");
    print(categoryData);
    print("-----------");
    List<String> values = List<String>.from(categoryData[category]);
    print(values);
    return ScrollConfiguration(
      behavior: ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        // padding: EdgeInsets.symmetric(
        //     horizontal: 10.0.w,
        //     ),
        itemCount: values.length,
        itemBuilder: (context, index) {
          String value = values[index];
          bool isSelected = selectedOptions[category]?.contains(value) ?? false;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: manageData.appTextTheme.fs14Normal,
                ),
                Checkbox(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  splashRadius: 0.0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  checkColor: Colors.white,
                  activeColor: manageData.appColors.primary,
                  value: isSelected,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      if (newValue == true) {
                        if (selectedOptions[category] == null) {
                          selectedOptions[category] = [];
                        }
                        selectedOptions[category]?.add(value);
                      } else {
                        selectedOptions[category]?.remove(value);
                      }
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
