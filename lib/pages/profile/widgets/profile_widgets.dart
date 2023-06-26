import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/colors.dart';

import '../../../common/widgtes/base_text_widget.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 12.h,
            width: 18.w,
            child: Image.asset('assets/icons/menu.png'),
          ),
          reusableText('Profile'),
          SizedBox(
            height: 22.h,
            width: 24.w,
            child: Image.asset('assets/icons/more-vertical.png'),
          ),
        ],
      ),
    ),
  );
}

// profileIcon and edit icon
Widget profileIconAndEdithbtn() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: const DecorationImage(
          image: AssetImage('assets/icons/headpic.png'),
        )),
    child: Image(
      image: const AssetImage('assets/icons/edit_3.png'),
      width: 25.w,
      height: 25.h,
    ),
  );
}

// setting section buttons
var imagesInfo = <String, String>{
  "Settings": 'settings.png',
  "Payment details": 'credit-card.png',
  "Archievement": 'award.png',
  "Love": 'heart(1).png',
  "Learning Reminders": 'cube.png',
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
          imagesInfo.length,
          (index) => GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        padding: const EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                            color: AppColors.primaryElement,
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Image.asset(
                            'assets/icons/${imagesInfo.values.elementAt(index)}'),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        imagesInfo.keys.elementAt(index),
                        style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ))
    ],
  );
}
