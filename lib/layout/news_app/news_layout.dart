import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog1/layout/news_app/cubit/cubit.dart';
import 'package:prog1/layout/news_app/cubit/states.dart';
import 'package:prog1/modules/search/search_screen.dart';
import 'package:prog1/shared/Network/remote/dio_helper.dart';
import 'package:prog1/shared/components/components.dart';
import 'package:prog1/shared/cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(onPressed: () {
                  navigateTo(context, SearchScreen());
                }, icon: Icon(Icons.search)),
                SizedBox(
                  width: 10.0,
                ),
                IconButton(
                    onPressed:(){
                  AppCubit.get(context).changeColorTheme();
                    },
                    icon: Icon(Icons.brightness_4_outlined))

              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changeBottomNavBarIndex(index);
              },
            ),
          );
        });
  }
}
