import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/domain/entities/comment.dart';
import 'package:smart/domain/usecases/request/get_list_comments.dart';
import 'package:smart/domain/usecases/request/register_comment.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {

  final GetListComments getListComment;
  final RegisterComment registerComment;


  CommentBloc(this.getListComment, this.registerComment) : super(CommentInitial()) {
    on<CommentEvent>((event, emit) async {

      if( event is ShowCommentsEvent  ){
        emit(CommentLoading());
        final comments = await getListComment(event.code);
        emit(_failureOrComments(comments));
      }

      if( event is AddCommentEvent ){
        emit(CommentLoading());
        final estado =  await registerComment(event.codSolDoc, event.codState, event.message, event.creadoPor);
        final comments = await getListComment(event.codSolDoc);
        emit( _failureOrComments(comments));
      }
    });
  }

  CommentState _failureOrComments(Either<Failure, List<Comment>> failureOrObservation){
    return failureOrObservation.fold(
      (failure) => CommentError(_mapFailureToMessage(failure)), 
      ( comments) {
        return CommentLoaded(comments);
      }
    );
  }

  String _mapFailureToMessage( Failure failure ){
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ha ocurrido un error, Por favor intenta denuevo";
      case AuthFailure:
        return failure.message;
      default:
        return "Error inesperado";
    }
  }


}
