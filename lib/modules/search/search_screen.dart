import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog1/layout/news_app/cubit/cubit.dart';
import 'package:prog1/layout/news_app/cubit/states.dart';
import 'package:prog1/shared/components/components.dart';



class SearchScreen extends StatelessWidget {
  TextEditingController search =new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {},
        builder: (context, state) =>NewsCubit.get(context).search.length>0?
        Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                    changed: (value)
                    {
                      NewsCubit.get(context).getSearch(value);
                    },
                    control:search ,
                    label: 'search',
                    icon: Icons.search,
                    function: (String value)
                    {
                      if(value.isEmpty)
                        return 'search must not be empty';
                      return null;
                    },
                    type:TextInputType.text ),
              ),
              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildArticleItem(NewsCubit.get(context).search[index],context),
                    separatorBuilder: (context, index) => Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey,
                    ),
                    itemCount: NewsCubit.get(context).search.length),
              )

            ],
          ),
        ):
        Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: defaultTextFormField(
                        changed: (value)
                        {
                          NewsCubit.get(context).getSearch(value);
                        },
                        control:search ,
                        label: 'search',
                        icon: Icons.search,
                        function: (String value)
                        {
                          if(value.isEmpty)
                            return 'search must not be empty';
                          return null;
                        },
                        type:TextInputType.text ),
                  ),
                  Center(child: CircularProgressIndicator(),),
                ],
              ),
            )

    );
  }
}
