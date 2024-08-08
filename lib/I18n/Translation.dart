import 'package:car_booking_owner/Models/LanguageModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  static LanguageModel english = LanguageModel(
      countrycode: "US", languagecode: "en", languagename: "English");
  static LanguageModel hindi = LanguageModel(
      countrycode: "IN", languagecode: "hi", languagename: "हिंदी");
  static Locale locale = Locale(english.languagecode, english.countrycode);
  static Locale fallbacklocale = locale;

  static final List<LanguageModel> language = [english, hindi];

  @override
  Map<String, Map<String, String>> get keys => {
        english.toString(): languagetype.english,
        hindi.toString(): languagetype.hindi,
      };
}

class languagetype {
  static final Map<String, String> english = {
    /****** onboarding */
    languageconst.welcomeToCCRental: "Welcome to CC Rental",
    languageconst.Skip: "Skip",
    languageconst.simplifyYourCarRentalBusiness:
        "Simplify your car rental business.",
    languageconst.manageYourFleet:
        "Manage your fleet, bookings, and transactions all in one place.",
    languageconst.next: "Next",
    languageconst.seamlessBookingManagement: "Seamless Booking Management",
    languageconst.getStarted: "Get Started",
    languageconst.manageYourFleetSubtitle: "Manage Your Fleet",
    languageconst.keepTrackOfVehicles: "Keep track of all your vehicles ",
    languageconst.easilyAddEditMonitorCars:
        "Easily add, edit, and monitor your cars with detailed information and availability status.",
    languageconst.continueButton: "Continue",
    languageconst.Management: " Management",
    languageconst.stayOnTopOfBookings: "Stay on top of your bookings",
    languageconst.viewAndManageBookings:
        "View and manage new, upcoming, and completed bookings effortlessly.",
    /******** Login */
    languageconst.welcomeBack: "Welcome Back",
    languageconst.gladToSeeYouAgain: "Glad to See you again !",
    languageconst.userName: "User name",
    languageconst.enterUserName: "Enter user name",
    languageconst.password: "Password",
    languageconst.enterYourPassword: "Enter your password",
    languageconst.forgotPassword: "Forgot password ?",
    languageconst.rememberMe: "Remember me",
    languageconst.login: "Login",
    /*******forget password */
    languageconst.forgotPasswordTitle: "Forgot Password",
    languageconst.enterEmailOrMobile:
        "Please enter your email or mobile number so we can sent you the verification code to your filled address ",
    languageconst.emailOrMobile: "Email or mobile ",
    languageconst.backToLogin: "Back to Login",
    /******Verification Step */
    languageconst.verificationStep: "Verification Step",
    languageconst.secondsLeft: "sec left",
    languageconst.verificationCodeSent:
        "we have sent a code to you @8980gmail.com please enter code to verify ",
    languageconst.resendOTP: "Resend OTP ?",
    languageconst.pleaseenterotp: "Please enter your otp",
    languageconst.verify: "Verify",
    /******** new password */
    languageconst.createNewPassword: "Create new password",
    languageconst.enterNewPassword:
        "Please enter your new password for your acccont security",
    languageconst.newPassword: "New password",
    languageconst.confirmPassword: "Confirm password",
    languageconst.save: "Save ",
    /****** pop up */
    languageconst.passwordChangedSuccessfully: "Password Changed Successfully",
    languageconst.pleaseWaitRedirectingToLoginPage:
        "please wait we are taking you to login page",
    /**** Deshboard */
    languageconst.searchForRentalAndCars: "Search for rental & cars",
    languageconst.totalCars: "Total Car’s",
    languageconst.upcoming: "Upcoming",
    languageconst.ongoing: "Ongoing",
    languageconst.completed: "Completed",
    languageconst.revenueGraph: "Revenue Graph",
    languageconst.recentBookings: "Recent Bookings",
    languageconst.seeAll: "see all",
    languageconst.toprentalcar: "Top Rental Cars",
    languageconst.bookingID: "Booking ID",
    languageconst.seeDetails: "see details",
    languageconst.day: "Day",
    languageconst.petrol: "Petrol",
    languageconst.automatic: "Automatic",
    languageconst.auto: "Auto",
    languageconst.seats: "seats",
    languageconst.reviews: "Reviews",
    languageconst.ago: "ago",
    /****** bottom appbar */
    languageconst.home: "Home",
    languageconst.bookings: "Bookings",
    languageconst.vehicles: "Vehicles",
    languageconst.settings: "Settings",
    /***************** notification */
    languageconst.notifications: "Notifications",
    languageconst.searchForMessages: "Search for messages",
    languageconst.booking: "Booking",
    /****** bookings */
    languageconst.searchForBookings: "Search for Bookings",
    languageconst.New: "New",
    languageconst.modify: "Modify",
    languageconst.cancel: "Cancel",
    /**** booking details */
    languageconst.bookingDetails: "Booking Details",
    languageconst.address: "Address",
    languageconst.timeAndDate: "Time & Date",
    languageconst.Date: "Date",
    languageconst.time: "Time",
    languageconst.amount: "Amount",
    languageconst.modeOfPayment: "Mode of Payment",
    languageconst.couponCodeApplied: "Coupon code applied",
    languageconst.reject: "Reject",
    languageconst.accept: "Accept",
    languageconst.total: "Total",
    /****** pop booking 1 */
    languageconst.bookingSuccessfullyAccepted:
        "Booking Has Been Successfully Accepted",
    languageconst.notifyingCustomerPleaseWait:
        "please wait we are notifying our customer",
    /****** pop booking 2 */
    languageconst.areYouSure: "Are you Sure you want to Reject Booking",
    languageconst.no: "No",
    languageconst.yes: "Yes",
    /******* add vehicles step 1*/
    languageconst.addVehicle: "Add Vehicle",
    languageconst.startWithVehicleBasicInfo:
        "Let’s start with the Vehicle Basic Informatation",
    languageconst.step: "Step",
    languageconst.carMake: "Car Make",
    languageconst.chooseCarCompany: "chose your car company",
    languageconst.carModel: "Car Model",
    languageconst.select: "select",
    languageconst.licensePlateNumber: "License Plate Number",
    languageconst.enter: "enter",
    languageconst.transmission: "Transmission",
    languageconst.seatingCapacity: "Seating Capacity",
    languageconst.fuel: "Fuel",
    languageconst.category: "Category",
    languageconst.manufactureYear: "Manufacture year",
    languageconst.selectCarCategory: "select car category",
    languageconst.addColorVariant: "Add Color Variant",
    languageconst.black: "Black",
    languageconst.grey: "Grey",
    languageconst.Destination: "Destination",
    /******* add vehicle next  step 2*/
    languageconst.addBookingPriceAndDescription:
        "Now Add your Booking price for the customer’s & description",
    languageconst.description: "Description",
    languageconst.writeCarIntro: "write something about  your car as Intro",
    languageconst.createPackage: "Create Package",
    languageconst.packageType: "Package Type",
    languageconst.perHour: "Per Hour",
    /******* add vehicle next step 3*/
    languageconst.addCarThumbnailsAndImages:
        "Add car thumbnails and multiple images ",
    languageconst.thumbnail: "Thumbnail",
    languageconst.dragOrDropImage:
        "Drag or Drop the Image from  system or Browse ?",
    languageconst.addPhotos: "Add photos",
    languageconst.addVideos: "Add Videos",
    languageconst.uploadVehicle: "Upload Vehicle ",
    /******** pop upload */
    languageconst.upload: "Upload",
    languageconst.browse: "Browse",
    languageconst.uploadimagevideo:
        "Select your Image / Video form your Gallery",
    languageconst.fileSizeLimitNote: "please make sure file size should be",
    languageconst.orless: " or less",
    /****pop  Upload Vehicle  */
    languageconst.vehicleAddedSuccessfully: "Vehicle Added Sucessfully",
    languageconst.uploadingVehicleListPleaseWait:
        "please wait we are uploading your vehicle in list",
    /****Vehicles */
    languageconst.addCars: "Add Car’s",
    /******** vehicle filter */
    languageconst.priceRate: "Price Rate",
    languageconst.seating: "Seating",
    languageconst.suv: "SUV",
    languageconst.sports: "Sports",
    languageconst.coupon: "Coupon",
    languageconst.sedan: "Sedan",
    languageconst.scorpio: "Scorpio",
    languageconst.casual: "Casual",
    languageconst.vintage: "Vintage",
    languageconst.perHourly: "Per Hourly",
    languageconst.perDay: "Per Day",
    languageconst.perKilometer: "Per Kilometer",
    languageconst.diesel: "Diesel",
    languageconst.gas: "Gas ",
    languageconst.manual: "Manual",

    /******** car perview */

    languageconst.introduction: "Introduction",
    languageconst.carDetails: "Car Details",
    languageconst.color: "Color",
    languageconst.licensePlateNo: "License Plate no",
    languageconst.similarVehicles: "Similar Vehicles",
    languageconst.edit: "Edit",
    /******** delete */
    languageconst.confirmDeleteVehicle:
        "Are you Sure you want to Delete Vehicle ",
    languageconst.deleteWarningPolicy:
        "all vehicle data will be delete for system as per the Policy",
    /** upload pop */
    languageconst.video: "Video",
    languageconst.photos: "Photos",
    /******* edit screen */
    languageconst.basicInformation: "Basic Information",
    languageconst.editPackage: "Edit Package",
    languageconst.showcases: "Showcases",
    languageconst.showcaseCarPhotos: "Showcase car photos",
    languageconst.noPhotoUploaded: "No photo Uploaded Right now !",
    languageconst.addNow: "Add Now",
    languageconst.showcaseCarVideos: "Showcase car Videos",
    languageconst.availabilityStatus: "Availability  Status",
    languageconst.unavailable: "Unavailable",
    languageconst.available: "Available",
    languageconst.saveChanges: "Save Changes",
    languageconst.letstartvehiclebasic:
        "Let's start with the Vehicle Basic Informatation",
    /********* setting*/
    languageconst.general: "General",
    languageconst.profile: "Profile",
    languageconst.myBookings: "My Bookings",
    languageconst.Transaction: "Transaction",
    languageconst.myTransaction: "My Transaction",
    languageconst.Latest: "Latest",
    languageconst.Older: "Older",
    languageconst.language: "Language",
    languageconst.addCoupons: "Add Coupons",
    languageconst.settingsPrivacy: "Settings & Privacy",
    languageconst.paymentMethods: "Payment Methods",
    languageconst.privacyPolicy: "Privacy Policy",
    languageconst.termsAndConditions: "Term’s and  Condition",
    languageconst.faqs: "FAQ’s",
    languageconst.helpAndSupport: "Help & Support",
    languageconst.logout: "Logout",
    /**** logout pop */
    languageconst.confirmLogout: "Are you Sure you want to Logout ",
    /**** profile */

    languageconst.addNecessaryDetails:
        "Please check and add your necessary details for your booking Profile",
    languageconst.name: "Name",
    languageconst.email: "Email",
    languageconst.defaultAddress: "Address ( Default )",
    /****** Notification Setting */
    languageconst.notificationSettings: "Notification Setting",
    languageconst.inAppNotification: "In App Notifcation",
    languageconst.receiveNotificationWithinApp: "Get Notification Within App",
    languageconst.systemNotification: "System Notification",
    languageconst.receiveNotificationOutsideApp:
        "Get Notification outside the App",
    languageconst.behaviour: "Behaviour",
    languageconst.allowWakeDeviceNotification:
        "Allow Notification to wake the Device",
    languageconst.disableNotificationVibration:
        "Disable Notification Vibration",
    languageconst.doNotDisturb: "Do Not Disctrub",

    /********Language */
    languageconst.searchForLanguages: "Search for languages",
    languageconst.hindi: "Hindi",
    /*********Add Coupons */
    languageconst.addCouponCode: "Add Coupon Code",
    languageconst.addCouponDescription:
        "Add your coupon title and price of coupon for the customers to redeem in their account",
    languageconst.couponCode: "Coupon Code",
    languageconst.enterCodeHere: "Enter code here",
    languageconst.maxDiscount: "Max Discount",
    languageconst.allowedUses: "Allowed uses",
    languageconst.addCoupon: "Add Coupon",
    /********pop */
    languageconst.couponCreatedSuccessfully: "Coupon Code Created Successfully",
    languageconst.configuringSerialNumberPleaseWait:
        "please wait we are configuring the Serial no",
    /******* Payment Methods*/
    languageconst.currentMethod: "Current Method",
    languageconst.cash: "Cash ",
    languageconst.defaultMethod: "Default Method",
    languageconst.choosePaymentMethod:
        "Chose your desired payment method for online payments in which you are comfortable or add your cards  ",
    languageconst.cashOnDelivery: "Cash on Delivery",
    languageconst.increaseInCharges: "% increase in charges ",
    languageconst.expiresOn: "Expires on",
    languageconst.upi: "UPI",
    languageconst.addUPIID: "add your UIP ID",
    languageconst.paytm: "Paytm",
    languageconst.addMobileNo: "add your mobile no",
    languageconst.addCard: "Add  Card",
    languageconst.mobile: "Mobile",
    /****** Add Bank Card */
    languageconst.addBankCard: "Add Bank Card",
    languageconst.addNewCard: "Add new card",
    languageconst.streamlineCheckoutProcess:
        "Streamline your checkout process by adding a new card for future transactions. Your card information is secured with advanced encryption technology.",
    languageconst.cardNo: "Card no",
    languageconst.expiryDate: "Expiry Date",
    languageconst.CVV: "CVV",
    languageconst.cardholdersName: "Cardholder’s name",
    languageconst.enterCardholdersName: "enter cardholder’s full name",
    languageconst.addMyCard: "Add My card",
    languageconst.transactionID: "Transaction ID",
    /*********pop */
    languageconst.bankCardAddedSuccessfully: "Bank Card Added Successfully",
    languageconst.takingUpRequiredDetailsPleaseWait:
        "please wait we are taking up Required detials",
    /*****Help & Support */
    languageconst.connectWithExpertsForHelp:
        "You can connect our experts and support for your conformations and Hleps",
    languageconst.customerServices: "Customer Services",
    languageconst.whatsApp: "WhatsApp",
    languageconst.deleteMyAccount: "Delete My Account",
    languageconst.tollFreeNumber: "Toll Free Number ",
    /******Delete Account */
    languageconst.deleteAccount: "Delete Account",
    languageconst.provideReasonForDeletion:
        "If you want to delete Account you are prompted to provide reason for deleting account ",
    languageconst.noLongerUsesServicePlatform:
        "No Longer Uses the Service Platform",
    languageconst.foundBetterAlternative: "Found a better alternative",
    languageconst.tooManyEmailNotifications: "Too many email / notification",
    languageconst.difficultNavigationInPlatform:
        "Difficult Navigation in Platform",
    languageconst.accountSecurityConcerns: "Account Security Concerns",
    languageconst.personalReason: "Personal Reason ",
    languageconst.other: "Other",
    "type here": "type here",
    /******* delete pop */

    languageconst.deleteAccountPermanently:
        "You Want to Delete your Account Permanently",
    languageconst.understandConsequencesOfDeletingAccount:
        "Ensuring that the user understands consequences to deleting their Account",
    languageconst.lossOfData: "loss of Data",
    languageconst.keepAccount: "Keep Account",
    /***************************************************************** */
    /*******Offer’s */
    languageconst.Offers: "Offer’s",
    languageconst.offercreatedcustomer:
        "here’s your Offer’s created for the customer’s",
    /************ */
    languageconst.addoffers: "Add Offer’s",
    languageconst.selectoffertype: "select offer type",
    languageconst.selecttypeofferwantcreate:
        "Select type of offer for the customer’s you want to create",
    /*********** */
    languageconst.generaldiscount: "General Discount",
    languageconst.firsttimediscount: "First-Time Customer Discount",
    languageconst.tiereddiscount: "Tiered Discount",
    languageconst.bundlediscont: "Bundle Discount",
    /**********Add Offer Details */
    languageconst.addofferdetails: "Add Offer Details",
    languageconst.addyourofferdetails:
        "Add your Offer details and thumbnail for customers",
    languageconst.showwithbanner: "Show with banner",
    languageconst.aboutdiscount: "About Discount",
    languageconst.Title: "Title",
    languageconst.entercode: "Enter Code",
    languageconst.writeshortdescription: "write a short description ",
    languageconst.Benefits: "Benefits",
    languageconst.DiscountValue: "Discount Value",
    languageconst.DiscountUnit: "Discount Unit",
    languageconst.ValidForm: "Valid Form",
    languageconst.ValidTill: "Valid Till",
    languageconst.UsageBenifits: "Usage Benifits",
    languageconst.UsesperCustomer: "Uses per Customer",
    languageconst.Reset: "Reset",
    languageconst.UploadData: "Upload Data",
    languageconst.SpendThreshold: "Spend Threshold",
    languageconst.minimumspentvalue: "minimum spent value",
    languageconst.SpendValue: "Spend Value",
    languageconst.MinimumSpend: "Minimum Spend",
    /*************Add Question */
    languageconst.addquestion: "Add Question",
    languageconst.addyourquestionanswer: "Add your Question & Answer’s Below",
    languageconst.Question: "Question",
    languageconst.enterquestionhere: "Enter your question here",
    languageconst.Answer: "Answer",
    languageconst.enteranswerhere: "Enter your answer here",
    languageconst.questionaddedsuccessfully: "Question Added Successfully",
    languageconst.pleasewaitcustomerapp:
        "please wait we are updating in Customer’s app",
    languageconst.deletefaq: "Are you Sure you want to Delete FAQ’s Question",
    languageconst.pleaseconfiguringcustomerapp:
        "please wait we are configuring data form customer’s app",
    languageconst.Delete: "Delete",
    languageconst.discount: "Discount",
    languageconst.View: "View",
    languageconst.TotalUsers: "Total Users",
    languageconst.bundleType: "Bundle Type",
    languageconst.startingat: "Starting at",

    ///********************* */
    languageconst.Promocodeapplied: "Promo code applied",
    languageconst.PaidAmount: "Paid Amount ",
  };

  /**************** hindi */
  static final Map<String, String> hindi = {
    /****** onboarding */
    languageconst.welcomeToCCRental: "CC Rental में आपका स्वागत है",
    languageconst.Skip: "छोडना",
    languageconst.simplifyYourCarRentalBusiness:
        "अपने कार रेंटल व्यवसाय को सरल बनाएं।",
    languageconst.manageYourFleet:
        "अपने बेड़े, बुकिंग और लेन-देन को एक ही स्थान पर प्रबंधित करें।",
    languageconst.next: "अगला",
    languageconst.getStarted: "शुरू करें",
    languageconst.seamlessBookingManagement: "निर्बाध बुकिंग प्रबंधन",
    languageconst.manageYourFleetSubtitle: "अपना बेड़ा प्रबंधित करें",
    languageconst.keepTrackOfVehicles: "अपने सभी वाहनों का ट्रैक रखें",
    languageconst.easilyAddEditMonitorCars:
        "विस्तृत जानकारी और उपलब्धता स्थिति के साथ आसानी से अपनी कारों को जोड़ें, संपादित करें और निगरानी करें।",
    languageconst.continueButton: "जारी रखें",
    languageconst.Management: "प्रबंधन",
    languageconst.stayOnTopOfBookings: "अपनी बुकिंग के शीर्ष पर बने रहें",
    languageconst.viewAndManageBookings:
        "नए, आगामी और पूर्ण बुकिंग को आसानी से देखें और प्रबंधित करें।",
    /******** Login */
    languageconst.welcomeBack: "वापसी पर स्वागत है",
    languageconst.gladToSeeYouAgain: "आपको फिर से देखकर खुशी हुई!",
    languageconst.userName: "उपयोगकर्ता नाम",
    languageconst.enterUserName: "उपयोगकर्ता नाम दर्ज करें",
    languageconst.password: "पासवर्ड",
    languageconst.enterYourPassword: "अपना पासवर्ड दर्ज करें",
    languageconst.forgotPassword: "पासवर्ड भूल गए?",
    languageconst.rememberMe: "मुझे याद रखें",
    languageconst.login: "लॉग इन करें",
    /*******forget password */
    languageconst.forgotPasswordTitle: "पासवर्ड भूल गए",
    languageconst.enterEmailOrMobile:
        "कृपया अपना ईमेल या मोबाइल नंबर दर्ज करें ताकि हम आपके भरे हुए पते पर सत्यापन कोड भेज सकें",
    languageconst.emailOrMobile: "ईमेल या मोबाइल",
    languageconst.backToLogin: "लॉगिन पर वापस जाएं",
    /******Verification Step */
    languageconst.verificationStep: "सत्यापन चरण",
    languageconst.secondsLeft: "सेकंड बचे हैं",
    languageconst.verificationCodeSent:
        "हमने आपके डिवाइस पर एक सत्यापन कोड भेजा है।",
    languageconst.resendOTP: "ओटीपी पुनः भेजें?",
    languageconst.verify: "सत्यापित करें",
    languageconst.pleaseenterotp: "कृपया अपना ओटीपी दर्ज करें",
    /******** new password */
    languageconst.createNewPassword: "नया पासवर्ड बनाएं",
    languageconst.enterNewPassword:
        "अपने खाते की सुरक्षा के लिए कृपया अपना नया पासवर्ड दर्ज करें",
    languageconst.newPassword: "नया पासवर्ड",
    languageconst.confirmPassword: "पासवर्ड की पुष्टि करें",
    languageconst.save: "सहेजें",
    /****** pop up */
    languageconst.passwordChangedSuccessfully: "पासवर्ड सफलतापूर्वक बदला गया",
    languageconst.pleaseWaitRedirectingToLoginPage:
        "कृपया प्रतीक्षा करें, हम आपको लॉगिन पृष्ठ पर ले जा रहे हैं",
    /**** Deshboard */
    languageconst.searchForRentalAndCars: "किराया और कारों के लिए खोजें",
    languageconst.totalCars: "कुल कारें",
    languageconst.upcoming: "आगामी",
    languageconst.ongoing: "चल रहा है",
    languageconst.completed: "पूरा हुआ",
    languageconst.revenueGraph: "राजस्व ग्राफ",
    languageconst.recentBookings: "हाल की बुकिंग",
    languageconst.seeAll: "सभी देखें",
    languageconst.toprentalcar: "शीर्ष किराये की कारें",
    languageconst.bookingID: "बुकिंग आईडी",
    languageconst.seeDetails: "विवरण देखें",
    languageconst.day: "दिन",
    languageconst.petrol: "पेट्रोल",
    languageconst.automatic: "स्वचालित",
    languageconst.auto: "ऑटो",
    languageconst.seats: "सीटें",
    languageconst.reviews: "समीक्षाएं",
    languageconst.ago: "पहले",
    /****** bottom appbar */
    languageconst.home: "होम",
    languageconst.bookings: "बुकिंग",
    languageconst.vehicles: "वाहन",
    languageconst.settings: "सेटिंग्स",
    /***************** notification */
    languageconst.notifications: "सूचनाएं",
    languageconst.searchForMessages: "संदेशों के लिए खोजें",
    languageconst.booking: "बुकिंग",
    /****** bookings */
    languageconst.searchForBookings: "बुकिंग के लिए खोजें",
    languageconst.New: "नई",
    languageconst.modify: "संशोधित करें",
    languageconst.cancel: "रद्द करें",
    /**** booking details */
    languageconst.bookingDetails: "बुकिंग विवरण",
    languageconst.address: "पता",
    languageconst.timeAndDate: "समय और तिथि",
    languageconst.time: "समय",
    languageconst.Date: "तिथि",
    languageconst.amount: "राशि",
    languageconst.modeOfPayment: "भुगतान का तरीका",
    languageconst.couponCodeApplied: "कूपन कोड लागू",
    languageconst.reject: "अस्वीकार करें",
    languageconst.accept: "स्वीकार करें",
    languageconst.total: "कुल",
    /****** pop booking 1 */
    languageconst.bookingSuccessfullyAccepted:
        "बुकिंग सफलतापूर्वक स्वीकार की गई",
    languageconst.notifyingCustomerPleaseWait:
        "कृपया प्रतीक्षा करें, हम अपने ग्राहक को सूचित कर रहे हैं",
    /****** pop booking 2 */
    languageconst.areYouSure:
        "क्या आप सुनिश्चित हैं कि आप बुकिंग को अस्वीकार करना चाहते हैं",
    languageconst.no: "नहीं",
    languageconst.yes: "हाँ",
    /******* add vehicles step 1*/
    languageconst.addVehicle: "वाहन जोड़ें",
    languageconst.startWithVehicleBasicInfo:
        "आइए वाहन की बुनियादी जानकारी से शुरू करें",
    languageconst.step: "चरण",
    languageconst.carMake: "कार मेक",
    languageconst.chooseCarCompany: "अपनी कार कंपनी चुनें",
    languageconst.carModel: "कार मॉडल",
    languageconst.select: "चुनें",
    languageconst.licensePlateNumber: "लाइसेंस प्लेट नंबर",
    languageconst.enter: "दर्ज करें",
    languageconst.transmission: "ट्रांसमिशन",
    languageconst.seatingCapacity: "बैठने की क्षमता",
    languageconst.fuel: "ईंधन",
    languageconst.category: "श्रेणी",
    languageconst.manufactureYear: "निर्माण वर्ष",
    languageconst.selectCarCategory: "कार श्रेणी चुनें",
    languageconst.addColorVariant: "रंग वैरिएंट जोड़ें",
    languageconst.black: "काला",
    languageconst.grey: "धूसर",
    languageconst.Destination: "गंतव्य",
    /******* add vehicle next step 2*/
    languageconst.addBookingPriceAndDescription:
        "अब अपने ग्राहकों के लिए बुकिंग मूल्य और विवरण जोड़ें",
    languageconst.description: "विवरण",
    languageconst.writeCarIntro: "अपनी कार के बारे में परिचय लिखें",
    languageconst.createPackage: "पैकेज बनाएं",
    languageconst.packageType: "पैकेज प्रकार",
    languageconst.perHour: "प्रति घंटा",
    /******* add vehicle next step 3*/
    languageconst.addCarThumbnailsAndImages: "कार थंबनेल और कई छवियां जोड़ें",
    languageconst.thumbnail: "थंबनेल",
    languageconst.dragOrDropImage:
        "सिस्टम से छवि खींचें या छोड़ें या ब्राउज़ करें?",
    languageconst.addPhotos: "फोटो जोड़ें",
    languageconst.addVideos: "वीडियो जोड़ें",
    languageconst.uploadVehicle: "वाहन अपलोड करें",
    /******** pop upload */
    languageconst.upload: "अपलोड करें",
    languageconst.fileSizeLimitNote: "कृपया सुनिश्चित करें कि फ़ाइल का आकार",
    languageconst.orless: " या उससे कम हो",
    languageconst.browse: "ब्राउज़",
    languageconst.uploadimagevideo: "अपनी गैलरी से अपनी छवि/वीडियो चुनें",
    /****pop Upload Vehicle */
    languageconst.vehicleAddedSuccessfully: "वाहन सफलतापूर्वक जोड़ा गया",
    languageconst.uploadingVehicleListPleaseWait:
        "कृपया प्रतीक्षा करें, हम आपकी वाहन सूची अपलोड कर रहे हैं",
    /****Vehicles */
    languageconst.addCars: "कार जोड़ें",
    /******** vehicle filter */
    languageconst.priceRate: "मूल्य दर",
    languageconst.seating: "बैठने की",
    languageconst.suv: "एसयूवी",
    languageconst.sports: "स्पोर्ट्स",
    languageconst.coupon: "कूपन",
    languageconst.sedan: "सेडान",
    languageconst.scorpio: "स्कॉर्पियो",
    languageconst.casual: "कैजुअल",
    languageconst.vintage: "विंटेज",
    languageconst.perHourly: "प्रति घंटा",
    languageconst.perDay: "प्रति दिन",
    languageconst.perKilometer: "प्रति किलोमीटर",
    languageconst.diesel: "डीजल",
    languageconst.gas: "गैस",
    languageconst.manual: "मैनुअल",
    /******** car perview */
    languageconst.introduction: "परिचय",
    languageconst.carDetails: "कार विवरण",
    languageconst.color: "रंग",
    languageconst.licensePlateNo: "लाइसेंस प्लेट संख्या",
    languageconst.similarVehicles: "समान वाहन",
    languageconst.edit: "संपादित करें",
    /******** delete */
    languageconst.confirmDeleteVehicle:
        "क्या आप सुनिश्चित हैं कि आप वाहन को हटाना चाहते हैं",
    languageconst.deleteWarningPolicy:
        "पॉलिसी के अनुसार सभी वाहन डेटा सिस्टम से हटा दिए जाएंगे",
    /** upload pop */
    languageconst.video: "वीडियो",
    languageconst.photos: "फोटो",
    /******* edit screen */
    languageconst.basicInformation: "मूल जानकारी",
    languageconst.editPackage: "पैकेज संपादित करें",
    languageconst.showcases: "प्रदर्शनी",
    languageconst.showcaseCarPhotos: "कार की तस्वीरें प्रदर्शित करें",
    languageconst.noPhotoUploaded: "अभी कोई फोटो अपलोड नहीं की गई है!",
    languageconst.addNow: "अभी जोड़ें",
    languageconst.showcaseCarVideos: "कार वीडियो प्रदर्शित करें",
    languageconst.availabilityStatus: "उपलब्धता स्थिति",
    languageconst.unavailable: "अनुपलब्ध",
    languageconst.available: "उपलब्ध",
    languageconst.saveChanges: "परिवर्तन सहेजें",
    languageconst.letstartvehiclebasic:
        "आइए वाहन की बुनियादी जानकारी से शुरुआत करें",
    /********* setting*/
    languageconst.general: "सामान्य",
    languageconst.profile: "प्रोफ़ाइल",
    languageconst.myBookings: "मेरी बुकिंग",
    languageconst.myTransaction: "मेरे लेन-देन",
    languageconst.Transaction: "लेन-देन",
    languageconst.Latest: "नवीनतम",
    languageconst.Older: "पुराने",
    languageconst.language: "भाषा",
    languageconst.addCoupons: "कूपन जोड़ें",
    languageconst.settingsPrivacy: "सेटिंग्स और गोपनीयता",
    languageconst.paymentMethods: "भुगतान विधियाँ",
    languageconst.privacyPolicy: "गोपनीयता नीति",
    languageconst.termsAndConditions: "नियम और शर्तें",
    languageconst.faqs: "सामान्य प्रश्न",
    languageconst.helpAndSupport: "सहायता और समर्थन",
    languageconst.logout: "लॉग आउट",
    /**** logout pop */
    languageconst.confirmLogout:
        "क्या आप सुनिश्चित हैं कि आप लॉग आउट करना चाहते हैं",
    /**** profile */
    languageconst.addNecessaryDetails:
        "कृपया अपनी बुकिंग प्रोफ़ाइल के लिए आवश्यक विवरण जोड़ें और जांचें",
    languageconst.name: "नाम",
    languageconst.email: "ईमेल",
    languageconst.defaultAddress: "पता (डिफ़ॉल्ट)",
    /****** Notification Setting */
    languageconst.notificationSettings: "सूचना सेटिंग",
    languageconst.inAppNotification: "ऐप में सूचना",
    languageconst.receiveNotificationWithinApp: "ऐप के भीतर सूचना प्राप्त करें",
    languageconst.systemNotification: "सिस्टम सूचना",
    languageconst.receiveNotificationOutsideApp:
        "ऐप के बाहर सूचना प्राप्त करें",
    languageconst.behaviour: "व्यवहार",
    languageconst.allowWakeDeviceNotification:
        "डिवाइस को जगाने के लिए सूचना की अनुमति दें",
    languageconst.disableNotificationVibration: "सूचना कंपन को अक्षम करें",
    languageconst.doNotDisturb: "परेशान न करें",
    /********Language */
    languageconst.searchForLanguages: "भाषाओं के लिए खोजें",
    languageconst.hindi: "हिंदी",
    /*********Add Coupons */
    languageconst.addCouponCode: "कूपन कोड जोड़ें",
    languageconst.addCouponDescription:
        "अपने ग्राहकों के लिए कूपन का शीर्षक और कूपन की कीमत जोड़ें",
    languageconst.couponCode: "कूपन कोड",
    languageconst.enterCodeHere: "यहां कोड दर्ज करें",
    languageconst.maxDiscount: "अधिकतम छूट",
    languageconst.allowedUses: "अनुमत उपयोग",
    languageconst.addCoupon: "कूपन जोड़ें",
    /********pop */
    languageconst.couponCreatedSuccessfully: "कूपन कोड सफलतापूर्वक बनाया गया",
    languageconst.configuringSerialNumberPleaseWait:
        "कृपया प्रतीक्षा करें, हम क्रमांक को कॉन्फ़िगर कर रहे हैं",
    /******* Payment Methods*/
    languageconst.currentMethod: "वर्तमान विधि",
    languageconst.cash: "नकद",
    languageconst.defaultMethod: "डिफ़ॉल्ट विधि",
    languageconst.choosePaymentMethod:
        "ऑनलाइन भुगतान के लिए अपनी पसंदीदा भुगतान विधि चुनें जिसमें आप सहज हों या अपने कार्ड जोड़ें",
    languageconst.cashOnDelivery: "डिलीवरी पर नकदी",
    languageconst.increaseInCharges: "शुल्क में % वृद्धि",
    languageconst.expiresOn: "समाप्ति तिथि",
    languageconst.upi: "यूपीआई",
    languageconst.addUPIID: "अपना यूपीआई आईडी जोड़ें",
    languageconst.paytm: "पेटीएम",
    languageconst.addMobileNo: "अपना मोबाइल नंबर जोड़ें",
    languageconst.addCard: "कार्ड जोड़ें",
    languageconst.mobile: "मोबाइल",
    /****** Add Bank Card */
    languageconst.addBankCard: "बैंक कार्ड जोड़ें",
    languageconst.addNewCard: "नया कार्ड जोड़ें",
    languageconst.streamlineCheckoutProcess:
        "भविष्य के लेन-देन के लिए नया कार्ड जोड़कर अपने चेकआउट प्रक्रिया को सरल बनाएं। आपका कार्ड जानकारी उन्नत एन्क्रिप्शन तकनीक के साथ सुरक्षित है।",
    languageconst.cardNo: "कार्ड नंबर",
    languageconst.expiryDate: "समाप्ति तिथि",
    languageconst.CVV: "सीवीवी",
    languageconst.cardholdersName: "कार्डधारक का नाम",
    languageconst.enterCardholdersName: "कार्डधारक का पूरा नाम दर्ज करें",
    languageconst.addMyCard: "मेरा कार्ड जोड़ें",
    languageconst.transactionID: "लेन-देन आईडी",
    /*********pop */
    languageconst.bankCardAddedSuccessfully: "बैंक कार्ड सफलतापूर्वक जोड़ा गया",
    languageconst.takingUpRequiredDetailsPleaseWait:
        "कृपया प्रतीक्षा करें, हम आवश्यक विवरण ले रहे हैं",
    /*****Help & Support */
    languageconst.connectWithExpertsForHelp:
        "आप पुष्टि और मदद के लिए हमारे विशेषज्ञों और समर्थन से संपर्क कर सकते हैं",
    languageconst.customerServices: "ग्राहक सेवा",
    languageconst.whatsApp: "व्हाट्सएप",
    languageconst.deleteMyAccount: "मेरा खाता हटाएं",
    languageconst.tollFreeNumber: "टोल फ्री नंबर",
    /******Delete Account */
    languageconst.deleteAccount: "खाता हटाएं",
    languageconst.provideReasonForDeletion:
        "यदि आप खाता हटाना चाहते हैं तो आपको खाते को हटाने का कारण बताने के लिए कहा जाएगा",
    languageconst.noLongerUsesServicePlatform: "अब सेवा मंच का उपयोग नहीं करता",
    languageconst.foundBetterAlternative: "बेहतर विकल्प पाया",
    languageconst.tooManyEmailNotifications: "बहुत अधिक ईमेल/सूचनाएं",
    languageconst.difficultNavigationInPlatform: "मंच में नेविगेशन कठिन",
    languageconst.accountSecurityConcerns: "खाता सुरक्षा चिंताएं",
    languageconst.personalReason: "व्यक्तिगत कारण",
    languageconst.other: "अन्य",
    "type here": "यहां टाइप करें",
    /******* delete pop */
    languageconst.deleteAccountPermanently:
        "आप अपना खाता स्थायी रूप से हटाना चाहते हैं",
    languageconst.understandConsequencesOfDeletingAccount:
        "यह सुनिश्चित करना कि उपयोगकर्ता खाते को हटाने के परिणामों को समझता है",
    languageconst.lossOfData: "डेटा का नुकसान",
    languageconst.keepAccount: "खाता रखें",

    /*******Offer’s */
    languageconst.Offers: "ऑफ़र",
    languageconst.offercreatedcustomer:
        "यहाँ आपके ग्राहक के लिए बनाए गए ऑफ़र हैं",
    /************ */
    languageconst.addoffers: "ऑफ़र जोड़ें",
    languageconst.selectoffertype: "ऑफ़र प्रकार चुनें",
    languageconst.selecttypeofferwantcreate:
        "उस प्रकार के ऑफ़र का चयन करें जिसे आप ग्राहक के लिए बनाना चाहते हैं",
    /*********** */
    languageconst.generaldiscount: "सामान्य छूट",
    languageconst.firsttimediscount: "पहली बार ग्राहक छूट",
    languageconst.tiereddiscount: "स्तरीय छूट",
    languageconst.bundlediscont: "बंडल छूट",
    /**********Add Offer Details */
    languageconst.addofferdetails: "ऑफ़र विवरण जोड़ें",
    languageconst.addyourofferdetails:
        "ग्राहकों के लिए अपने ऑफ़र विवरण और थंबनेल जोड़ें",
    languageconst.showwithbanner: "बैनर के साथ दिखाएँ",
    languageconst.aboutdiscount: "छूट के बारे में",
    languageconst.Title: "शीर्षक",
    languageconst.entercode: "कोड दर्ज करें",
    languageconst.writeshortdescription: "एक संक्षिप्त विवरण लिखें",
    languageconst.Benefits: "लाभ",
    languageconst.DiscountValue: "छूट मूल्य",
    languageconst.DiscountUnit: "छूट इकाई",
    languageconst.ValidForm: "मान्य फॉर्म",
    languageconst.ValidTill: "मान्य तिथि",
    languageconst.UsageBenifits: "उपयोग लाभ",
    languageconst.UsesperCustomer: "प्रति ग्राहक उपयोग",
    languageconst.Reset: "रीसेट",
    languageconst.UploadData: "डेटा अपलोड करें",
    languageconst.SpendThreshold: "खर्च सीमा",
    languageconst.minimumspentvalue: "न्यूनतम खर्च मूल्य",
    languageconst.SpendValue: "खर्च मूल्य",
    languageconst.MinimumSpend: "न्यूनतम खर्च",
    /*************Add Question */
    languageconst.addquestion: "प्रश्न जोड़ें",
    languageconst.addyourquestionanswer: "नीचे अपना प्रश्न और उत्तर जोड़ें",
    languageconst.Question: "प्रश्न",
    languageconst.enterquestionhere: "यहाँ अपना प्रश्न दर्ज करें",
    languageconst.Answer: "उत्तर",
    languageconst.enteranswerhere: "यहाँ अपना उत्तर दर्ज करें",
    languageconst.questionaddedsuccessfully: "प्रश्न सफलतापूर्वक जोड़ा गया",
    languageconst.pleasewaitcustomerapp:
        "कृपया प्रतीक्षा करें, हम ग्राहक के ऐप में अपडेट कर रहे हैं",
    languageconst.deletefaq: "क्या आप वाकई इस FAQ प्रश्न को हटाना चाहते हैं?",
    languageconst.pleaseconfiguringcustomerapp:
        "कृपया प्रतीक्षा करें, हम ग्राहक के ऐप का डेटा कॉन्फ़िगर कर रहे हैं",
    languageconst.Delete: "हटाएं",
    languageconst.discount: "छूट",
    languageconst.View: "देखें",
    languageconst.TotalUsers: "कुल उपयोगकर्ता",
    languageconst.bundleType: "बंडल प्रकार",
    languageconst.startingat: "पे शुरुवात",
    /**************** */
    languageconst.Promocodeapplied: "प्रोमो कोड लागू किया गया",
    languageconst.PaidAmount: "चुकाई गई राशि",
  };
}

class languageconst {
  // Onboarding
  static const String welcomeToCCRental = "Welcome to CC Rental ";
  static const String Skip = "Skip";
  static const String Latest = "Latest";
  static const String Older = "Older";
  static const String simplifyYourCarRentalBusiness =
      "Simplify your car rental business.";
  static const String manageYourFleet =
      "Manage your fleet, bookings, and transactions all in one place.";
  static const String next = "Next";
  static const String getStarted = "Get Started";
  static const String manageYourFleetSubtitle = "Manage Your Fleet";
  static const String keepTrackOfVehicles = "Keep track of all your vehicles ";
  static const String easilyAddEditMonitorCars =
      "Easily add, edit, and monitor your cars with detailed information and availability status.";
  static const String continueButton = "Continue";
  static const String Management = "Management";
  static const String seamlessBookingManagement = "Seamless Booking Management";
  static const String stayOnTopOfBookings = "Stay on top of your bookings";
  static const String viewAndManageBookings =
      "View and manage new, upcoming, and completed bookings effortlessly.";

  // Login
  static const String welcomeBack = "Welcome Back";
  static const String gladToSeeYouAgain = "Glad to See you again !";
  static const String userName = "User name";
  static const String enterUserName = "Enter user name";
  static const String password = "Password";
  static const String enterYourPassword = "Enter your password";
  static const String forgotPassword = "Forgot password ?";
  static const String rememberMe = "Remember me";
  static const String login = "Login";

  // Forgot Password
  static const String forgotPasswordTitle = "Forgot Password";
  static const String enterEmailOrMobile =
      "Please enter your email or mobile number so we can sent you the verification code to your filled address ";
  static const String emailOrMobile = "Email or mobile ";
  static const String backToLogin = "Back to Login";

  // Verification Step
  static const String verificationStep = "Verification Step";
  static const String secondsLeft = "sec left";
  static const String verificationCodeSent =
      "we have sent a code to you @8980gmail.com please enter code to verify ";
  static const String resendOTP = "Resend OTP ?";
  static const String pleaseenterotp = "Please enter your otp";
  static const String verify = "Verify";

  // Create New Password
  static const String createNewPassword = "Create new password";
  static const String enterNewPassword =
      "Please enter your new password for your acccont security";
  static const String newPassword = "New password";
  static const String confirmPassword = "Confirm password";
  static const String save = "Save ";

  // Popups
  static const String passwordChangedSuccessfully =
      "Password Changed Successfully";
  static const String pleaseWaitRedirectingToLoginPage =
      "please wait we are taking you to login page";

  // Dashboard
  static const String searchForRentalAndCars = "Search for rental & cars";
  static const String totalCars = "Total Car’s";
  static const String upcoming = "Upcoming";
  static const String ongoing = "Ongoing";
  static const String completed = "Completed";
  static const String revenueGraph = "Revenue Graph";
  static const String recentBookings = "Recent Bookings";
  static const String seeAll = "see all";
  static const String toprentalcar = "Top Rental Cars";
  static const String bookingID = "Booking ID";
  static const String seeDetails = "see details";
  static const String day = "Day";
  static const String petrol = "Petrol";
  static const String automatic = "Automatic";
  static const String auto = "Auto";
  static const String seats = "seats";
  static const String reviews = "Reviews";
  static const String ago = "ago";

  // Bottom App Bar
  static const String home = "Home";
  static const String bookings = "Bookings";
  static const String vehicles = "Vehicles";
  static const String settings = "Settings";

  // Notifications
  static const String notifications = "Notifications";
  static const String searchForMessages = "Search for messages";
  static const String booking = "Booking";

  // Bookings
  static const String searchForBookings = "Search for Bookings";
  static const String New = "New";
  static const String modify = "Modify";
  static const String cancel = "Cancel";

  // Booking Details
  static const String bookingDetails = "Booking Details";
  static const String address = "Address";
  static const String timeAndDate = "Time & Date";
  static const String Date = "Date";
  static const String time = "Time";
  static const String amount = "Amount";
  static const String modeOfPayment = "Mode of Payment";
  static const String couponCodeApplied = "Coupon code applied";
  static const String reject = "Reject";
  static const String accept = "Accept";
  static const String total = "Total";

  // Popup Booking 1
  static const String bookingSuccessfullyAccepted =
      "Booking Has Been Successfully Accepted";
  static const String notifyingCustomerPleaseWait =
      "please wait we are notifying our customer";

  // Popup Booking 2
  static const String confirmRejectBooking =
      "Are you Sure you want to Reject Booking";
  static const String no = "No";
  static const String yes = "Yes";

  // Add Vehicles Step 1
  static const String addVehicle = "Add Vehicle";
  static const String startWithVehicleBasicInfo =
      "Let’s start with the Vehicle Basic Informatation";
  static const String step = "Step";
  static const String carMake = "Car Make";
  static const String chooseCarCompany = "chose your car company";
  static const String carModel = "Car Model";
  static const String select = "select";
  static const String licensePlateNumber = "License Plate Number";
  static const String enter = "Enter";
  static const String transmission = "Transmission";
  static const String seatingCapacity = "Seating Capacity";
  static const String fuel = "Fuel";
  static const String category = "Category";
  static const String manufactureYear = "Manufacture year";
  static const String selectCarCategory = "select car category";
  static const String addColorVariant = "Add Color Variant ";
  static const String black = "Black";
  static const String grey = "Grey";
  static const String Destination = "Destination";

  // Add Vehicle Next Step 2
  static const String addBookingPriceAndDescription =
      "Now Add your Booking price for the customer’s & description";
  static const String description = "Description";
  static const String writeCarIntro =
      "write something about  your car as Intro";
  static const String createPackage = "Create Package";
  static const String packageType = "Package Type";
  static const String perHour = "Per Hour";

  // Add Vehicle Next Step 3
  static const String addCarThumbnailsAndImages =
      "Add car thumbnails and multiple images ";
  static const String thumbnail = "Thumbnail";
  static const String dragOrDropImage =
      "Drag or Drop the Image from  system or Browse ?";
  static const String addPhotos = "Add photos";
  static const String addVideos = "Add Videos";
  static const String uploadVehicle = "Upload Vehicle ";

  // Pop Upload
  static const String upload = "Upload ";
  static const String browse = "Browse";
  static const String uploadimagevideo =
      "Select your Image / Video form your Gallery";
  static const String fileSizeLimitNote =
      "please make sure file size should be";
  static const String orless = " or less";

  // Pop Upload Vehicle
  static const String vehicleAddedSuccessfully = "Vehicle Added Sucessfully";
  static const String uploadingVehicleListPleaseWait =
      "please wait we are uploading your vehicle in list";

  // Vehicles
  static const String addCars = "Add Car’s";

  // Vehicle Filter
  static const String priceRate = "Price Rate";
  static const String seating = "Seating";
  static const String suv = "SUV";
  static const String sports = "Sports";
  static const String coupon = "Coupon";
  static const String sedan = "Sedan";
  static const String scorpio = "Scorpio";
  static const String casual = "Casual";
  static const String vintage = "Vintage";
  static const String saveFilter = "Save";
  static const String perHourly = "Per Hourly";
  static const String perDay = "Per Day";
  static const String perKilometer = "Per Kilometer";
  static const String diesel = "Diesel";
  static const String gas = "Gas ";
  static const String manual = "Manual";

  // Car Preview
  static const String carReview = "review";
  static const String priceRateLabel = "Price Rate (₹) ";
  static const String introduction = "Introduction";
  static const String carDetails = "Car Details";
  static const String color = "Color";
  static const String licensePlateNo = "License Plate no";
  static const String similarVehicles = "Similar Vehicles";
  static const String edit = "Edit";

  // Delete
  static const String confirmDeleteVehicle =
      "Are you Sure you want to Delete Vehicle ";
  static const String deleteWarningPolicy =
      "all vehicle data will be delete for system as per the Policy";

  // Upload Popup
  static const String video = "Video";
  static const String photos = "Photos";

  // Edit Screen
  static const String basicInformation = "Basic Information";
  static const String editPackage = "Edit Package";
  static const String showcases = "Showcases";
  static const String showcaseCarPhotos = "Showcase car photos";
  static const String noPhotoUploaded = "No photo Uploaded Right now !";
  static const String addNow = "Add Now";
  static const String showcaseCarVideos = "Showcase car Videos";
  static const String availabilityStatus = "Availability  Status";
  static const String unavailable = "Unavailable";
  static const String available = "Available";
  static const String saveChanges = "Save Changes";
  static const String letstartvehiclebasic =
      "Let's start with the Vehicle Basic Informatation";

  // Settings
  static const String general = "General";
  static const String profile = "Profile";
  static const String myBookings = "My Bookings";
  static const String myTransaction = "My Transaction";
  static const String Transaction = "Transaction";
  static const String language = "Language";
  static const String addCoupons = "Add Coupons";
  static const String settingsPrivacy = "Settings & Privacy";
  static const String paymentMethods = "Payment Methods";
  static const String privacyPolicy = "Privacy Policy";
  static const String termsAndConditions = "Term’s and  Condition";
  static const String faqs = "FAQ’s";
  static const String helpAndSupport = "Help & Support";
  static const String logout = "Logout";

  // Logout Popup
  static const String confirmLogout = "Are you Sure you want to Logout ";

  // Profile
  static const String profileTitle = "Porfile";
  static const String addNecessaryDetails =
      "Please check and add your necessary details for your booking Profile";
  static const String name = "Name";
  static const String email = "Email";
  static const String defaultAddress = "Address ( Default )";

  // Notification Settings
  static const String notificationSettings = "Notification Setting";
  static const String inAppNotification = "In App Notifcation";
  static const String receiveNotificationWithinApp =
      "Get Notification Within App";
  static const String systemNotification = "System Notification";
  static const String receiveNotificationOutsideApp =
      "Get Notification outside the App";
  static const String behaviour = "Behaviour";
  static const String allowWakeDeviceNotification =
      "Allow Notification to wake the Device";
  static const String disableNotificationVibration =
      "Disable Notification Vibration";
  static const String doNotDisturb = "Do Not Disctrub";

  // Language
  static const String searchForLanguages = "Search for languages";
  static const String hindi = "Hindi";

  // Add Coupons
  static const String addCouponCode = "Add Coupon Code";
  static const String addCouponDescription =
      "Add your coupon title and price of coupon for the customers to redeem in their account";
  static const String couponCode = "Coupon Code";
  static const String enterCodeHere = "Enter code here";
  static const String maxDiscount = "Max Discount";
  static const String allowedUses = "Allowed uses";
  static const String addCoupon = "Add Coupon";

  // Add Coupons Popup
  static const String couponCreatedSuccessfully =
      "Coupon Code Created Successfully";
  static const String configuringSerialNumberPleaseWait =
      "please wait we are configuring the Serial no";

  // Payment Methods
  static const String currentMethod = "Current Method";
  static const String cash = "Cash ";
  static const String defaultMethod = "Default Method";
  static const String choosePaymentMethod =
      "Chose your desired payment method for online payments in which you are comfortable or add your cards  ";
  static const String cashOnDelivery = "Cash on Delivery";
  static const String increaseInCharges = "% increase in charges ";
  static const String expiresOn = "Expires on";
  static const String upi = "UPI";
  static const String addUPIID = "add your UIP ID";
  static const String paytm = "Paytm";
  static const String addMobileNo = "add your mobile no";
  static const String addCard = "Add  Card";
  static const String mobile = "Mobile";

  // Add Bank Card
  static const String addBankCard = "Add Bank Card";
  static const String addNewCard = "Add new card";
  static const String streamlineCheckoutProcess =
      "Streamline your checkout process by adding a new card for future transactions. Your card information is secured with advanced encryption technology.";
  static const String cardNo = "Card no";
  static const String expiryDate = "Expiry Date";
  static const String CVV = "CVV";
  static const String cardholdersName = "Cardholder’s name";
  static const String enterCardholdersName = "enter cardholder’s full name";
  static const String addMyCard = "Add My card";
  static const String transactionID = "Transaction ID";

  // Add Bank Card Popup
  static const String bankCardAddedSuccessfully =
      "Bank Card Added Successfully";
  static const String takingUpRequiredDetailsPleaseWait =
      "please wait we are taking up Required detials";

  // Help & Support
  static const String connectWithExpertsForHelp =
      "You can connect our experts and support for your conformations and Hleps";
  static const String customerServices = "Customer Services";
  static const String whatsApp = "WhatsApp";
  static const String deleteMyAccount = "Delete My Account";
  static const String tollFreeNumber = "Toll Free Number ";

  // Delete Account
  static const String deleteAccount = "Delete Account";
  static const String provideReasonForDeletion =
      "If you want to delete Account you are prompted to provide reason for deleting account ";
  static const String noLongerUsesServicePlatform =
      "No Longer Uses the Service Platform";
  static const String foundBetterAlternative = "Found a better alternative";
  static const String tooManyEmailNotifications =
      "Too many email / notification";
  static const String difficultNavigationInPlatform =
      "Difficult Navigation in Platform";
  static const String accountSecurityConcerns = "Account Security Concerns";
  static const String personalReason = "Personal Reason ";
  static const String other = "Other";
  static const String typeHere = "type here";

  // Delete Account Popup
  static const String areYouSure = "Are you Sure ?";
  static const String deleteAccountPermanently =
      "You Want to Delete your Account Permanently";
  static const String understandConsequencesOfDeletingAccount =
      "Ensuring that the user understands consequences to deleting their Account";
  static const String lossOfData = "loss of Data";
  static const String keepAccount = "Keep Account";
/***************************************************************** */
  /*******Offer’s */
  static const String Offers = "Offer’s";
  static const String offercreatedcustomer =
      "here’s your Offer’s created for the customer’s";
  /************ */
  static const String addoffers = "Add Offer’s";
  static const String selectoffertype = "select offer type";
  static const String selecttypeofferwantcreate =
      "Select type of offer for the customer’s you want to create";
  /*********** */
  static const String generaldiscount = "General Discount";
  static const String firsttimediscount = "First-Time Customer Discount";
  static const String tiereddiscount = "Tiered Discount";
  static const String bundlediscont = "Bundle Discount";
  /**********Add Offer Details */
  static const String addofferdetails = "Add Offer Details";
  static const String addyourofferdetails =
      "Add your Offer details and thumbnail for customers";
  static const String showwithbanner = "Show with banner";
  static const String aboutdiscount = "About Discount";
  static const String Title = "Title";
  static const String entercode = "Enter Code";
  static const String writeshortdescription = "write a short description ";
  static const String Benefits = "Benefits";
  static const String DiscountValue = "Discount Value";
  static const String DiscountUnit = "Discount Unit";
  static const String ValidForm = "Valid Form";
  static const String ValidTill = "Valid Till";
  static const String UsageBenifits = "Usage Benifits";
  static const String UsesperCustomer = "Uses per Customer";
  static const String Reset = "Reset";
  static const String UploadData = "Upload Data";
  static const String SpendThreshold = "Spend Threshold";
  static const String minimumspentvalue = "minimum spent value";
  static const String SpendValue = "Spend Value";
  static const String MinimumSpend = "Minimum Spend";
  /*************Add Question */
  static const String addquestion = "Add Question";
  static const String addyourquestionanswer =
      "Add your Question & Answer’s Below";
  static const String Question = "Question";
  static const String enterquestionhere = "Enter your question here";
  static const String Answer = "Answer";
  static const String enteranswerhere = "Enter your answer here";
  static const String questionaddedsuccessfully = "Question Added Successfully";
  static const String pleasewaitcustomerapp =
      "please wait we are updating in Customer’s app";
  static const String deletefaq =
      "Are you Sure you want to Delete FAQ’s Question";
  static const String pleaseconfiguringcustomerapp =
      "please wait we are configuring data form customer’s app";
  static const String Delete = "Delete";
  static const String discount = "Discount";
  static const String View = "View";
  static const String TotalUsers = "Total Users";
  static const String bundleType = " Bundle Type";
  static const String startingat = " Starting at";
  /**************** */
  static const String PaidAmount = "Paid Amount";
  static const String Promocodeapplied = "Promo code applied";
}
