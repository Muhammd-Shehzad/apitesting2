import 'package:apitesting2/Ui/APIsWithModel/GetComment/get_comment.dart';
import 'package:apitesting2/Ui/APIsWithOutModel/GetTodos/get_todos.dart';
import 'package:apitesting2/Ui/APIsWithOutModel/GetUser/get_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 390),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(home: GetComment()
          // GetTodos()
          // GetUser() // user without model
          // UserPost()
          // GetComment()
          // UserPostWithoutModel()
          // UserPost(),
          // GetPhoto(),
          // HomeScreen(),
          // Get1Post(),
          // GetPost(),
          ),
    ),
  );
}
