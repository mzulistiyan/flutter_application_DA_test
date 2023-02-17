import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_model/response_get_list_post.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_service/beranda_service.dart';
import 'package:flutter_application_dummy_api/helper/model_for_handle_error/response_error.dart';

part '../event/get_list_post_event.dart';
part '../state/get_list_post_state.dart';

class GetListPostBloc extends Bloc<GetListPostEvent, GetListPostState> {
  final _apiServiceBeranda = BerandaService();
  GetListPostBloc() : super(GetListPostInitial()) {
    on<GetPost>((event, emit) async {
      emit(GetListPostLoading());
      try {
        final result = await _apiServiceBeranda.getListPost(
          page: 0,
        );
        if (result?.statusCode == 200) {
          debugPrint('success from GetPost');
          emit(
            GetListPostSuccess(
              responseGetListPost: ResponseGetListPost.fromJson(result?.data),
            ),
          );
        } else {
          debugPrint('bad from GetPost');
          emit(
            GetListPostError(
              responseError: ResponseError(
                status: false,
                statusCode: result?.statusCode ?? 0,
                message: result!.data.toString(),
              ),
            ),
          );
        }
      } catch (e) {
        debugPrint('error from GetPost');
        emit(
          GetListPostError(
            responseError: ResponseError(
              status: false,
              statusCode: 0,
              message: e.toString(),
            ),
          ),
        );
      }
    });
    on<GetPostLoadMore>((event, emit) async {
      emit(GetListPostLoadMoreLoading());
      try {
        final result = await _apiServiceBeranda.getListPost(
          page: event.currentPage,
        );
        if (result?.statusCode == 200) {
          debugPrint('success from GetPostLoadMore');
          emit(
            GetListPostLoadMoreSuccess(
              responseGetListPost: ResponseGetListPost.fromJson(result?.data),
            ),
          );
        } else {
          debugPrint('bad from GetPostLoadMore');
          emit(
            GetListPostError(
              responseError: ResponseError(
                status: false,
                statusCode: result?.statusCode ?? 0,
                message: result!.data.toString(),
              ),
            ),
          );
        }
      } catch (e) {
        debugPrint('error from GetPostLoadMore');
        emit(
          GetListPostError(
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
