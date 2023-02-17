part of '../handle_api/create_post_bloc.dart';

abstract class CreatePostState extends Equatable {
  const CreatePostState();

  @override
  List<Object> get props => [];
}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {
  final ResponseCreatePost responseCreatePost;

  const CreatePostSuccess({required this.responseCreatePost});
}

class CreatePostFailed extends CreatePostState {
  final ResponseError responseError;

  const CreatePostFailed({required this.responseError});

  @override
  List<Object> get props => [responseError];
}
