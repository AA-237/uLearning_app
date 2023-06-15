import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildHomeAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageText(
              "Hello",
              color: AppColors.primaryThirdElementText,
            ),
            homePageText(
              "Anderson",
              top: 5,
            ),
            SizedBox(height: 20.h,),
            searchView(),
          ],
        ),
      ),
    );
  }
}
