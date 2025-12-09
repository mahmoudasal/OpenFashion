import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/components/custom_text.dart';
import 'package:openfashion/core/colors.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({
    super.key,
    required this.savedAddress,
    required this.onTap,
  });

  final dynamic savedAddress;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "${savedAddress['first']} ${savedAddress['last']}"
                    .toUpperCase(),
                color: AppColors.primary,
                size: 20,
                max: 2,
              ),
              Gap(15),
              CustomText(
                text: "${savedAddress['address']}".toUpperCase(),
                color: Colors.black38,
                size: 16,
              ),
              Gap(10),
              CustomText(
                text: "${savedAddress['city']}".toUpperCase(),
                color: Colors.black38,
                size: 16,
              ),
              CustomText(
                text: "${savedAddress['State']}".toUpperCase(),
                color: Colors.black38,
                size: 16,
              ),
              Gap(10),
              CustomText(
                text: "${savedAddress['phone']}".toUpperCase(),
                color: Colors.black38,
                size: 16,
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
        ],
      ),
    );
  }
}
