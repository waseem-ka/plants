class Product {
  final String imageUrl;
  final String title;
  final String price;

  Product({required this.imageUrl, required this.title, required this.price});
}

// Function to return hardcoded products
List<Product> getHardcodedProducts() {
  return [
    Product(
        imageUrl: 'https://example.com/image1.png',
        title: 'Magnolia Flower',
        price: '40\$'),
    Product(
        imageUrl: 'https://example.com/image2.png',
        title: 'Collection of Zanbak',
        price: '37\$'),
    Product(
        imageUrl: 'https://example.com/image3.png',
        title: 'Lily',
        price: '40\$'),
  ];
}
