import 'package:flutter/material.dart';

class CustomPaginationLoading extends StatelessWidget {
  const CustomPaginationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      color: Colors.white,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }
}
