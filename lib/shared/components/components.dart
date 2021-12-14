import 'package:flutter/material.dart';
import 'package:prog1/modules/web%20view/web_view.dart';
import 'package:prog1/shared/cubit/cubit.dart';

Widget defaultButton({
  Color color = Colors.blue,
  double width = double.infinity,
  bool isUpperCase = true,
  required Function fun,
  required String text,
}) =>
    Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      width: width,
      child: MaterialButton(
        onPressed: () {
          return fun();
        },
        child: Text(
          "${isUpperCase ? text.toUpperCase() : text}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController control,
  required String label,
  required IconData icon,
  required Function function,
  Function? changed,
  Function? submitted,
  bool isPassword = false,
  required TextInputType type,
  Function? suffixPressed,
  IconData? suffixed,
  Function? tap,
  bool? isClickable = true,
}) =>
    TextFormField(
      enabled: isClickable,
      obscureText: isPassword ? true : false,
      controller: control,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
        suffixIcon: IconButton(
          icon: Icon(suffixed),
          onPressed: () {
            return suffixPressed!();
          },
        ),
      ),
      validator: (value) => function(value),
      onChanged: (value) {
        return changed!(value);
      },
      onFieldSubmitted: (value) {
        return submitted!(value);
      },
      onTap: () {
        return tap!();
      },
    );

Widget buildTaskItem(Map model,context) =>
Dismissible(
  key: Key(model['id'].toString()),
  onDismissed: (direction)
  {
  AppCubit.get(context).deleteData(id: model['id']);
  },
  child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                "${model['time']}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model['tittle']}",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${model['date']}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
                onPressed: (){
              AppCubit.get(context).updateData(status: 'done', id: model['id']);
                },
                color: Colors.green,
                icon: Icon(Icons.check_box)),
            IconButton(
                onPressed: (){
                  AppCubit.get(context).updateData(status: 'archived', id: model['id']);
                },
                color: Colors.black45,
                icon: Icon(Icons.archive)),
          ],

        ),

      ),
);



Widget buildArticleItem(article,context) =>InkWell(
  onTap: ()
  {
  navigateTo(context, WebViewScreen(article['url']));
  },
  child:  Padding(
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "  ${article['title']} ",
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow:TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
                Text(
                  "  ${article['publishedAt']}",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

void navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(
    builder: (context) => widget,));

