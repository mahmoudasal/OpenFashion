import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/components/custom_text.dart';
import 'package:openfashion/core/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.isFree,
    required this.icon,
    required this.text,
  });

  final bool isFree;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: text, color: AppColors.primary),
          Spacer(),
          isFree
              ? CustomText(text: "FREE", color: AppColors.primary)
              : SizedBox.shrink(),
          Gap(15),
          Icon(icon),
          Gap(30),
        ],
      ),
    );
  }
}
