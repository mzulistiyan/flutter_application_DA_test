part of '../handle_api/get_post_byid_bloc.dart';

abstract class GetPostByidEvent extends Equatable {}

class GetPostByID extends GetPostByidEvent {
  @override
  List<Object?> get props => [];
}

class GetPostByIDLoadMore extends GetPostByidEvent {
  final int? currentPage;

  GetPostByIDLoadMore({
    this.currentPage,
  });
  @override
  List<Object?> get props => [currentPage];
}
