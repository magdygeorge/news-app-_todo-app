abstract class CounterStates{}


class CounterInitialState extends CounterStates
{
}

class CounterMinusState extends CounterStates
{
 late final int counter ;
  CounterMinusState({required this.counter});
}
class CounterPlusState extends CounterStates {

  late final int counter ;
  CounterPlusState({required this.counter});
}

