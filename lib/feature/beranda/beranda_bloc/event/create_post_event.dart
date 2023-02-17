part of '../handle_api/create_post_bloc.dart';

abstract class CreatePostEvent extends Equatable {}

class CreatePost extends CreatePostEvent {
  final String? message;
  final String? image;
  final List<String>? listTag;
  final String? idOwner;

  CreatePost({
    this.message,
    this.image,
    this.listTag,
    this.idOwner,
  });

  @override
  List<Object?> get props => [message, image, idOwner, listTag];
}
