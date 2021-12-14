import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog1/modules/Add%20task/add_task.dart';
import 'package:prog1/modules/archived_tasks/archived_screen.dart';
import 'package:prog1/modules/done_tasks/done_sceen.dart';
import 'package:prog1/modules/new_tasks_screen/task_screen.dart';
import 'package:prog1/shared/Network/local/shared_preferences/cache_helper.dart';
import 'package:prog1/shared/cubit/states.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List <Map> newTasks = [];
  List <Map> doneTasks = [];
  List <Map> archivedTasks = [];
  int number = 0;
  List<Widget> l1 = [
    TasksScreen(),
    DoneScreen(),
    ArchivedScreen(),
    AddTask(),
  ];
  List<String> tittles = [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks",
    "Add Task"
  ];
  late Database database;
  void changeIndex (int index)
  {
    number =index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatabase() {
   openDatabase('todo4.db', version: 1,
        onCreate: (database, version) {
          print("database created");
          database
              .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, tittle TEXT, date TEXT, time TEXT,status TEXT )')
              .then((value) {
            print('table created');
          }).catchError((error) {
            print('error on creating table ${error.toString()}');
          });
        }, onOpen: (database) {
          getDataFromDatabase(database);

          print("database opened");
        }).then((value) {
          database =value;
          emit(AppCreateDataBaseState());
   });
  }

  Future insertToDatabase(

      {required title, required date, required time}) async {
   await database.transaction((txn) async {
      txn
          .rawInsert(
          'INSERT INTO tasks (tittle,date,time,status) VALUES("$title ","$date","$time","new")')
          .then((value) {
        print("$value insert successfully");
        emit(AppInsertDataBaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print("Error on inserting ${error.toString()}");
      });
      return null;
    });
  }

  void getDataFromDatabase(database)  {
    newTasks =[];
    doneTasks =[];
    archivedTasks =[];
    emit(AppGetDataBaseLoadingState());
     database.rawQuery('SELECT * FROM tasks')
     .then((value) {
      value.forEach((element)
      {
        if(element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);
      });
      emit(AppGetDataBaseState());
    });
  }

  void updateData({
  required String status,
  required int id
})
  {
     database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id])
         .then((value)
     {
       getDataFromDatabase(database);
          emit(AppUpdateDataBaseState());
     });


  }


  void deleteData({
    required int id
  })
  {
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?',
        [id])
        .then((value)
    {
      getDataFromDatabase(database);
      emit(AppDeleteDataBaseState());

    });


  }

 bool isDark =false;

  void changeColorTheme({bool? shared})
  {
    if(shared != null)
      isDark = shared;
    else
    isDark= ! isDark;
    CacheHelper.sharedPreferences.setBool('isDark', isDark).then((value)
    {
      emit(AppChangeColorThemeState());
    });
  }
}