import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prog1/modules/Add%20task/add_task.dart';
import 'package:prog1/modules/archived_tasks/archived_screen.dart';
import 'package:prog1/modules/done_tasks/done_sceen.dart';
import 'package:prog1/modules/new_tasks_screen/task_screen.dart';
import 'package:prog1/shared/components/components.dart';
import 'package:prog1/shared/components/constants.dart';
import 'package:prog1/shared/cubit/cubit.dart';
import 'package:prog1/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  @override
  /*void initState() {
  super.initState();
  createDatabase();
  }*/

  @override
  Widget build(BuildContext context) {
    //AppCubit cubit = AppCubit.get(context);
    return BlocProvider(
      create: (context) =>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state)
        {

        },
        builder: (context, state) =>Scaffold(
          appBar: AppBar(
            title: Text(
              "${AppCubit.get(context).tittles[AppCubit.get(context).number]}",
            ),
          ),
          body: state is AppGetDataBaseLoadingState
              ? Center(child: CircularProgressIndicator())
              :
            AppCubit.get(context).l1[AppCubit.get(context).number],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if(formKey.currentState!.validate())
              {
                AppCubit.get(context).insertToDatabase(
                    title: titleController.text,
                    date: dateController.text,
                    time: timeController.text);
             /* insertToDatabase(
                      title: titleController.text,
                      date: dateController.text,
                      time: timeController.text)
                  .then((value) {
                getDataFromDatabase(database).then((value) {
                 tasks = value;
                 print(tasks);
                });
                print('validated');
              });*/
              }
            },
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: AppCubit.get(context).number,
            onTap: (index) {
             AppCubit.get(context).changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: "Tasks",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline),
                label: "Done",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined),
                label: "Archived",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined),
                label: "Add Task",
              ),
            ],
          ),
        ),
      ),
    );
  }
  }

