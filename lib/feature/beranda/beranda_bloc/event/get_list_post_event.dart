part of '../handle_api/get_list_post_bloc.dart';

abstract class GetListPostEvent extends Equatable {}

class GetPost extends GetListPostEvent {
  @override
  List<Object?> get props => [];
}

class GetPostLoadMore extends GetListPostEvent {
  final int? currentPage;

  GetPostLoadMore({
    this.currentPage,
  });
  @override
  List<Object?> get props => [currentPage];
}
