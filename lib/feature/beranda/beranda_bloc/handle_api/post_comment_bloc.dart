import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_model/response_post_comment.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_service/beranda_service.dart';
import 'package:flutter_application_dummy_api/helper/model_for_handle_error/response_error.dart';

part '../event/post_comment_event.dart';
part '../state/post_comment_state.dart';

class PostCommentBloc extends Bloc<PostCommentEvent, PostCommentState> {
  final _apiServiceBeranda = BerandaService();

  PostCommentBloc() : super(PostCommentInitial()) {
    on<PostComment>((event, emit) async {
      try {
        final result = await _apiServiceBeranda.postComment(
          message: event.message,
          idPost: event.idPost,
          idOwner: event.idOwner,
        );
        if (result?.statusCode == 200) {
          emit(
            PostCommentSuccess(
              responsePostComment: ResponsePostComment.fromJson(result?.data),
            ),
          );
        } else {
          emit(
            PostCommentError(
              responseError: ResponseError(
                status: false,
                statusCode: result?.statusCode ?? 0,
                message: result!.data.toString(),
              ),
            ),
          );
        }
      } catch (e) {
        emit(
          PostCommentError(
            responseError: ResponseError(
              status: false,
              statusCode: 0,
              message: e.toString(),
            ),
          ),
        );
      }
    });
  }
}
