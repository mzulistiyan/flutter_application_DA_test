import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/feature/category/category_bloc/handle_api/get_post_byid_bloc.dart';
import 'package:flutter_application_dummy_api/feature/category/category_model/response_get_post_byid.dart';
import 'package:flutter_application_dummy_api/helper/color_helper.dart';
import 'package:flutter_application_dummy_api/helper/default_image_helper.dart';
import 'package:flutter_application_dummy_api/helper/reusable_widget_helper/custom_pagination_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final _getPostByidBloc = GetPostByidBloc();
  List<String> categories = [
    'All',
    'Illustration',
    'UIUX Design',
    'Graphic Design',
    'Icons'
  ];

  int activeTab = 0;
  bool run = true;

  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;
  final List<DataPostByID> _listDataPost = [];

  void _checkPagination() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _getPostByidBloc.add(GetPostByIDLoadMore(currentPage: currentPage++));
    }
  }

  @override
  void initState() {
    _getPostByidBloc.add(GetPostByID());
    _scrollController.addListener(_checkPagination);

    super.initState();
  }

  @override
  void dispose() {
    _getPostByidBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text(
          "Category",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Yours popular ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 220,
                      child: Image.network(
                        'https://www.pngitem.com/pimgs/m/124-1247062_digital-marketing-illustration-png-transparent-png.png',
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: activeTab == index
                                  ? Colors.blue
                                  : Colors.grey.shade200),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: activeTab == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<GetPostByidBloc, GetPostByidState>(
                bloc: _getPostByidBloc,
                listener: (context, state) {
                  debugPrint('state is $state');
                  if (state is GetPostByidSuccess) {
                    if (state.responseGetPostByid!.data!.isNotEmpty) {
                      _listDataPost
                          .addAll(state.responseGetPostByid?.data ?? []);
                    } else {
                      Fluttertoast.showToast(
                          backgroundColor:
                              ColorHelper.primaryColor.withOpacity(0.6),
                          msg: 'Anda sudah mencapai batas halaman');
                    }
                  }

                  if (state is GetPostByidLoadMoreSuccess) {
                    if (state.responseGetPostByid!.data!.isNotEmpty) {
                      _listDataPost
                          .addAll(state.responseGetPostByid?.data ?? []);
                    } else {
                      Fluttertoast.showToast(
                          backgroundColor:
                              ColorHelper.primaryColor.withOpacity(0.6),
                          msg: 'Anda sudah mencapai batas halaman');
                    }
                  }
                },
                builder: (context, state) {
                  if (state is GetPostByidLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetPostByidSuccess ||
                      state is GetPostByidLoadMoreLoading ||
                      state is GetPostByidLoadMoreSuccess ||
                      state is GetPostByidLoadMoreError) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _getPostByidBloc.add(
                          GetPostByID(),
                        );
                      },
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(20),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: _listDataPost.length + 1,
                          itemBuilder: (context, index) {
                            if (index < _listDataPost.length) {
                              return post(_listDataPost[index]);
                            } else {
                              if (state is GetPostByidLoadMoreLoading) {
                                return const CustomPaginationLoading();
                              } else if (state is GetPostByidLoadMoreError) {
                                return Center(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _getPostByidBloc.add(
                                          GetPostByIDLoadMore(
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
                  } else if (state is GetPostByidError) {
                    return Center(
                      child: Container(
                        color: Colors.transparent,
                        child: ElevatedButton(
                          onPressed: () {
                            _getPostByidBloc.add(
                              GetPostByIDLoadMore(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  post(DataPostByID dataPostByID) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          dataPostByID.image == ''
              ? DefaultImageHelper.imageNull
              : dataPostByID.image!,
        ),
      ),
    );
  }
}
