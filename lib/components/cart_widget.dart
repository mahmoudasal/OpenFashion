import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/components/custom_text.dart';
import 'package:openfashion/core/colors.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
    required this.image,
    required this.name,
    required this.des,
    required this.price,
    required this.quantity,
    required this.onChanged,
  });
  final String image;
  final String name;
  final String des;
  final int price;
  final int quantity;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, width: 120),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            CustomText(
              text: name.toUpperCase(),
              spacing: 4,
              color: AppColors.primary,
            ),
            Gap(10),
            SizedBox(
              width: size.width * 0.6,
              child: CustomText(
                text: des.toUpperCase(),
                spacing: 2,
                color: AppColors.primary,
                size: 11.5,
              ),
            ),
            Gap(30),
            Row(
              children: [
                _qty(() {
                  if (quantity > 1) {
                    onChanged(quantity - 1);
                  }
                }, "assets/svgs/min.svg"),
                Gap(12),
                CustomText(
                  text: quantity.toString(),
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                Gap(12),
                _qty(() {
                  onChanged(quantity + 1);
                }, "assets/svgs/plus.svg"),
              ],
            ),
            Gap(28),
            CustomText(
              text: "\$ $price",
              color: Colors.red.shade200,
              size: 22,
            ),
          ],
        ),
      ],
    );
  }

  Widget _qty(onTap, svg) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: SvgPicture.asset(svg),
      ),
    );
  }
}
