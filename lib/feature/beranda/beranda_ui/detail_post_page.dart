import 'package:flutter/material.dart';

import 'package:flutter_application_dummy_api/feature/beranda/beranda_bloc/handle_api/get_detail_post_bloc.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_bloc/handle_api/get_list_comment_bloc.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_bloc/handle_api/post_comment_bloc.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_model/response_detail_post.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_model/response_list_comment.dart';
import 'package:flutter_application_dummy_api/helper/color_helper.dart';
import 'package:flutter_application_dummy_api/helper/default_image_helper.dart';
import 'package:flutter_application_dummy_api/helper/reusable_widget_helper/custom_card_post.dart';
import 'package:flutter_application_dummy_api/helper/reusable_widget_helper/custom_pagination_loading.dart';
import 'package:flutter_application_dummy_api/helper/string_extension_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPostPage extends StatefulWidget {
  String idPost;
  DetailPostPage({
    super.key,
    required this.idPost,
  });

  @override
  State<DetailPostPage> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  final GetDetailPostBloc _getDetailPostBloc = GetDetailPostBloc();
  final GetListCommentBloc _getListCommentBloc = GetListCommentBloc();
  final ScrollController _scrollController = ScrollController();
  final _messageController = TextEditingController(text: '');

  final _commentPostBloc = PostCommentBloc();

  String? image;
  int currentPage = 1;
  final List<Data> _listDataComment = [];

  void _checkPagination() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _getListCommentBloc.add(GetCommentLoadMore(
        currentPage: currentPage++,
        postId: widget.idPost,
      ));
    }
  }

  @override
  void initState() {
    _getDetailPostBloc.add(GetDetailPost(id: widget.idPost));
    _getListCommentBloc.add(GetComment(postId: widget.idPost));
    _scrollController.addListener(_checkPagination);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 26, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              BlocConsumer<GetDetailPostBloc, GetDetailPostState>(
                bloc: _getDetailPostBloc,
                listener: (context, state) {
                  debugPrint('state: $state');
                  if (state is GetDetailPostSuccess) {
                    setState(() {
                      image =
                          state.responseGetDetailPost!.owner!.picture ?? null;
                    });
                    debugPrint(image);
                  }
                },
                builder: (context, state) {
                  if (state is GetDetailPostLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetDetailPostSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCardPost(
                          dataPost: state.responseGetDetailPost!,
                          onPressed: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            state.responseGetDetailPost!.text ?? '',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xff828282),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is GetDetailPostError) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  return const SizedBox();
                },
              ),
              BlocConsumer<GetListCommentBloc, GetListCommentState>(
                bloc: _getListCommentBloc,
                listener: (context, state) {
                  debugPrint('state is $state');
                  if (state is GetListCommentSuccess) {
                    if (state.responseGetListComment!.data!.isNotEmpty) {
                      _listDataComment
                          .addAll(state.responseGetListComment?.data ?? []);
                    } else {
                      if (_listDataComment.isNotEmpty) {
                        Fluttertoast.showToast(
                            backgroundColor:
                                ColorHelper.primaryColor.withOpacity(0.6),
                            msg: 'Anda sudah mencapai batas halaman');
                      } else {
                        Fluttertoast.showToast(
                            backgroundColor:
                                ColorHelper.primaryColor.withOpacity(0.6),
                            msg: 'Tidak ada data komentar yang ditampilkan');
                      }
                    }
                  }

                  if (state is GetListCommentLoadMoreSuccess) {
                    if (state.responseGetListComment!.data!.isNotEmpty) {
                      _listDataComment
                          .addAll(state.responseGetListComment?.data ?? []);
                    } else {
                      if (_listDataComment.isNotEmpty) {
                        Fluttertoast.showToast(
                            backgroundColor:
                                ColorHelper.primaryColor.withOpacity(0.6),
                            msg: 'Anda sudah mencapai batas halaman');
                      } else {
                        Fluttertoast.showToast(
                            backgroundColor:
                                ColorHelper.primaryColor.withOpacity(0.6),
                            msg: 'Tidak ada data komentar yang ditampilkan');
                      }
                    }
                  }
                },
                builder: (context, state) {
                  if (state is GetListCommentLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetListCommentSuccess ||
                      state is GetListCommentLoadMoreLoading ||
                      state is GetListCommentLoadMoreSuccess ||
                      state is GetListCommentLoadMoreError) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _getListCommentBloc.add(
                          GetComment(
                            postId: widget.idPost,
                          ),
                        );
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: _listDataComment.length + 1,
                        itemBuilder: (context, index) {
                          if (index < _listDataComment.length) {
                            return cardComment(_listDataComment[index]);
                          } else {
                            if (state is GetListCommentLoadMoreLoading) {
                              return const CustomPaginationLoading();
                            } else if (state is GetListCommentLoadMoreError) {
                              return Center(
                                child: Container(
                                  color: Colors.transparent,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _getListCommentBloc.add(
                                        GetCommentLoadMore(
                                          currentPage: currentPage,
                                          postId: widget.idPost,
                                        ),
                                      );
                                    },
                                    child: const Text('Error'),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }
                        },
                      ),
                    );
                  } else if (state is GetListCommentError) {
                    return Center(
                      child: Container(
                        color: Colors.transparent,
                        child: ElevatedButton(
                          onPressed: () {
                            _getListCommentBloc.add(
                              GetCommentLoadMore(
                                currentPage: currentPage,
                                postId: widget.idPost,
                              ),
                            );
                          },
                          child: const Text('Error'),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        image ?? DefaultImageHelper.avatar,
                      ),
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                BlocConsumer<PostCommentBloc, PostCommentState>(
                  bloc: _commentPostBloc,
                  listener: (context, state) {
                    debugPrint('state is $state');
                    if (state is PostCommentLoading) {
                    } else if (state is PostCommentSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPostPage(
                            idPost: widget.idPost,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor:
                              ColorHelper.primaryColor.withOpacity(0.7),
                          content: Text(
                            "Success Comment",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Expanded(
                      child: Container(
                        height: 30,
                        child: Center(
                          child: TextFormField(
                            controller: _messageController,
                            onFieldSubmitted: (value) {
                              debugPrint(_messageController.text);
                              _commentPostBloc.add(
                                PostComment(
                                  message: _messageController.text,
                                  idPost: widget.idPost,
                                  idOwner: '60d0fe4f5311236168a10a0b',
                                ),
                              );
                            },
                            style: GoogleFonts.poppins(fontSize: 14),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                bottom: 25 / 2, // HERE THE IMPORTANT PART
                              ),
                              hintText: 'Add a comment',
                              hintStyle: GoogleFonts.poppins(fontSize: 12),
                              fillColor: Colors.blue,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Container cardComment(Data dataListComment) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF6F7F9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  dataListComment.owner!.picture ??
                      'https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg',
                ),
              ),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${dataListComment.owner!.firstName} ${dataListComment.owner!.lastName!}",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff212121),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                dataListComment.message ?? '',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xff212121),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                StringExtension.displayTimeAgoFromTimestamp(
                    dataListComment.publishDate!),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xffBDBDBD),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
