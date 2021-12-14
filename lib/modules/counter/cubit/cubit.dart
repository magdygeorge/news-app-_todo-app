import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog1/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
CounterCubit() : super(CounterInitialState());
var counter = 0;

static CounterCubit get(context) => BlocProvider.of(context);


void minus()
{
  counter--;
  emit(CounterMinusState( counter:counter ));
}
void plus()
{
  counter++;
  emit(CounterPlusState(counter: counter));

}
}