import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/controller/cart_controller.dart';
import 'package:mainproject/model/shop_items.dart';
import 'package:mainproject/view/cart_screen.dart';

class ScreenProductDetails extends StatelessWidget {
  final ShopItem product;

  const ScreenProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: TextStyle(color: UIColors.color2), // Changed title color
        ),
        backgroundColor: Colors.white, // White background for the app bar
        elevation: 0, // No shadow
        iconTheme: IconThemeData(color: UIColors.color2), // Changed icon color
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: UIColors.color2, // Icon color matches accent color
            ),
            onPressed: () {
              Get.to(ScreenCart());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjusted padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), // Rounded image corners
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjusted padding for content
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: UIColors.color2, // Accent color for the product title
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rating: ${product.rating.rate.toString()} (${product.rating.count} reviews)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toString()}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red.shade600, // Stronger red for price
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12), // Increased space for better separation
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, height: 1.5), // Increased line height for readability
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  int quantity = cartController.cartItems[product] ?? 0;
                  return Text(
                    'Items in Cart: $quantity',
                    style: TextStyle(
                      color: UIColors.color2,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
                ElevatedButton(
                  onPressed: () {
                    cartController.addToCart(product);

                    Get.snackbar(
                      'Added to Cart',
                      '${product.title} has been added to your cart.',
                      snackPosition: SnackPosition.BOTTOM, // Moved snackbar to bottom
                      duration: const Duration(seconds: 1),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    backgroundColor: UIColors.color2, // Consistent color for buttons
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded button shape
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
