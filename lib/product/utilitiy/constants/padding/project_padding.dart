import 'package:flutter/material.dart';

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 10);
  const PagePadding.top() : super.only(top: 10);
  const PagePadding.top4x() : super.only(top: 40);
  const PagePadding.top4xRight() : super.only(top: 40, right: 10);

  const PagePadding.right() : super.only(right: 10);
  const PagePadding.vertical() : super.only(right: 5, left: 5);
  const PagePadding.halfAll() : super.all(10);
  const PagePadding.symetric() : super.symmetric(horizontal: 10, vertical: 10);
  const PagePadding.onlyVertical() : super.symmetric(vertical: 8);
  const PagePadding.all2x() : super.all(40);
  const PagePadding.custom() : super.only(left: 40);
  const PagePadding.home() : super.all(16.0);
}
