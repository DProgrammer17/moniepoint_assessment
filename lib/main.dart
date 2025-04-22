import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_assessment/real_estate_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();//

  runApp(
    const ProviderScope(
      child: RealEstateApp(),
    ),
  );
}
