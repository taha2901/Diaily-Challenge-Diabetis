
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarForDoctors extends StatelessWidget {
  final String title;
  const CustomAppBarForDoctors({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorsManager.mainBlue),
      child: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:  8.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
               Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('data',style: TextStyle(color: ColorsManager.mainBlue),)
            ],
          ),
        ),
      ),
    );
  }
}
