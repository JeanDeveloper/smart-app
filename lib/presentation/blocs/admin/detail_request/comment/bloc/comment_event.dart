part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class ShowCommentsEvent extends CommentEvent{
  final int code;
  ShowCommentsEvent(this.code);
}
class AddCommentEvent extends CommentEvent{
  final String message;
  final int codSolDoc;
  final int codState;
  final String creadoPor;
  AddCommentEvent(
    this.message, 
    this.codSolDoc, 
    this.codState,
    this.creadoPor,
  );
}
