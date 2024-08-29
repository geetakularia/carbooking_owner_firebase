// import 'package:car_booking_owner/Models/carmodel.dart';
// import 'package:car_booking_owner/main.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// // Example data for multiple cars
// List<Carmodel> carModels = [
//   Carmodel(
//     companyname: "Toyota",
//     id: "1",
//     carmodel: "Camry",
//     platenumber: "XYZ-5678",
//     transmission: "Automatic",
//     seatingcapacity: "5",
//     fuel: "Hybrid",
//     category: "Sedan",
//     manufactureyear: "2021",
//     description: "A comfortable and fuel-efficient sedan.",
//     carcolor: ["White", "Silver"],
//     images: ["url_to_camry_image1", "url_to_camry_image2"],
//     videos: ["url_to_camry_video1"],
//     createpackagedata: [
//       CreatePackageModel(packagetype: "Standard", ammount: "800"),
//       CreatePackageModel(packagetype: "Luxury", ammount: "1200"),
//     ],
//   ),
//   Carmodel(
//     companyname: "Tesla",
//     id: "2",
//     carmodel: "Model S",
//     platenumber: "TES-1234",
//     transmission: "Automatic",
//     seatingcapacity: "5",
//     fuel: "Electric",
//     category: "Sedan",
//     manufactureyear: "2022",
//     description:
//         "A high-performance electric vehicle with cutting-edge technology.",
//     carcolor: ["Red", "Black"],
//     images: ["url_to_tesla_image1", "url_to_tesla_image2"],
//     videos: ["url_to_tesla_video1"],
//     createpackagedata: [
//       CreatePackageModel(packagetype: "Basic", ammount: "1500"),
//       CreatePackageModel(packagetype: "Premium", ammount: "2500"),
//     ],
//   ),
//   Carmodel(
//     companyname: "Ford",
//     id: "3",
//     carmodel: "F-150",
//     platenumber: "F150-7890",
//     transmission: "Manual",
//     seatingcapacity: "5",
//     fuel: "Diesel",
//     category: "Truck",
//     manufactureyear: "2023",
//     description: "A powerful and durable truck, perfect for heavy-duty tasks.",
//     carcolor: ["Blue", "Gray"],
//     images: ["url_to_f150_image1", "url_to_f150_image2"],
//     videos: ["url_to_f150_video1"],
//     createpackagedata: [
//       CreatePackageModel(packagetype: "Off-Road", ammount: "1000"),
//       CreatePackageModel(packagetype: "Towing", ammount: "1300"),
//     ],
//   ),
//   Carmodel(
//     companyname: "BMW",
//     id: "4",
//     carmodel: "X5",
//     platenumber: "BMW-4567",
//     transmission: "Automatic",
//     seatingcapacity: "7",
//     fuel: "Petrol",
//     category: "SUV",
//     manufactureyear: "2021",
//     description:
//         "A luxurious SUV with advanced features and spacious interiors.",
//     carcolor: ["Black", "White"],
//     images: ["url_to_x5_image1", "url_to_x5_image2"],
//     videos: ["url_to_x5_video1"],
//     createpackagedata: [
//       CreatePackageModel(packagetype: "Luxury", ammount: "2000"),
//       CreatePackageModel(packagetype: "Sport", ammount: "2300"),
//     ],
//   ),
//   Carmodel(
//     companyname: "Honda",
//     id: "5",
//     carmodel: "Civic",
//     platenumber: "CIV-9987",
//     transmission: "Automatic",
//     seatingcapacity: "5",
//     fuel: "Petrol",
//     category: "Sedan",
//     manufactureyear: "2020",
//     description:
//         "A popular compact car known for its reliability and efficiency.",
//     carcolor: ["Red", "Blue"],
//     images: ["url_to_civic_image1", "url_to_civic_image2"],
//     videos: ["url_to_civic_video1"],
//     createpackagedata: [
//       CreatePackageModel(packagetype: "Economy", ammount: "600"),
//       CreatePackageModel(packagetype: "Sport", ammount: "900"),
//     ],
//   ),
// ];

// Future<void> addCarModelToFirebase(Carmodel carModel) async {
//   // Get a reference to the Firestore collection where car models will be stored
//   // CollectionReference carModelsCollection =
//   //     FirebaseFirestore.instance.collection('car_models');
//   final carModelsCollection = manageData.api.getallcarcollection;
//   try {
//     // Add the car model to the collection
//     await carModelsCollection.add(carModel.tomap());
//     print("Car model added successfully!");
//   } catch (e) {
//     print("Failed to add car model: $e");
//   }
// }

// Future<List<Carmodel>> fetchCarModelsFromFirebase() async {
//   QuerySnapshot snapshot = await manageData.api.getallcarcollection.get();
//   return snapshot.docs
//       .map((doc) => Carmodel.fromjson(doc.data() as Map<String, dynamic>))
//       .toList();
// }
// /********************************************************************************************************************************************************************************************** */

// class CarModelDropdown extends StatefulWidget {
//   @override
//   _CarModelDropdownState createState() => _CarModelDropdownState();
// }

// class _CarModelDropdownState extends State<CarModelDropdown> {
//   List<Carmodel> carModels = [];
//   String? selectedCompany;
//   Carmodel? selectedCarModel;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchCarModels();
//   }

//   Future<void> fetchCarModels() async {
//     List<Carmodel> fetchedCarModels = await fetchCarModelsFromFirebase();
//     setState(() {
//       carModels = fetchedCarModels;
//       isLoading = false;
//     });
//   }

//   Future<List<Carmodel>> fetchCarModelsFromFirebase() async {
//     try {
//       QuerySnapshot snapshot = await manageData.api.getallcarcollection.get();

//       if (snapshot.docs.isEmpty) {
//         print("Firestore returned an empty list.");
//       }

//       List<Carmodel> carModelList = snapshot.docs.map((doc) {
//         // Log the data from Firestore
//         print("Document data: ${doc.data()}");

//         // Convert Firestore document data to Carmodel instance
//         return Carmodel.fromjson(doc.data() as Map<String, dynamic>);
//       }).toList();

//       return carModelList;
//     } catch (e) {
//       print("Error fetching data from Firestore: $e");
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return Center(child: CircularProgressIndicator());
//     }

//     Map<String, Carmodel> companyToCarModelMap = {
//       for (var car in carModels) car.companyname ?? "": car
//     };

//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           DropdownButton<String>(
//             hint: Text("Select Company"),
//             value: selectedCompany,
//             items: companyToCarModelMap.keys.map((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: (newValue) {
//               setState(() {
//                 selectedCompany = newValue;
//                 selectedCarModel = companyToCarModelMap[newValue];
//               });
//             },
//           ),
//           SizedBox(height: 20),
//           selectedCarModel != null
//               ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Car Model: ${selectedCarModel?.carmodel}"),
//                     Text("Plate Number: ${selectedCarModel?.platenumber}"),
//                     Text("Transmission: ${selectedCarModel?.transmission}"),
//                     Text(
//                         "Seating Capacity: ${selectedCarModel?.seatingcapacity}"),
//                     Text("Fuel Type: ${selectedCarModel?.fuel}"),
//                     Text("Category: ${selectedCarModel?.category}"),
//                     Text(
//                         "Manufacture Year: ${selectedCarModel?.manufactureyear}"),
//                     Text("Description: ${selectedCarModel?.description}"),
//                     Text("Colors: ${selectedCarModel?.carcolor?.join(", ")}"),
//                     Text("Images: ${selectedCarModel?.images?.join(", ")}"),
//                     Text("Videos: ${selectedCarModel?.videos?.join(", ")}"),
//                     Text(
//                         "Packages: ${selectedCarModel?.createpackagedata?.map((e) => '${e.packagetype}: ${e.ammount}').join(", ")}"),
//                   ],
//                 )
//               : Text("Select a company to see car details"),
//         ],
//       ),
//     );
//   }
// }
