import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/components/custom_text.dart';
import 'package:openfashion/core/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isSvgOrPic,
    required this.svg,
    required this.title,
    required this.onTap,
    this.color,
  });
  final bool isSvgOrPic;
  final String svg;
  final String title;
  final Function? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    bool isSvg = isSvgOrPic;
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        color: color != null ? color : AppColors.primary,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSvg ? SvgPicture.asset(svg, width: 22) : SizedBox.shrink(),
              Gap(10),
              CustomText(text: title.toUpperCase(), size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
