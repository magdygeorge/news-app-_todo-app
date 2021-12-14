import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prog1/shared/components/components.dart';
import 'package:prog1/shared/components/constants.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultTextFormField(
                          control: titleController,
                          label: "Task Tittle",
                          icon: Icons.title,
                          function: (String value) {
                            if (value.isEmpty) return "title must not empty";
                            return null;
                          },
                          type: TextInputType.text),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultTextFormField(
                          control: timeController,
                          tap: () {
                            print("timing table");
                            showTimePicker(
                                    context: context, initialTime: TimeOfDay.now())
                                .then((value) {
                              timeController.text = value!.format(context);
                              print(value.format(context));
                            });
                          },
                          label: "Task Time",
                          icon: Icons.watch_later_outlined,
                          function: (String value) {
                            if (value.isEmpty) return "Time must not empty";
                            return null;
                          },
                          type: TextInputType.datetime),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultTextFormField(
                          control: dateController,
                          tap: () {
                            print("date table");
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2021-12-03'))
                                .then((value) {
                              dateController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                          label: "Task date",
                          icon: Icons.calendar_today,
                          function: (String value) {
                            if (value.isEmpty) return "Date must not empty";
                            return null;
                          },
                          type: TextInputType.datetime),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
