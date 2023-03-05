import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_cart/models/Product.dart';
import 'package:shopping_cart/models/Product.dart';

class FirestoreDB {
  // Initialize Firebase Firestore
  FirebaseFirestore _firebaseFiresotre = FirebaseFirestore.instance;

  Stream<List<Product>> getAllproducts() {
    return _firebaseFiresotre
        .collection('products')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) => 
            Product.fromSnapshot(doc)).toList();
        });
  }
}
