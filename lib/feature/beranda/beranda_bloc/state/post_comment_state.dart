part of '../handle_api/post_comment_bloc.dart';

abstract class PostCommentState extends Equatable {
  const PostCommentState();

  @override
  List<Object> get props => [];
}

class PostCommentInitial extends PostCommentState {}

class PostCommentLoading extends PostCommentState {}

class PostCommentSuccess extends PostCommentState {
  final ResponsePostComment? responsePostComment;

  const PostCommentSuccess({this.responsePostComment});
}

class PostCommentError extends PostCommentState {
  final ResponseError? responseError;

  const PostCommentError({this.responseError});
}
