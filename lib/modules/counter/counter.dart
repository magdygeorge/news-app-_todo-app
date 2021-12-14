import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog1/modules/counter/cubit/cubit.dart';
import 'package:prog1/modules/counter/cubit/states.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CounterCubit()  ,
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state) {
          if (state is CounterMinusState) print(" minus state ${state.counter}");
          if (state is CounterPlusState) print(" plus state ${state.counter}");
        } ,
        builder: (context,state) => Scaffold(
          appBar: AppBar(
            title: Text("Counter"),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                   CounterCubit.get(context).minus();
                  },
                  child: Text("Minus",
                    style: TextStyle(fontSize: 25.0),),

                ),
                Text(
                  "${CounterCubit.get(context).counter}",
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    CounterCubit.get(context).plus();
                  },
                  child: Text("plus",
                    style: TextStyle(fontSize: 25.0),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
