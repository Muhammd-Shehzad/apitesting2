import 'package:apitesting2/Ui/HomwScreen/GetPost1/get1_post.dart';
import 'package:apitesting2/Ui/HomwScreen/GetPost2/get_post.dart';
import 'package:apitesting2/Ui/HomwScreen/ZaheenApp/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 390),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        home: HomeScreen(),
        // Get1Post(),
        // GetPost(),
      ),
    ),
  );
}
