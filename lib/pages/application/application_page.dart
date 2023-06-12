import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/application/bloc/app_events.dart';

import '../../common/values/colors.dart';
import 'application_widget.dart';
import 'bloc/app_blocs.dart';
import 'bloc/app_states.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  // int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
                body: buildPage(state.index),
                bottomNavigationBar: Container(
                  width: 375.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.h),
                      topRight: Radius.circular(20.h),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1),
                    ],
                  ),
                  child: BottomNavigationBar(
                    currentIndex: state.index,
                    // ontap that helps us navigate between different screens
                    onTap: (value) {
                      // setState(() {
                      //   _index = value;
                      // });
                      context.read<AppBlocs>().add(TriggerAppEvent(value));
                    },
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: AppColors.primaryElement,
                    unselectedItemColor: AppColors.primaryFourthElementText,
                    items: bottomNavTab,
                  ),
                )),
          ),
        );
      },
    );
  }
}
