import 'package:e_commerce_app_c9_mon/features/home/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../manager/states.dart';

class LayoutView extends StatelessWidget {

  LayoutView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HomeCubit()..getCategories(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubit = HomeCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 25,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Image.asset("assets/images/header_logo.png"),
              centerTitle: false,
            ),
            body: cubit.screens[cubit.selectedIndex],
            bottomNavigationBar: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Color(0xff004182),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor: const Color(0xff004182),
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.selectedIndex,
                onTap: (index) {
                  cubit.changeBottomNavigationBarStatus(index);
                },
                elevation: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Color(0xff004182),
                unselectedItemColor: Color(0xff004182),
                selectedIconTheme: IconThemeData(size: 30),
                unselectedIconTheme: IconThemeData(
                  size: 25,

                ),
                items: [
                  BottomNavigationBarItem(
                    label: 'home',
                    icon: SvgPicture.asset("assets/icons/home_icon.svg"),
                  ),
                  BottomNavigationBarItem(
                    label: 'home',
                    icon: SvgPicture.asset("assets/icons/category_icon.svg"),
                  ),
                  BottomNavigationBarItem(
                    label: 'home',
                    icon: SvgPicture.asset("assets/icons/favorite_icon.svg"),
                  ),
                  BottomNavigationBarItem(
                    label: 'home',
                    icon: SvgPicture.asset("assets/icons/profile_icon.svg"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
