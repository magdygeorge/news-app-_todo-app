import 'package:flutter/material.dart';
import 'package:prog1/models/users/users.dart';


class UserScreen extends StatelessWidget {
  List <UserModel> users=[
    UserModel(id: 1, name: "Magdy", phone: "01063227001"),
    UserModel(id: 2, name: "Ali", phone: "01063228331"),
    UserModel(id: 3, name: "Youssef", phone: "01063215221"),
    UserModel(id: 1, name: "Magdy", phone: "01063227001"),
    UserModel(id: 2, name: "Ali", phone: "01063228331"),
    UserModel(id: 3, name: "Youssef", phone: "01063215221"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Users",
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context,index)=>buildItem(users[index]),
          separatorBuilder:(context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey,
            ),
          ),
          itemCount: users.length),
    );
  }
  Widget buildItem(UserModel users)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.blue,
          child: Text(
            "${users.id}",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${users.name}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${users.phone}",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
