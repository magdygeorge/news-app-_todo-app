import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 10.0,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 23.0,
              backgroundImage: AssetImage('images/photo1.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Chats",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              onPressed: () {},
              iconSize: 16,
              color: Colors.white,
              icon: Icon(Icons.camera_alt),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              onPressed: () {},
              iconSize: 16,
              color: Colors.white,
              icon: Icon(Icons.edit),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 7.0,
                  horizontal: 10.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)
                    {
                      return buildStoryItem();
                    },
                    separatorBuilder: (context,index)=>SizedBox(width: 20,),
                    itemCount: 6),
              ),
              SizedBox(
                height: 25,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=>chatsBuildItems(),
                  separatorBuilder: (context,index)=>SizedBox(height: 20,),
                  itemCount: 15)
            ],
          ),
        ),
      ),
    );
  }

}
Widget chatsBuildItems() => Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("images/photo1.jpg"),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
              bottom: 3.0, end: 3.0),
          child: CircleAvatar(
            radius: 7,
            backgroundColor: Colors.green,
          ),
        ),
      ],
    ),
    SizedBox(
      width: 10,
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text
            (
            "My friend",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Expanded(child: Text
                (
                "Hello my name is magdy",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10
                ),
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text("02:00 PM",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ],
      ),
    ),
  ],
);

Widget buildStoryItem()=>  Container(
  width: 60,
  child: Column(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("images/photo1.jpg"),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: 3.0, end: 3.0),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      Text(
        "Magdy George william",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 15,
        ),
      )
    ],
  ),
);