import 'package:animated_text_kit/animated_text_kit.dart';

class HomeModel {
  final double tileDx;
  final double modalDy;
  final bool fadeInCountTiles;

  const HomeModel({
    this.tileDx = -1,
    this.modalDy = 1,
    this.fadeInCountTiles = false,
  });

  HomeModel copyWith({
    double? tileDx,
    double? modalDy,
    bool? fadeInCountTiles,
  }) {
    return HomeModel(
      tileDx: tileDx ?? this.tileDx,
      modalDy: modalDy ?? this.modalDy,
      fadeInCountTiles: fadeInCountTiles ?? this.fadeInCountTiles,
    );
  }
}
