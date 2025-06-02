// import 'package:assignment/model/product_model.dart';
// import 'package:get/get.dart';

// class FavoritesController extends GetxController {
//   var favorites = <Product>[].obs;

//   void toggleFavorite(Product product) {
//     if (favorites.any((p) => p.id == product.id)) {
//       favorites.removeWhere((p) => p.id == product.id);
//     } else {
//       favorites.add(product);
//     }
//   }

//   bool isFavorite(String productId) {
//     return favorites.any((p) => p.id == productId);
//   }
// }
import 'package:get/get.dart';
import '../model/product_model.dart';

class FavoritesController extends GetxController {
  var favorites = <Product>[].obs;

  void toggleFavorite(Product product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
  }

  bool isFavorite(Product product) {
    return favorites.contains(product);
  }
}
