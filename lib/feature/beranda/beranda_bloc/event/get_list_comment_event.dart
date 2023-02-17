part of '../handle_api/get_list_comment_bloc.dart';

abstract class GetListCommentEvent extends Equatable {}

class GetComment extends GetListCommentEvent {
  final String? postId;
  GetComment({required this.postId});
  @override
  List<Object?> get props => [postId];
}

class GetCommentLoadMore extends GetListCommentEvent {
  final int? currentPage;
  final String? postId;

  GetCommentLoadMore({
    required this.currentPage,
    required this.postId,
  });
  @override
  List<Object?> get props => [currentPage, postId];
}
