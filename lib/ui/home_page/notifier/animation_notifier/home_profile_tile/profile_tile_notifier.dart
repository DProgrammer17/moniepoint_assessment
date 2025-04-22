import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/ui/home_page/notifier/animation_notifier/home_profile_tile/profile_tile_model.dart';

final profileNotifier =
    NotifierProvider<ProfileTileNotifier, ProfileTileModel>(() {
  return ProfileTileNotifier();
});

class ProfileTileNotifier extends Notifier<ProfileTileModel> {
  @override
  ProfileTileModel build() => const ProfileTileModel();

  void initializeAnimation({required TickerProvider vsync}) {
    state = state.copyWith(
      controller: AnimationController(
        duration: const Duration(seconds: 2),
        vsync: vsync,
      ),
    );
    state = state.copyWith(
      animation: Tween<double>(begin: 0, end: 150.aw).animate(state.controller!),
    );
    state.controller?.forward();
  }
}
