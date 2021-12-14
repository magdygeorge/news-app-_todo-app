import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog1/layout/news_app/cubit/cubit.dart';
import 'package:prog1/layout/news_app/cubit/states.dart';
import 'package:prog1/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var list = NewsCubit.get(context).business;
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) => NewsCubit.get(context).business.length>0
          ? ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleItem(NewsCubit.get(context).business[index],context),
              separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey,
                  ),
              itemCount: NewsCubit.get(context).business.length)
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
