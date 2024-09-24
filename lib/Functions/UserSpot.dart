import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

class MyFunctions {
  //Map louncher   *****//

  launchMap(String lat, String long) async {
    await launchUrl(Uri.parse(
        "https://www.google.com/maps/dir/?api=1&destination=$lat,$long"));
  }

//Phone support louncher//**** */
  launchPhone(String phone) async {
    await launchUrl(Uri.parse("tel:+91$phone"));
  }

  //email support *******///

//   emailsender(BuildContext context) async {
//     final user = Get.find<BookingController>();
//     final Email email = Email(
//       body: """Dear STSM Team,

// I am writing to request the removal of my account associated with the email address ${user!.basic_detail!.email} vide ID : ${user.uid} from your platform, STSM - Save Time Save Money.

// Please note the following details regarding my account:

// Full Name: ${user.basic_detail!.name}
// Registered Email Address: ${user.basic_detail!.email}
// Phone Number (if applicable): ${user.basic_detail!.phone}
// I kindly ask that you process this request as soon as possible and confirm the account removal to my email address. I understand that this action is irreversible and that I will no longer be able to access my account or any associated data after its removal.

// Thank you for your prompt attention to this matter. I appreciate your assistance and look forward to your confirmation of the account removal.""",
//       subject: 'Request for removal of account id : ${user.uid}',
//       recipients: [appconfig.emailAddress],
//       isHTML: false,
//     );
//     await FlutterEmailSender.send(email);
//   }

//   /// whatsapp support ****///

//   whatsappsupport(BuildContext context) async {
//     final url = Uri.parse("http://wa.me/${appconfig.whatsAppPhone}");
//     if (!await launchUrl(url)) {
//       Utils.flushbarerror('Could not launch $url', context);
//     }
//   }

  //Generate random id **********//

  static generateId({int length = 20}) {
    String characters = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    String id = "";

    String randomChoice() {
      Random random = Random();
      int index = random.nextInt(characters.length);
      return characters[index];
    }

    for (var i = 0; i < length; i++) {
      String character = randomChoice();
      id += character;
    }

    return id;
  }

// generate complete addresss *********///

  static String generateCompleteAddress(List<String> addressDetails) {
    String address =
        addressDetails.where((e) => e.trim().isNotEmpty).join(", ");
    return address;
  }

  //Get Varient Name list From Product Data//***** */

  // List<String> productoptions(BuildContext context, String varientoptions) {
  //   final provider =
  //       Provider.of<ProductController>(context, listen: false).getproduct;
  //   var options = varientoptions.isEmpty
  //       ? <String>[]
  //       : provider
  //           .firstWhere((element) => element.name == varientoptions)
  //           .varient
  //           .map((e) => e.VarientName)
  //           .toList();
  //   return options;
  // }

  // List<dynamic> coloroptionsfunction(
  //     BuildContext context, String product_name) {
  //   final provider =
  //       Provider.of<ProductController>(context, listen: false).getproduct;
  //   var colors = product_name.isEmpty
  //       ? <String>[]
  //       : provider
  //           .firstWhere((element) => element.name == product_name)
  //           .colors
  //           .toList();
  //   return colors;
  // }

  //  generate invoiceNumber ////******** */
  getInvoiceNo() {
    return "ST${DateTime.now().year % 100}${generateId(length: 6)}";
  }
}
