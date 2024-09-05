import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/SettingModel.dart';
import 'package:car_booking_owner/Models/onboarding_model.dart';
import 'package:car_booking_owner/main.dart';
import 'package:get/get.dart';

class Localdata {
  ///////////============onboardingitems==========

  static List<Onboarding_Model> onboardingitems = [
    Onboarding_Model(
        languageconst.welcomeToCCRental.tr,
        manageData.appimage.onboarding1,
        languageconst.simplifyYourCarRentalBusiness.tr,
        languageconst.manageYourFleet.tr),
    Onboarding_Model(
        languageconst.manageYourFleetSubtitle.tr,
        manageData.appimage.onboarding2,
        languageconst.keepTrackOfVehicles.tr,
        languageconst.easilyAddEditMonitorCars.tr),
    Onboarding_Model(
        languageconst.seamlessBookingManagement.tr,
        manageData.appimage.onboarding3,
        languageconst.stayOnTopOfBookings.tr,
        languageconst.viewAndManageBookings.tr)
  ];
  static List<Map<String, dynamic>> homeslideritems = [
    {
      "image": manageData.appimage.wedding_img,
      "rupess": "₹1200 ",
      "discount": " (Save 10%)",
      "subtitle": "Get  High Discounts on wedding car’s + Decoration",
      "title": "Wedding Deals"
    },
    {
      "image": manageData.appimage.wedding_img,
      "rupess": "₹1200",
      "discount": " (Save 10%)",
      "subtitle": "Get  High Discounts on wedding car’s + Decoration",
      "title": "Wedding Deals"
    },
    {
      "image": manageData.appimage.wedding_img,
      "rupess": "₹1200",
      "discount": " (Save 10%)",
      "subtitle": "Get  High Discounts on wedding car’s + Decoration",
      "title": "Wedding Deals"
    },
  ];
/////========================Addvehicledata==============
//////++++++++++------carMakeItems
  static List<String> carMakeItems = [
    "Mercedes",
    "Maruti Suzuki",
    "Mahindra",
    "Volkswagen",
    "Nissan",
    "Casual",
    "Vintage"
  ];
//////++++++++++------seatingcapacityItems

  static List<String> seatingcapacityItems = ["2", "3", "4", "5"];
//////++++++++++------categoryItems

  static List<String> categoryItems = [
    "SUV",
    "Sedan",
    "Sports",
    "Coupe",
    "Scorpio",
    "Casual",
    "Vintage"
  ];
//////++++++++++------yearItems

  static List<String> yearItems = ["2001", "2002", "2003", "2023"];
//////++++++++++------fuelitems

  static List<String> fuelItems = ["Petrol", "Diesel", "Gas"];
//////++++++++++------transmissionItems

  static List<String> transmissionItems = [
    "Auto",
    "Manual",
  ];
//////++++++++++------carmodelItems

  static List<String> carmodelItems = ["X Classic", "AGT XX", "Punch"];
/////========================Packagetypedata==============
  ///
  static List<String> packagedata = ["Per Hour", "Per Day ", "Per Week "];
/////========================amountdata==============

/////========================cardata==============

  static List<Map<String, dynamic>> car_data = [
    {"car": "Total Car’s", "ammount": "120"},
    {"car": "Upcoming", "ammount": "21"},
    {"car": "Ongoing", "ammount": "17"},
    {"car": "Completed", "ammount": "30"},
  ];

  //////++++++++++------addoffer
  static List<String> addoffer = [
    "General Discount",
    "First-Time Customer Discount",
    "Tiered Discount",
    "Bundle Discount",
  ];
  //////++++++++++------offertype
  static List<String> bundleType = [
    "Yearlly",
    "Weekly",
    "Daily",
  ];
}

/////========================Generaldata==============

class Generaldata {
  static List<SettingModel> categoriesData = [
    SettingModel(
      id: "Profile",
      title: languageconst.profile.tr,
      icon: manageData.appsvgimg.profile,
    ),
    SettingModel(
      id: "Bookings",
      title: languageconst.myBookings,
      icon: manageData.appsvgimg.booking,
    ),
    SettingModel(
      id: "Transaction",
      title: languageconst.Transaction,
      icon: manageData.appsvgimg.transaction,
    ),
    SettingModel(
      id: "Notifications",
      title: languageconst.notifications,
      icon: manageData.appsvgimg.notification,
    ),
    SettingModel(
      id: "Language",
      title: languageconst.language,
      icon: manageData.appsvgimg.language,
    ),
    SettingModel(
      id: "Coupon",
      title: languageconst.coupon,
      icon: manageData.appsvgimg.coupons,
    ),
    SettingModel(
      id: "offer",
      title: languageconst.Offers,
      icon: manageData.appsvgimg.offer,
    ),
  ];
}
/////========================settingdata==============

class Settingdata {
  static List<SettingModel> categoriesData = [
    SettingModel(
      id: "Payment",
      title: languageconst.paymentMethods,
      icon: manageData.appsvgimg.paymentmethod,
    ),
    SettingModel(
      id: "Privacy",
      title: languageconst.privacyPolicy,
      icon: manageData.appsvgimg.privacy,
    ),
    SettingModel(
      id: "Terms",
      title: languageconst.termsAndConditions,
      icon: manageData.appsvgimg.terms,
    ),
    SettingModel(
      id: "FAQ",
      title: languageconst.faqs,
      icon: manageData.appsvgimg.faq,
    ),
    SettingModel(
      id: "Help",
      title: languageconst.helpAndSupport,
      icon: manageData.appsvgimg.help,
    ),
    SettingModel(
      id: "Logout",
      title: languageconst.logout,
      icon: manageData.appsvgimg.logout,
    ),
  ];
}
/////======================== help&support data==============

class Helpsupportdata {
  static List<SettingModel> helpsupportdata = [
    SettingModel(
      id: "Service",
      title: languageconst.customerServices,
      icon: manageData.appsvgimg.services,
    ),
    SettingModel(
      id: "WhatsApp",
      title: languageconst.whatsApp,
      icon: manageData.appsvgimg.whatsapp,
    ),
    SettingModel(
      id: "deleteaccount",
      title: languageconst.deleteAccount,
      icon: manageData.appsvgimg.delete,
    ),
    SettingModel(
      id: "tollfreenumber",
      title: languageconst.tollFreeNumber,
      icon: manageData.appsvgimg.number,
    ),
  ];
}
/////======================== help&support data==============

class DeleteAccountData {
  static List<Map<String, dynamic>> deleteAccountData = [
    {"tittle": languageconst.noLongerUsesServicePlatform.tr},
    {"tittle": languageconst.foundBetterAlternative.tr},
    {"tittle": languageconst.tooManyEmailNotifications.tr},
    {"tittle": languageconst.difficultNavigationInPlatform.tr},
    {"tittle": languageconst.accountSecurityConcerns.tr},
    {"tittle": languageconst.personalReason.tr},
    {"tittle": languageconst.other.tr},
  ];
}
/////======================== help&support data==============

// class Languagedata {
//   static List<Map<String, dynamic>> languagedata = [
//     {"tittle": "English", "subtitle": "Default Language"},
//     {
//       "tittle": "Hindi",
//       "subtitle": "हिंदी",
//     },
//     {"tittle": "Marathi", "subtitle": "मराठी"},
//     {"tittle": "Gujarati", "subtitle": "गुजराती"},
//     {"tittle": "Tamil", "subtitle": "तमिल"},
//     {"tittle": "Urdu", "subtitle": "उर्दू"},
//   ];
// }
/////////=====================class Paymentmethod_data ==========

class Paymentmethod_data {
  static List<Map<String, dynamic>> categoriesData = [
    {
      "icon": manageData.appsvgimg.cash,
      "tittle": languageconst.cashOnDelivery.tr,
      "subtitle": "% ${languageconst.increaseInCharges.tr}"
    },
    {
      "icon": manageData.appsvgimg.visa,
      "tittle": "**** **** **** 4522",
      "subtitle": "${languageconst.expiresOn.tr} 12/02/25 "
    },
    {
      "icon": manageData.appsvgimg.upi,
      "tittle": languageconst.upi.tr,
      "subtitle": languageconst.addUPIID.tr
    },
    {
      "icon": manageData.appsvgimg.paymenticon,
      "tittle": languageconst.paytm.tr,
      "subtitle": languageconst.addMobileNo.tr
    },
    {
      "icon": manageData.appsvgimg.expires,
      "tittle": "**** **** **** 4522",
      "subtitle": "${languageconst.expiresOn.tr} 19/06/26"
    },
  ];
}
