import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_bloc/handle_api/get_list_post_bloc.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_model/response_get_list_post.dart';
import 'package:flutter_application_dummy_api/helper/color_helper.dart';
import 'package:flutter_application_dummy_api/helper/reusable_widget_helper/custom_card_post.dart';
import 'package:flutter_application_dummy_api/helper/reusable_widget_helper/custom_pagination_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_post_page.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final GetListPostBloc _getListPostBloc = GetListPostBloc();
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;
  final List<DataPost> _listDataPost = [];

  void _checkPagination() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _getListPostBloc.add(GetPostLoadMore(currentPage: currentPage++));
    }
  }

  @override
  void initState() {
    _getListPostBloc.add(GetPost());
    _scrollController.addListener(_checkPagination);

    super.initState();
  }

  @override
  void dispose() {
    _getListPostBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffF6F7F9),
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0,
            title: Text(
              'Flutter Test',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: BlocConsumer<GetListPostBloc, GetListPostState>(
            bloc: _getListPostBloc,
            listener: (context, state) {
              debugPrint('state is $state');
              if (state is GetListPostSuccess) {
                if (state.responseGetListPost!.data!.isNotEmpty) {
                  _listDataPost.addAll(state.responseGetListPost?.data ?? []);
                } else {
                  if (_listDataPost.isNotEmpty) {
                    Fluttertoast.showToast(
                        backgroundColor:
                            ColorHelper.primaryColor.withOpacity(0.6),
                        msg: 'Anda sudah mencapai batas halaman');
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Tidak ada data yang ditampilkan');
                  }
                }
              }

              if (state is GetListPostLoadMoreSuccess) {
                if (state.responseGetListPost!.data!.isNotEmpty) {
                  _listDataPost.addAll(state.responseGetListPost?.data ?? []);
                } else {
                  if (_listDataPost.isNotEmpty) {
                    Fluttertoast.showToast(
                        backgroundColor:
                            ColorHelper.primaryColor.withOpacity(0.6),
                        msg: 'Anda sudah mencapai batas halaman');
                  } else {
                    Fluttertoast.showToast(
                        backgroundColor:
                            ColorHelper.primaryColor.withOpacity(0.6),
                        msg: 'Tidak ada data yang ditampilkan');
                  }
                }
              }
            },
            builder: (context, state) {
              if (state is GetListPostLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetListPostSuccess ||
                  state is GetListPostLoadMoreLoading ||
                  state is GetListPostLoadMoreSuccess ||
                  state is GetListPostLoadMoreError) {
                return RefreshIndicator(
                  onRefresh: () async {
                    _getListPostBloc.add(
                      GetPost(),
                    );
                  },
                  child: ListView.separated(
                      padding: const EdgeInsets.all(20),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      controller: _scrollController,
                      itemCount: _listDataPost.length + 1,
                      itemBuilder: (context, index) {
                        if (index < _listDataPost.length) {
                          return CustomCardPost(
                            dataPost: _listDataPost[index],
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPostPage(
                                    idPost: _listDataPost[index].id!,
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          if (state is GetListPostLoadMoreLoading) {
                            return const CustomPaginationLoading();
                          } else if (state is GetListPostLoadMoreError) {
                            return Center(
                              child: Container(
                                color: Colors.transparent,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _getListPostBloc.add(
                                      GetPostLoadMore(
                                        currentPage: currentPage,
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
                      }),
                );
              } else if (state is GetListPostError) {
                return Center(
                  child: Container(
                    color: Colors.transparent,
                    child: ElevatedButton(
                      onPressed: () {
                        _getListPostBloc.add(
                          GetPostLoadMore(
                            currentPage: currentPage,
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
          )),
    );
  }
}
