import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/components/custom_text.dart';
import 'package:openfashion/core/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Center(
          child: CustomText(
            text: text.toUpperCase(),
            color: AppColors.primary,
            size: 20,
            spacing: 4,
          ),
        ),
        Gap(10),
        Image.asset("assets/svgs/line.png", width: 160, color: Colors.black),
        Gap(20),
      ],
    );
  }
}
