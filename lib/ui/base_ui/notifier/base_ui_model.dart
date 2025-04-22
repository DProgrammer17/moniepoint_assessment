import 'package:flutter/material.dart';
import 'package:moniepoint_assessment/ui/home_page/home_page.dart';
import 'package:moniepoint_assessment/ui/map_page/map_page.dart';

class BaseUiModel {
  final int? currentIndex;
  final double navDy;
  final List<Widget> navPages;

  const BaseUiModel({
    this.currentIndex = 2,
    this.navDy = 1,
    this.navPages = const [
      MapPage(),
      SizedBox(),
      HomePage(),
      SizedBox(),
      SizedBox(),
    ],
  });

  BaseUiModel copyWith({
    int? currentIndex,
    double? navDy,
    List<Widget>? navPages,
  }) {
    return BaseUiModel(
      currentIndex: currentIndex ?? this.currentIndex,
      navPages: navPages ?? this.navPages,
      navDy: navDy ?? this.navDy,
    );
  }
}
