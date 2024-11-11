import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusedRow extends StatelessWidget {
  ReusedRow({super.key, required this.title, required this.value});

  String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 5.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
