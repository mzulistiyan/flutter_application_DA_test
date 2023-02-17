part of '../handle_api/get_list_post_bloc.dart';

abstract class GetListPostState extends Equatable {
  const GetListPostState();

  @override
  List<Object> get props => [];
}

class GetListPostInitial extends GetListPostState {}

class GetListPostLoading extends GetListPostState {}

class GetListPostSuccess extends GetListPostState {
  final ResponseGetListPost? responseGetListPost;
  const GetListPostSuccess({this.responseGetListPost});
}

class GetListPostError extends GetListPostState {
  final ResponseError? responseError;
  const GetListPostError({this.responseError});
}

class GetListPostLoadMoreLoading extends GetListPostState {}

class GetListPostLoadMoreSuccess extends GetListPostState {
  final ResponseGetListPost? responseGetListPost;
  const GetListPostLoadMoreSuccess({this.responseGetListPost});
}

class GetListPostLoadMoreError extends GetListPostState {
  final ResponseError? responseError;
  const GetListPostLoadMoreError({this.responseError});
}
