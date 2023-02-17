import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_model/response_create_post.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_service/beranda_service.dart';
import 'package:flutter_application_dummy_api/helper/model_for_handle_error/response_error.dart';

part '../event/create_post_event.dart';
part '../state/create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final _apiServiceBeranda = BerandaService();
  CreatePostBloc() : super(CreatePostInitial()) {
    on<CreatePost>((event, emit) async {
      try {
        final result = await _apiServiceBeranda.createNewPost(
          text: event.message,
          image: event.image,
          listTag: event.listTag!,
          idOwner: event.idOwner,
        );

        if (result?.statusCode == 200) {
          emit(
            CreatePostSuccess(
              responseCreatePost: ResponseCreatePost.fromJson(result?.data),
            ),
          );
        } else {
          emit(
            CreatePostFailed(
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
          CreatePostFailed(
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
