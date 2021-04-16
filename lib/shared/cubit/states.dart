abstract class CounterStates {}

class CounterInitialStste extends CounterStates {}

class BottomChangeScreens extends CounterStates{}

class BottomChangeIndex extends CounterStates{}

// Business News

class NewGetBusinessLoadigState extends CounterStates {}

class NewGetBusinessStateSuccesc extends CounterStates {}

class NewGetBusinessStateError extends CounterStates {
  final String error;

  NewGetBusinessStateError(this.error);

}

// Sports News

class NewGetSportsLoadigState extends CounterStates {}

class NewGetSportsStateSuccesc extends CounterStates {}


class NewGetSportsStateError extends CounterStates {
  final String error;

  NewGetSportsStateError(this.error);

}
//Sicence News

class NewGetSicenceLoadigState extends CounterStates {}

class NewGetSicenceStateSuccesc extends CounterStates {}

class NewGetSicenceStateError extends CounterStates {
  final String error;

  NewGetSicenceStateError(this.error);

}

class AppChangeModeState extends CounterStates {}


