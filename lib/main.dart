import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/catalogue_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

initFire() async {
  // init firebase 
  
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping cart',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CatalogScreen(),
    );
  }
}
