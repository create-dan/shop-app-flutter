// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_udemy/screens/edit_product_screen.dart';
import 'package:shop_app_udemy/screens/user_products_screen.dart';
import 'package:shop_app_udemy/widgets/user_product_item.dart';
import 'providers/products.dart';
import 'package:shop_app_udemy/providers/cart.dart';
import 'package:shop_app_udemy/providers/orders.dart';
import 'package:shop_app_udemy/screens/product_overview_screen.dart';
import 'package:shop_app_udemy/screens/product_detail_screen.dart';
import 'package:shop_app_udemy/screens/cart_screen.dart';
import 'package:shop_app_udemy/screens/orders_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreens.routeName: (ctx) => OrderScreens(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
