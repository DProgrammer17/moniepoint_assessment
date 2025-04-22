class HomeModel {
  final double tileDx;
  final double modalDy;

  const HomeModel({
    this.tileDx = -1,
    this.modalDy = 1,
  });

  HomeModel copyWith({
    double? tileDx,
    double? modalDy,
  }) {
    return HomeModel(
      tileDx: tileDx ?? this.tileDx,
      modalDy: modalDy ?? this.modalDy,
    );
  }
}
