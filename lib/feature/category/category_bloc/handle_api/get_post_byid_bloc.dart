import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/feature/category/category_model/response_get_post_byid.dart';
import 'package:flutter_application_dummy_api/feature/category/category_service/category_service.dart';
import 'package:flutter_application_dummy_api/helper/model_for_handle_error/response_error.dart';

part '../event/get_post_byid_event.dart';
part '../state/get_post_byid_state.dart';

class GetPostByidBloc extends Bloc<GetPostByidEvent, GetPostByidState> {
  final _apiServiceCategory = CategoryService();
  GetPostByidBloc() : super(GetPostByidInitial()) {
    on<GetPostByID>((event, emit) async {
      emit(GetPostByidLoading());
      try {
        final result = await _apiServiceCategory.getListPost(
          page: 0,
        );
        if (result?.statusCode == 200) {
          debugPrint('success from GetPost');
          emit(
            GetPostByidSuccess(
              responseGetPostByid: ResponseGetPostByID.fromJson(result?.data),
            ),
          );
        } else {
          debugPrint('bad from GetPost');
          emit(
            GetPostByidError(
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
          GetPostByidError(
            responseError: ResponseError(
              status: false,
              statusCode: 0,
              message: e.toString(),
            ),
          ),
        );
      }
    });
    on<GetPostByIDLoadMore>((event, emit) async {
      emit(GetPostByidLoadMoreLoading());
      try {
        final result = await _apiServiceCategory.getListPost(
          page: event.currentPage,
        );
        if (result?.statusCode == 200) {
          debugPrint('success from GetPostLoadMore');
          emit(
            GetPostByidLoadMoreSuccess(
              responseGetPostByid: ResponseGetPostByID.fromJson(result?.data),
            ),
          );
        } else {
          debugPrint('bad from GetPostLoadMore');
          emit(
            GetPostByidError(
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
          GetPostByidError(
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
