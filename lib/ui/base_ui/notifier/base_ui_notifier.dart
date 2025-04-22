import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_assessment/ui/base_ui/notifier/base_ui_model.dart';

final baseNotifier = NotifierProvider<BaseUiNotifier, BaseUiModel>(() {
  return BaseUiNotifier();
});

class BaseUiNotifier extends Notifier<BaseUiModel> {
  @override
  BaseUiModel build() => const BaseUiModel();

  void updateNavIndex(int index){
    state = state.copyWith(currentIndex: index);
    matchingIndex(index);
  }

  bool matchingIndex(int index)=> index == state.currentIndex;

  void initializeNavBarOffset() {
    state = state.copyWith(navDy: 0);
  }
}
