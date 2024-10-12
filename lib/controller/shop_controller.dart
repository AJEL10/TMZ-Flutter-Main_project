import 'package:get/get.dart';
import 'package:mainproject/core/api_provider.dart';
import 'package:mainproject/model/shop_items.dart';

class ShopController extends GetxController {
  var products = <ShopItem>[].obs;
  final ApiProvider apiProvider = ApiProvider();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      List<ShopItem> fetchedProducts = await apiProvider.fetchProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products');
    }
  }
}
