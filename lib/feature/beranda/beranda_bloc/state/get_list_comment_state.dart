part of '../handle_api/get_list_comment_bloc.dart';

abstract class GetListCommentState extends Equatable {
  const GetListCommentState();

  @override
  List<Object> get props => [];
}

class GetListCommentInitial extends GetListCommentState {}

class GetListCommentLoading extends GetListCommentState {}

class GetListCommentSuccess extends GetListCommentState {
  final ResponseGetListComment? responseGetListComment;
  const GetListCommentSuccess({this.responseGetListComment});
}

class GetListCommentError extends GetListCommentState {
  final ResponseError? responseError;
  const GetListCommentError({this.responseError});
}

class GetListCommentLoadMoreLoading extends GetListCommentState {}

class GetListCommentLoadMoreSuccess extends GetListCommentState {
  final ResponseGetListComment? responseGetListComment;
  const GetListCommentLoadMoreSuccess({this.responseGetListComment});
}

class GetListCommentLoadMoreError extends GetListCommentState {
  final ResponseError? responseError;
  const GetListCommentLoadMoreError({this.responseError});
}
