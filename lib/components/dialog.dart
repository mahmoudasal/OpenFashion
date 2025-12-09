import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/components/custom_button.dart';
import 'package:openfashion/components/custom_text.dart';
import 'package:openfashion/core/colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.white,
        height: 520,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Icon(CupertinoIcons.clear),
                ),
              ),

              Gap(30),
              CustomText(
                text: "Payment success".toUpperCase(),
                color: AppColors.primary,
                size: 18,
                spacing: 5,
              ),
              Gap(30),

              SvgPicture.asset("assets/pop/done.svg", width: 60),
              Gap(30),
              CustomText(
                text: "Your payment was success",
                color: AppColors.primary,
                size: 18,
              ),
              Gap(30),
              CustomText(
                text: "Payment ID : 15263541",
                color: AppColors.primary,
                size: 15,
              ),
              Gap(30),

              Image.asset(
                "assets/svgs/line.png",
                width: 160,
                color: AppColors.primary,
              ),

              Gap(30),

              CustomText(
                text: "Rate your purchase",
                color: AppColors.primary,
                size: 18,
              ),
              Gap(30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/pop/emogi1.svg"),
                  Gap(20),
                  SvgPicture.asset("assets/pop/emogi2.svg"),
                  Gap(20),
                  SvgPicture.asset("assets/pop/emogi3.svg"),
                ],
              ),
              Spacer(),

              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      isSvgOrPic: false,
                      svg: "",
                      title: "Submit".toUpperCase(),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Gap(10),
                  Expanded(
                    child: CustomButton(
                      isSvgOrPic: false,
                      svg: "",
                      title: "Cancel".toUpperCase(),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
