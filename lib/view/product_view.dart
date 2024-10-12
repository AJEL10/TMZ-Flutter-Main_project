import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/controller/cart_controller.dart';
import 'package:mainproject/controller/shop_controller.dart';
import 'package:mainproject/model/shop_items.dart';
import 'product_detail_view.dart';

class ScreenProducts extends StatefulWidget {
  const ScreenProducts({super.key});

  @override
  State<ScreenProducts> createState() => _ScreenProductsState();
}

class _ScreenProductsState extends State<ScreenProducts> {
  final ShopController shopController = Get.put(ShopController());
  final CartController cartController = Get.put(CartController());

  String selectedCategory = 'All Products';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100], // Changed background color
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0), // Adjusted padding
                child: SizedBox(
                  height: 180, // Reduced height of ad slides
                  child: PageView(
                    children: [
                      _buildAdSlide('lib/assets/img/a.avif'),
                      _buildAdSlide('lib/assets/img/c.avif'),
                      _buildAdSlide('lib/assets/img/b.avif'),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50, // Reduced height for category list
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryChip('All Products', 'All Products'),
                    _buildCategoryChip('Mens Clothing', 'men\'s clothing'),
                    _buildCategoryChip('Womens Clothing', 'women\'s clothing'),
                    _buildCategoryChip('Jewelry', 'jewelery'),
                    _buildCategoryChip('Electronics', 'electronics'),
                  ],
                ),
              ),
              Obx(() {
                if (shopController.products.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<ShopItem> filteredProducts = shopController.products;
                if (selectedCategory != 'All Products') {
                  filteredProducts = shopController.products
                      .where((product) =>
                          product.category == selectedCategory.toLowerCase())
                      .toList();
                }

                if (filteredProducts.isEmpty) {
                  return const Center(child: Text('No products available.'));
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0), // Adjusted padding
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8, // Changed aspect ratio
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      ShopItem product = filteredProducts[index];
                      return Card(
                        color: Colors.white,
                        elevation: 3, // Added slight elevation for product cards
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ScreenProductDetails(product: product));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0), // Slightly increased padding
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center, // Centered content
                              children: [
                                Text(
                                  product.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15, // Slightly smaller font size
                                    color: UIColors.main,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.center, // Centered text
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 100, // Reduced image size
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      product.image,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Center(
                                          child: Icon(
                                            Icons.error,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${product.price.toString()}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14, // Adjusted font size
                                        color: UIColors.main,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: UIColors.color2,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16.0), // Added padding
                                      ),
                                      onPressed: () {
                                        cartController.addToCart(product);
                                        Get.snackbar(
                                          'Added to Cart',
                                          '${product.title} has been added to your cart.',
                                          snackPosition: SnackPosition.BOTTOM, // Changed snackbar position
                                          duration: const Duration(seconds: 1),
                                        );
                                      },
                                      child: const Text(
                                        'Add',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0), // Adjusted padding
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color: selectedCategory == category ? Colors.black : Colors.white, // Changed text color
          ),
        ),
        selected: selectedCategory == category,
        backgroundColor: Colors.grey.shade300, // Changed background color
        selectedColor: UIColors.color2,
        onSelected: (selected) {
          setState(() {
            selectedCategory = category;
          });
        },
      ),
    );
  }

  Widget _buildAdSlide(String assetPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 160, // Adjusted image height for the ad slide
      ),
    );
  }
}
