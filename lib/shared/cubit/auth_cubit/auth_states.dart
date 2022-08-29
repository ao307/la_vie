abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

// TODO: Any State: for simple states
class AnyState extends AuthStates {}

// TODO: login states
class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String? onError;

  LoginErrorState(this.onError);
}

// TODO: sign up states
class SignUpLoadingState extends AuthStates {}

class SignUpSuccessState extends AuthStates {}

class SignUpErrorState extends AuthStates {
  final String? onError;

  SignUpErrorState(this.onError);
}
