import 'package:flutter/material.dart';

class ProfileTileModel{
  final Animation<double>? animation;
  final AnimationController? controller;

  const ProfileTileModel({
    this.animation,
    this.controller,
});

  ProfileTileModel copyWith({
    Animation<double>? animation,
    AnimationController? controller,
}){
    return ProfileTileModel(
      animation: animation ?? this.animation,
      controller: controller ?? this.controller,
    );
  }
}