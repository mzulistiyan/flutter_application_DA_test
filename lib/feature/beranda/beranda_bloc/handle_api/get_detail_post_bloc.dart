import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_model/response_detail_post.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_model/response_get_list_post.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_service/beranda_service.dart';
import 'package:flutter_application_dummy_api/helper/model_for_handle_error/response_error.dart';

part '../event/get_detail_post_event.dart';
part '../state/get_detail_post_state.dart';

class GetDetailPostBloc extends Bloc<GetDetailPostEvent, GetDetailPostState> {
  final _apiServiceBeranda = BerandaService();
  GetDetailPostBloc() : super(GetDetailPostInitial()) {
    on<GetDetailPost>((event, emit) async {
      emit(GetDetailPostLoading());
      try {
        final result = await _apiServiceBeranda.getDetailPost(
          idPost: event.id,
        );
        if (result?.statusCode == 200) {
          debugPrint('success from GetPost');
          emit(
            GetDetailPostSuccess(
              responseGetDetailPost: DataPost.fromJson(result?.data),
            ),
          );
        } else {
          debugPrint('bad from GetPost');
          emit(
            GetDetailPostError(
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
          GetDetailPostError(
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
