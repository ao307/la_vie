abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

// TODO: Any State: for simple states
class AnyState extends ProfileStates {}

// TODO: get home data
class GetProfileDataLoadingState extends ProfileStates {}

class GetProfileDataSuccessState extends ProfileStates {}

class GetProfileDataErrorState extends ProfileStates {
  final String onError;
  GetProfileDataErrorState(this.onError);
}
