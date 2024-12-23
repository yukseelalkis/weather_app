import 'package:flutter/material.dart';

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 10);
  const PagePadding.top() : super.only(top: 10);
  const PagePadding.right() : super.only(right: 10);
  const PagePadding.vertical() : super.only(right: 5, left: 5);
  const PagePadding.halfAll() : super.all(10);
}
