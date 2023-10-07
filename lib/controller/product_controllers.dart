import 'package:get/get.dart';
import 'package:shop_app/controller/product_repository.dart';

class ProductController extends GetxController {
  ProductsRepository productsRepository = ProductsRepository();
  RxBool loading = false.obs;

  List products = [].obs;

  ProductController() {
    loadProductsFromRepo();
  }

  loadProductsFromRepo() async {
    loading(true);
    products = await productsRepository.loadProductsFromApi();
    // print(products);
    loading(false);
  }
}
