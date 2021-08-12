import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_shopper/pages/cart.dart';
import 'package:provider_shopper/pages/catalog.dart';
import 'package:provider_shopper/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/catalog': (context) => CatalogPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
