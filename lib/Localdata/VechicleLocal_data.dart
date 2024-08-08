import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:get/get.dart';

class VehicleLocalData {
  static List<Map<String, dynamic>> vehicleDataFilter = [
    {
      languageconst.category.tr: [
        "SUV",
        "Sports",
        "Coupe",
        "Sedan",
        "Scorpio",
        "Casual",
        "Vintage"
      ],
    },
    {
      languageconst.priceRate.tr: ["Per Hourly", "Per Day", "Per Kilometer"],
    },
    {
      languageconst.fuel.tr: ["Petrol", "Diesel", "Gas"],
    },
    {
      languageconst.transmission.tr: ["Automatic", "Manual"],
    },
    {
      languageconst.seating.tr: ["2", "4", "6", "8"],
    },
  ];
}






