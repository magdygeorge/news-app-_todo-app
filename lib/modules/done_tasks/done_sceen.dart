import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog1/shared/components/components.dart';
import 'package:prog1/shared/cubit/cubit.dart';
import 'package:prog1/shared/cubit/states.dart';

class DoneScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) =>AppCubit.get(context).doneTasks.length >0 ?
        ListView.separated(
          itemBuilder: (context,index) => buildTaskItem(AppCubit.get(context).doneTasks[index],context),
          separatorBuilder:(context,index) =>Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ) ,
          itemCount: AppCubit.get(context).doneTasks.length):Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              "No Tasks Yet, Please Add Some Tasks",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}