

import 'package:e_commarce_app/pages/category_page.dart';
import 'package:e_commarce_app/pages/new_product_page.dart';
import 'package:e_commarce_app/pages/user_page.dart';
import 'package:e_commarce_app/pages/view_product_page.dart';
import 'package:flutter/material.dart';

import '../pages/order_page.dart';

class DashboradItemModels {
  final String title;

  final IconData iconData;
  final String routeName;

  DashboradItemModels(
      {required this.title,
      required this.iconData,
      required this.routeName});
}
final dashboradItem =[
  DashboradItemModels(title:'Add Product', iconData: Icons.card_giftcard, routeName: NewProductPage.routeName),
  DashboradItemModels(title:'View Proudect', iconData: Icons.list, routeName: ViewProductPage.routeName),
  DashboradItemModels(title:'Category', iconData: Icons.category, routeName: CategoryPage.routeName),
  DashboradItemModels(title:'Order', iconData: Icons.monetization_on_rounded, routeName: OrderPage.routeName),
  DashboradItemModels(title:'User Number', iconData: Icons.group, routeName: UserPage.routeName),
];
