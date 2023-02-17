import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_model/response_list_comment.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_service/beranda_service.dart';
import 'package:flutter_application_dummy_api/helper/model_for_handle_error/response_error.dart';

part '../event/get_list_comment_event.dart';
part '../state/get_list_comment_state.dart';

class GetListCommentBloc
    extends Bloc<GetListCommentEvent, GetListCommentState> {
  final _apiServiceBeranda = BerandaService();
  GetListCommentBloc() : super(GetListCommentInitial()) {
    on<GetComment>((event, emit) async {
      try {
        final result = await _apiServiceBeranda.getListCommenyByPost(
          page: 0,
          idPost: event.postId,
        );
        if (result?.statusCode == 200) {
          emit(
            GetListCommentSuccess(
              responseGetListComment:
                  ResponseGetListComment.fromJson(result?.data),
            ),
          );
        } else {
          emit(
            GetListCommentError(
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
          GetListCommentError(
            responseError: ResponseError(
              status: false,
              statusCode: 0,
              message: e.toString(),
            ),
          ),
        );
      }
    });

    on<GetCommentLoadMore>((event, emit) async {
      emit(GetListCommentLoadMoreLoading());
      try {
        final result = await _apiServiceBeranda.getListCommenyByPost(
          page: event.currentPage,
          idPost: event.postId,
        );
        if (result?.statusCode == 200) {
          debugPrint('success from GetCommentLoadMore');
          emit(
            GetListCommentLoadMoreSuccess(
              responseGetListComment:
                  ResponseGetListComment.fromJson(result?.data),
            ),
          );
        } else {
          debugPrint('bad from GetCommentLoadMore');
          emit(
            GetListCommentLoadMoreError(
              responseError: ResponseError(
                status: false,
                statusCode: result?.statusCode ?? 0,
                message: result!.data.toString(),
              ),
            ),
          );
        }
      } catch (e) {
        debugPrint('error from GetCommentLoadMore');
        emit(
          GetListCommentLoadMoreError(
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
