import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_bloc/handle_api/create_post_bloc.dart';
import 'package:flutter_application_dummy_api/feature/main/bottom_nav.dart';

import 'package:flutter_application_dummy_api/helper/color_helper.dart';
import 'package:flutter_application_dummy_api/helper/default_image_helper.dart';
import 'package:flutter_application_dummy_api/helper/reusable_widget_helper/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePostPage extends StatefulWidget {
  CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController textarea = TextEditingController();
  final _createPostBloc = CreatePostBloc();

  final List<ChipModel> _chipList = [];

  // To Store added chips.
  List list = [
    {
      'id': '1',
      'name': 'Flutter',
    },
    {
      'id': '2',
      'name': 'Dart',
    },
    {
      'id': '3',
      'name': 'Kotlin',
    },
    {
      'id': '4',
      'name': 'Java Script',
    },
    {
      'id': '5',
      'name': 'Laravel',
    },
    {
      'id': '6',
      'name': 'ReactJs',
    },
    {
      'id': '7',
      'name': 'React Native',
    },
    {
      'id': '8',
      'name': 'Indonesia',
    },
    {
      'id': '9',
      'name': 'Golang',
    },
    {
      'id': '10',
      'name': 'Kalkulus',
    },
    {
      'id': '11',
      'name': 'Pet',
    },
    {
      'id': '12',
      'name': 'Swift',
    },
    {
      'id': '13',
      'name': 'Elixir',
    },
    {
      'id': '14',
      'name': 'Project',
    },
    {
      'id': '15',
      'name': 'Gave',
    },
    {
      'id': '16',
      'name': 'Thailand',
    },
  ];

  final TextEditingController _chipTextController = TextEditingController();
  String? image; //no radio button will be selected on initial

  //A Function to delete a Chip when user click on deleteIcon on Chip
  void _deleteChip(String id) {
    setState(() {
      _chipList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create Post',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textarea,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText:
                          "Describe your post, add hashtags, or add image",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: ColorHelper.primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: ColorHelper.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) =>
                                  Column(
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                'Silahkan Pilih Cover Yang Diinginkan',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(24),
                                children: [
                                  Wrap(
                                    spacing: 30,
                                    runSpacing: 30,
                                    direction: Axis.horizontal,
                                    children: [
                                      imageContent(setState,
                                          'https://expertphotography.b-cdn.net/wp-content/uploads/2022/03/Aesthetic-Photography-Shana-Van-Roosbroek.jpg'),
                                      imageContent(setState,
                                          'https://www.shutterstock.com/image-photo/aesthetic-wallpaper-pink-smoke-background-260nw-2065795226.jpg'),
                                      imageContent(setState,
                                          'https://i.pinimg.com/236x/d8/63/1a/d8631ac82516d49d2e0284c8101704d2.jpg'),
                                      imageContent(setState,
                                          'https://images.unsplash.com/photo-1611601147557-cdc89476ec4a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGluayUyMGFlc3RoZXRpY3xlbnwwfHwwfHw%3D&w=1000&q=80'),
                                      imageContent(setState,
                                          'https://t3.ftcdn.net/jpg/03/08/18/68/360_F_308186809_qPOrnzIBWU92f1h6IHqPDYLr9tjOvztb.jpg'),
                                      imageContent(setState,
                                          'https://png.pngtree.com/thumb_back/fh260/background/20190223/ourmid/pngtree-full-aesthetic-landscape-backgroundpinktreeskyfantasyromanticbackground-image_68329.jpg'),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 75,
                    height: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ColorHelper.primaryColor,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          image ?? DefaultImageHelper.imageNull,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 25,
                        color: ColorHelper.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                  child: Text(
                    '# Hastags',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Wrap(
                  spacing: 5,
                  children: _chipList
                      .map(
                        (chip) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _chipList.removeWhere(
                                  (element) => element.id == chip.id);
                            });
                          },
                          child: Text(
                            '#${chip.name}',
                            style: GoogleFonts.poppins(
                              color: ColorHelper.primaryColor,
                            ),

                            // call delete function by passing click chip id
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Add Tags',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Center(
              child: Wrap(
                spacing: 30,
                direction: Axis.horizontal,
                runSpacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(list.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      // check item is already added or not
                      if (_chipList
                          .any((element) => element.id == list[index]['id'])) {
                        return;
                      }
                      if (_chipList.length > 2) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor:
                                ColorHelper.primaryColor.withOpacity(0.7),
                            content: Text(
                              "You can only add 3 tags",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      } else {
                        setState(() {
                          _chipList.add(
                            ChipModel(
                                id: list[index]['id'],
                                name: list[index]['name']),
                          );
                          _chipTextController.text = '';
                        });
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: ColorHelper.primaryColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '#${list[index]['name']}',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: ColorHelper.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocConsumer<CreatePostBloc, CreatePostState>(
        bloc: _createPostBloc,
        listener: (context, state) {
          if (state is CreatePostLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          } else if (state is CreatePostSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigation(),
              ),
            );
          } else if (state is CreatePostFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: ColorHelper.primaryColor.withOpacity(0.7),
                content: Text(
                  'Gagal Menambahkan Post',
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
          return Container(
            padding: const EdgeInsets.all(16),
            height: 80,
            child: PrimaryButton(
              text: 'Tambah Post',
              onPressed: () {
                final List<String> listTags =
                    _chipList.map((city) => city.name).toList();

                if (textarea.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor:
                          ColorHelper.primaryColor.withOpacity(0.7),
                      content: Text(
                        'Pastikan Text tidak kosong',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                } else {
                  _createPostBloc.add(
                    CreatePost(
                      message: textarea.text,
                      image: image,
                      listTag: listTags,
                      idOwner: '60d0fe4f5311236168a109cb',
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Column imageContent(StateSetter setStates, String valueimageUrl) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: ColorHelper.primaryColor,
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                valueimageUrl,
              ),
            ),
          ),
        ),
        Container(
          width: 45,
          child: RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            value: valueimageUrl,
            groupValue: image,
            onChanged: (value) {
              setState(() {
                image = value.toString();
                debugPrint(image);
                Navigator.pop(context);
              });
            },
          ),
        ),
      ],
    );
  }
}

class ChipModel {
  final String id;
  final String name;
  ChipModel({required this.id, required this.name});
}
