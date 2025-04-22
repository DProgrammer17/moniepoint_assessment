import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_assessment/real_estate_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: RealEstateApp(),
    ),
  );
}
