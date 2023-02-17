import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_dummy_api/helper/color_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          'Profile',
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
          children: [
            cardProfile(),
            const SizedBox(
              height: 32,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color(0xffF1F1F1),
                  ),
                )),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: ColorHelper.primaryColor,
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Text(
                      'Edit profile',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color(0xffF1F1F1),
                  ),
                )),
                child: Row(
                  children: [
                    Icon(
                      Icons.pin,
                      color: ColorHelper.primaryColor,
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Text(
                      'Ganti PIN',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color(0xffF1F1F1),
                  ),
                )),
                child: Row(
                  children: [
                    Icon(
                      Icons.password,
                      color: ColorHelper.primaryColor,
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Text(
                      'Ubah Kata Sandi',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color(0xffF1F1F1),
                  ),
                )),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: ColorHelper.primaryColor,
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Text(
                      'Keluar',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row cardProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
              width: 65,
              height: 65,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aurellia Vania',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '24th | Konten Kreator',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '100%',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: ColorHelper.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Post Popular',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/icons/Category.png',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
                Text(
                  '#Fashion, #Food, #Traveler, #Beauty',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ],
        ),
        // IconButton(
        //   icon: const Icon(Icons.edit),
        //   onPressed: () {},
        // )
      ],
    );
  }
}
