part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();
  
  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}
class CommentLoading extends CommentState {}
class CommentLoaded extends CommentState {
  final List<Comment> comments;
  CommentLoaded(this.comments);
}
class CommentError extends CommentState {
  final String message;
  CommentError(this.message);
}