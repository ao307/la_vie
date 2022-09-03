abstract class ForumsStates {}

class ForumsInitialState extends ForumsStates {}

// TODO: Any State: for simple states
class AnyState extends ForumsStates {}

// TODO: get all forums data
class GetAllForumsDataLoadingState extends ForumsStates {}

class GetAllForumsDataSuccessState extends ForumsStates {}

class GetAllForumsDataErrorState extends ForumsStates {
  final String onError;

  GetAllForumsDataErrorState(this.onError);
}

// TODO: get my forums data
class GetMyForumsDataLoadingState extends ForumsStates {}

class GetMyForumsDataSuccessState extends ForumsStates {}

class GetMyForumsDataErrorState extends ForumsStates {
  final String onError;

  GetMyForumsDataErrorState(this.onError);
}

// TODO: Comment Forums
class CommentLoadingState extends ForumsStates {}

class CommentSuccessState extends ForumsStates {}

class CommentErrorState extends ForumsStates {
  final String onError;

  CommentErrorState(this.onError);
}

// TODO: Like Forums
class LikeLoadingState extends ForumsStates {}

class LikeSuccessState extends ForumsStates {}

class LikeErrorState extends ForumsStates {
  final String onError;

  LikeErrorState(this.onError);
}

// TODO: get my forums data
class CreateForumsLoadingState extends ForumsStates {}

class CreateForumsSuccessState extends ForumsStates {}

class CreateForumsErrorState extends ForumsStates {
  final String onError;

  CreateForumsErrorState(this.onError);
}
