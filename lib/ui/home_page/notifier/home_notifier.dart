import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_assessment/ui/home_page/notifier/home_model.dart';

final homeNotifier = NotifierProvider<HomeNotifier, HomeModel>(() {
  return HomeNotifier();
});

class HomeNotifier extends Notifier<HomeModel> {
  @override
  HomeModel build() => const HomeModel();

  void initializeCount() {
    state = state.copyWith(tileDx: 0);
  }

  void initializeModal() {
    state = state.copyWith(modalDy: 0);
  }
}