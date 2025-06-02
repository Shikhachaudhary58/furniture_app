// import 'package:assignment/controller/favourite_controller.dart';
// import 'package:assignment/model/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ProductCard extends StatelessWidget {
//   final Product product;

//   ProductCard({super.key, required this.product});

//   final favController = Get.find<FavoritesController>();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       // elevation: 3,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(12)),
//                 // child: Image.network(
//                 //   product.imageUrl,
//                 //   height: 120,
//                 //   width: double.infinity,
//                 //   fit: BoxFit.cover,
//                 // ),
//                 child: Image.asset(
//                   product.imageUrl,
//                   // height: 120,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 right: 8,
//                 top: 8,
//                 child: Obx(() {
//                   final isFav = favController.isFavorite(product.id);
//                   return IconButton(
//                     icon: Icon(isFav ? Icons.favorite : Icons.favorite_border,
//                         color: Colors.red),
//                     onPressed: () => favController.toggleFavorite(product),
//                   );
//                 }),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(product.name,
//                 style: const TextStyle(fontWeight: FontWeight.w600)),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(
//               '₹${product.discountedPrice.toStringAsFixed(0)}',
//               style: const TextStyle(fontSize: 16, color: Colors.green),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(
//               '${product.discount.toInt()}% off',
//               style: const TextStyle(fontSize: 12, color: Colors.orange),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:assignment/view/wishlist/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:assignment/model/product_model.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
// import 'package:assignment/view/product_detail_screen.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // onEnter: (_) => setState(() => isHovered = true),
      // onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProductDetailScreen(product: widget.product));
        },
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.product.imageUrl,
                  // isHovered
                  //     ? widget.product.image3DUrl ?? ''
                  //     : widget.product.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.product.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  children: [
                    Text("₹${widget.product.price}"),
                    const Gap(10),
                    Text(
                      "${widget.product.discount ?? ''}",
                      style: const TextStyle(
                        decoration: TextDecoration
                            .lineThrough, // <-- This adds the cut line
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                child: Container(
                  // alignment: Alignment.bottomLeft,
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.amberAccent.shade400,
                      borderRadius: BorderRadius.circular(6)
                      // borderRadius: const BorderRadius.only(
                      //     bottomLeft: Radius.circular(12),
                      //     topRight: Radius.circular(12))
                      ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${widget.product.rating}"),
                        const Spacer(),
                        Icon(
                          Icons.star,
                          color: Colors.green.shade900,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
