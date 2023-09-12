import 'package:flutter/material.dart';
import 'package:fz_ui_challenge/fz_ebook/pages/root_app.dart';

class AppItem {
  final int? id;
  final Widget path;
  final String? title, type, image;

  AppItem({this.id, this.type, this.title, required this.path, this.image});
}

// list of apps
// for our demo
List<AppItem> apps = [
  AppItem(
    id: 1,
    type: "UI",
    title: "FZ E_BOOK APP",
    image: "images/ebook.png",
    path: const RootApp(),
  ),
  AppItem(
    id: 4,
    type: "68",
    title: "Poppy Plastic Tub Chair",
    image: "images/Item_2.png",
    path: const RootApp(),

  ),
];
