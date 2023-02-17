part of '../handle_api/get_detail_post_bloc.dart';

abstract class GetDetailPostEvent extends Equatable {}

class GetDetailPost extends GetDetailPostEvent {
  final String? id;

  GetDetailPost({this.id});
  @override
  List<Object?> get props => [id];
}
