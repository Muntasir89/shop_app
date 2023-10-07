import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/product_controllers.dart';

class HomeView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final List categories = ["TShirt", "Pants", "Jeans", "Jackets", "Shirt"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        leading: BackButton(),
        elevation: 0,
        title: Text(
          "Shop App",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTop(),
            _buildCategoriesRow(),
            Expanded(
              child: Obx(() {
                if (productController.loading.value == true) {
                  return Center(child: CircularProgressIndicator());
                }
                if (productController.products.isEmpty) {
                  return Center(child: Text("No products found"));
                }
                return ListView.builder(
                    itemCount: productController.products.length,
                    padding: EdgeInsets.only(top: 16),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150,
                        color: Colors.red,
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              color: Colors.green,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productController.products[index]["title"],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Expanded(
                                      child: Text(
                                    productController.products[index]
                                        ["Descriptions"],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  Text(
                                    "\$${productController.products[index]["price"]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }),
            )
          ],
        ),
      ),
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cloths",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
              ],
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))
      ],
    );
  }

  Container _buildCategoriesRow() {
    return Container(
      height: 35.0,
      margin: EdgeInsets.only(top: 8),
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    color: index == 0 ? Colors.black87 : Colors.transparent,
                    borderRadius: BorderRadius.circular(4.0)),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: index == 0 ? Colors.white : Colors.black),
                ),
              )),
    );
  }
}
