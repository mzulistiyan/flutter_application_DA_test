part of '../handle_api/post_comment_bloc.dart';

abstract class PostCommentEvent extends Equatable {}

class PostComment extends PostCommentEvent {
  final String? message;
  final String? idPost;
  final String? idOwner;

  PostComment({
    this.message,
    this.idPost,
    this.idOwner,
  });

  @override
  List<Object?> get props => [message, idPost, idOwner];
}
