import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_bloc/handle_api/create_post_bloc.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_bloc/handle_api/get_detail_post_bloc.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_bloc/handle_api/get_list_comment_bloc.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_bloc/handle_api/get_list_post_bloc.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_bloc/handle_api/post_comment_bloc.dart';
import 'package:flutter_application_dummy_api/feature/category/category_bloc/handle_api/get_post_byid_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/main/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => GetListPostBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => GetDetailPostBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => GetDetailPostBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => GetListCommentBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => PostCommentBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => CreatePostBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => GetPostByidBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavigation(),
      ),
    );
  }
}
