part of '../handle_api/get_post_byid_bloc.dart';

abstract class GetPostByidState extends Equatable {
  const GetPostByidState();

  @override
  List<Object> get props => [];
}

class GetPostByidInitial extends GetPostByidState {}

class GetPostByidLoading extends GetPostByidState {}

class GetPostByidSuccess extends GetPostByidState {
  final ResponseGetPostByID? responseGetPostByid;
  const GetPostByidSuccess({this.responseGetPostByid});
}

class GetPostByidError extends GetPostByidState {
  final ResponseError? responseError;
  const GetPostByidError({this.responseError});
}

class GetPostByidLoadMoreLoading extends GetPostByidState {}

class GetPostByidLoadMoreSuccess extends GetPostByidState {
  final ResponseGetPostByID? responseGetPostByid;
  const GetPostByidLoadMoreSuccess({this.responseGetPostByid});
}

class GetPostByidLoadMoreError extends GetPostByidState {
  final ResponseError? responseError;
  const GetPostByidLoadMoreError({this.responseError});
}
