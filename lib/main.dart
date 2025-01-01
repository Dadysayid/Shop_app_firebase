import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/globale_variable.dart';
import 'package:shop_app/pages/home_page.dart';

import 'package:shop_app/pages/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: "Shoping app",
        theme: ThemeData(
            // fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromRGBO(254, 206, 1, 1),
                primary: Color.fromRGBO(254, 206, 1, 1)),
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)),
            textTheme: const TextTheme(
              titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            useMaterial3: true),
        home: HomePage(),
      ),
    );
  }
}
