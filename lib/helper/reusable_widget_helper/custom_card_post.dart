import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_model/response_get_list_post.dart';
import 'package:flutter_application_dummy_api/helper/color_helper.dart';
import 'package:flutter_application_dummy_api/helper/default_image_helper.dart';
import 'package:flutter_application_dummy_api/helper/string_extension_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardPost extends StatelessWidget {
  DataPost dataPost;
  final Function()? onPressed;

  CustomCardPost({super.key, required this.dataPost, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              dataPost.owner!.picture ??
                                  DefaultImageHelper.avatar,
                            ),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${dataPost.owner!.firstName} ${dataPost.owner!.lastName!}",
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: const Color(0xff242424)),
                      ),
                    ],
                  ),
                  Text(
                    StringExtension.displayTimeAgoFromTimestamp(
                        dataPost.publishDate!),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xffBDBDBD),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 224,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(
                    dataPost.image == ''
                        ? DefaultImageHelper.imageNull
                        : dataPost.image!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Text(
                    dataPost.likes.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xffBDBDBD),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    'assets/icons/Love.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
