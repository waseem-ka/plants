import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;

  // Fetch data from backend (replace with actual API call)
  Future<void> fetchProducts() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    var serverResponse = [
      Product(imageUrl: 'https://example.com/image1.png', title: 'Magnolia Flower', price: '40\$'),
      Product(imageUrl: 'https://example.com/image2.png', title: 'Collection of Zanbak', price: '37\$'),
      Product(imageUrl: 'https://example.com/image3.png', title: 'Lily', price: '40\$'),
    ];
    products.value = serverResponse;
  }
}

class Product {
  final String imageUrl;
  final String title;
  final String price;

  Product({required this.imageUrl, required this.title, required this.price});
}
