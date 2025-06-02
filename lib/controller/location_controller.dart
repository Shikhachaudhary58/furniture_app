// import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

// class LocationController extends GetxController {
//   String userLocation = "Fetching location...";

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserLocation();
//   }

//   Future<void> fetchUserLocation() async {
//     try {
//       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         userLocation = "Location services disabled";
//         update();
//         return;
//       }

//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           userLocation = "Permission denied";
//           update();
//           return;
//         }
//       }

//       if (permission == LocationPermission.deniedForever) {
//         userLocation = "Permission denied forever";
//         update();
//         return;
//       }

//       Position position = await Geolocator.getCurrentPosition(
//         locationSettings:
//             const LocationSettings(accuracy: LocationAccuracy.high),
//       );

//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );

//       if (placemarks.isNotEmpty) {
//         userLocation =
//             "${placemarks.first.subLocality ?? ""}, ${placemarks.first.postalCode ?? ""}";
//       } else {
//         userLocation = "Location not found";
//       }
//     } catch (e) {
//       userLocation = "Location error: ${e.toString()}";
//     }

//     update(); // Trigger UI update
//   }
// }
