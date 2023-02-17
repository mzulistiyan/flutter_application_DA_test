part of '../handle_api/get_detail_post_bloc.dart';

abstract class GetDetailPostState extends Equatable {
  const GetDetailPostState();

  @override
  List<Object> get props => [];
}

class GetDetailPostInitial extends GetDetailPostState {}

class GetDetailPostLoading extends GetDetailPostState {}

class GetDetailPostSuccess extends GetDetailPostState {
  final DataPost? responseGetDetailPost;
  const GetDetailPostSuccess({this.responseGetDetailPost});
}

class GetDetailPostError extends GetDetailPostState {
  final ResponseError? responseError;
  const GetDetailPostError({this.responseError});
}
