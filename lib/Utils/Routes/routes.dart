import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/Views/Authentication/CreatePassowrd_screen.dart';
import 'package:car_booking_owner/Views/Authentication/ForgetScreen.dart';
import 'package:car_booking_owner/Views/Authentication/Login_screen.dart';
import 'package:car_booking_owner/Views/Authentication/OtpScreen.dart';
import 'package:car_booking_owner/Views/BottomNavigationBar/Bottomnavbar_screen.dart';
import 'package:car_booking_owner/Views/Screens/Add%20Vehicle/Addvehicle_screen.dart';
import 'package:car_booking_owner/Views/Screens/Add%20Vehicle/Mercedes_benz_screen.dart';
import 'package:car_booking_owner/Views/Screens/Add%20Vehicle/Thumbnail_screen.dart';
import 'package:car_booking_owner/Views/Screens/Bookings/BookingDetailsScreen.dart';
import 'package:car_booking_owner/Views/Screens/Bookings/BookingScreen.dart';
import 'package:car_booking_owner/Views/Screens/Home/BookingSeeAll.dart';
import 'package:car_booking_owner/Views/Screens/Home/Home_screen.dart';
import 'package:car_booking_owner/Views/Screens/Home/Notification_screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Faq/Addquestion.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Offer/AddOfferDetails_screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Offer/Add_offer_Screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Payment_Method/Addcard_screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Coupon_screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Faq/Faq_Screen.dart';
import 'package:car_booking_owner/Views/Screens/Home/RentalCarSeeAll.dart';
import 'package:car_booking_owner/Views/Screens/Home/ReviewScreen.dart';

import 'package:car_booking_owner/Views/Screens/Setting/Help&Support/CustomerService_screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Help&Support/DeleteAccount_screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Help&Support/Help&support_Screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Language_Screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Notificationsetting_screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Payment_Method/Paymentmethod_screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Privacy&policy.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Profile_screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Setting_screen/Setting_screen.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Terms&condition.dart';
import 'package:car_booking_owner/Views/Screens/Setting/offer/Offer_screen.dart';
import 'package:car_booking_owner/Views/Screens/Vehicles/CarPreview.dart';
import 'package:car_booking_owner/Views/Screens/Vehicles/EditVehicleScreen.dart';
import 'package:car_booking_owner/Views/Screens/Vehicles/PhotoVideoScreen.dart';
import 'package:car_booking_owner/Views/Screens/Vehicles/VehiclesScreen.dart';
import 'package:car_booking_owner/Views/Screens/Vehicles/VideoPlayer.dart';
import 'package:car_booking_owner/Views/Screens/Setting/Transactions/Transactions_screen.dart';
import 'package:get/get.dart';

import '../../Views/OnBoarding/Onboarding_Screen.dart';
import '../../Views/SplashScreen/Splash_Screen.dart';

final List<GetPage<dynamic>> appRoutes = [
  GetPage(
    name: RoutesName.splash,
    page: () => Splash_Screen(),
  ),
  GetPage(
    name: RoutesName.Home_screen,
    page: () => Home_screen(),
  ),
  GetPage(
    name: RoutesName.BottomScreen,
    page: () => BottomScreen(),
  ),
  GetPage(
    name: RoutesName.onboarding,
    page: () => Onboarding_Screen(),
  ),
  GetPage(
    name: RoutesName.login_screen,
    page: () => Login_screen(),
  ),
  GetPage(
    name: RoutesName.forget_screen,
    page: () => ForgetScreen(),
  ),
  GetPage(
    name: RoutesName.setting,
    page: () => Setting_screen(),
  ),
  GetPage(
    name: RoutesName.booking,
    page: () => BookingScreen(),
  ),
  GetPage(
    name: RoutesName.AddOfferDetails,
    page: () => AddOfferDetails_screen(),
  ),
  GetPage(
    name: RoutesName.addoffer,
    page: () => Add_offer_screen(),
  ),
  GetPage(
    name: RoutesName.offer,
    page: () => OfferScreen(),
  ),
  GetPage(
    name: RoutesName.otp_screen,
    page: () => OtpScreen(),
  ),
  GetPage(
    name: RoutesName.vehicle,
    page: () => VehiclesScreen(),
  ),
  GetPage(
    name: RoutesName.helpsupport,
    page: () => Helpsupport_screen(),
  ),
  GetPage(
    name: RoutesName.language,
    page: () => Language_screen(),
  ),
  GetPage(
    name: RoutesName.addquestion,
    page: () => Addquestion_screen(),
  ),
  GetPage(
    name: RoutesName.faq_screen,
    page: () => Faq_screen(),
  ),
  GetPage(
    name: RoutesName.deleteaccount,
    page: () => Deleteaccount_Screen(),
  ),
  GetPage(
    name: RoutesName.customerService,
    page: () => CustomerService_screen(),
  ),
  GetPage(
    name: RoutesName.mercedesbenz_screen,
    page: () => Mercedesbenz_screen(),
  ),
  GetPage(
    name: RoutesName.notification,
    page: () => Notification_screen(),
  ),
  GetPage(
    name: RoutesName.thumbnail_screen,
    page: () => Thumbnail_screen(),
  ),
  GetPage(
    name: RoutesName.termsandcondition,
    page: () => TermsAndConditionScreen(),
  ),
  GetPage(
    name: RoutesName.privacypolicy,
    page: () => Privacypolicy_screen(),
  ),
  GetPage(
    name: RoutesName.paymentmethod,
    page: () => Paymentmethod_screen(),
  ),
  GetPage(
    name: RoutesName.addvehicle,
    page: () => Addvehicle_screen(),
  ),
  GetPage(
    name: RoutesName.notificationsetting,
    page: () => NotificationSetting_screen(),
  ),
  GetPage(
    name: RoutesName.transactions,
    page: () => Transactions_screen(),
  ),
  GetPage(name: RoutesName.addbankcard, page: () => AddBankCard_screen()),
  GetPage(
    name: RoutesName.coupon,
    page: () => Coupon_scrren(),
  ),
  GetPage(
    name: RoutesName.profile,
    page: () => Profile_screen(),
  ),
  GetPage(
    name: RoutesName.CreatePassword_Screen,
    page: () => CreatePassword_Screen(),
  ),
  GetPage(
    name: RoutesName.CarPreviewScreen,
    page: () => CarPreviewScreen(),
  ),
  GetPage(
    name: RoutesName.PhotovideoScreen,
    page: () => PhotovideoScreen(),
  ),
  GetPage(
    name: RoutesName.BookingDetailsScreen,
    page: () => BookingDetailsScreen(),
  ),
  GetPage(
    name: RoutesName.EditVehiclesScreen,
    page: () => EditVehiclesScreen(),
  ),
  GetPage(
    name: RoutesName.VideoScreen,
    page: () => VideoScreen(),
  ),
  GetPage(
    name: RoutesName.BookingSeeAllScreen,
    page: () => BookingSeeAllScreen(),
  ),
  GetPage(
    name: RoutesName.RentalCarSeeAllScreen,
    page: () => RentalCarSeeAllScreen(),
  ),
  GetPage(
    name: RoutesName.ReviewScreen,
    page: () => ReviewScreen(),
  ),
];
