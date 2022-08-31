abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

// TODO: Any State: for simple states
class AnyState extends HomeScreenStates {}

// TODO: get home data
class GetHomeDataLoadingState extends HomeScreenStates {}

class GetHomeDataSuccessState extends HomeScreenStates {}

class GetHomeDataErrorState extends HomeScreenStates {
  final String onError;
  GetHomeDataErrorState(this.onError);
}
