import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  const Product(
      {required this.name, required this.price, required this.imageUrl});

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
        name: snapshot['name'],
        price: snapshot['price'],
        imageUrl: snapshot['imageUrl']
    );

    return product;
  }

  /*
  static const List<Product> products = [
    Product(
        name: 'Pomme',
        price: 250,
        imageUrl:
            'https://pixabay.com/fr/images/download/apple-1589874_1920.jpg'),
    Product(
        name: 'Bananas',
        price: 125,
        imageUrl:
            'https://pixabay.com/fr/images/download/banana-2449019_1920.jpg'),
    Product(
        name: 'Mangue',
        price: 75,
        imageUrl:
            'https://pixabay.com/fr/images/download/exotic-21549_1920.jpg'),
    Product(
        name: 'Orange',
        price: 200,
        imageUrl:
            'https://pixabay.com/fr/images/download/tangerines-1721590_1920.jpg'),
  ];
  */
}
