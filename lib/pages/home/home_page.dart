import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_bloc_event.dart';

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
      body:
          BlocBuilder<HomePageBlocs, HomePageStates>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
          child: CustomScrollView(
            // slivers gives better control how to do animation and scrolling
            // and are not widgets have performace optimsie and griddings
            slivers: [
              SliverToBoxAdapter(
                child: homePageText(
                  "Hello",
                  color: AppColors.primaryThirdElementText,
                ),
              ),
              SliverToBoxAdapter(
                child: homePageText(
                  "Anderson",
                  top: 5,
                ),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 20.h)),
              SliverToBoxAdapter(child: searchView()),
              SliverToBoxAdapter(child: slidersView(context, state)),
              SliverToBoxAdapter(child: menuView()),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 18.h,
                  horizontal: 0.w,
                ),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6),
                  delegate: SliverChildBuilderDelegate(childCount: 4,
                      (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: courseGrid(),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
