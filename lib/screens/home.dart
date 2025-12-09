import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:openfashion/components/custom_appbar.dart';
import 'package:openfashion/components/custom_text.dart';
import 'package:openfashion/core/colors.dart';
import 'package:openfashion/models/cover_model.dart';
import 'package:openfashion/models/product_model.dart';
import 'package:openfashion/screens/checkout.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppbar(isBlackk: true),

      body: Stack(
        children: [
          // Texts
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/10.svg"),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/October.svg"),
          ),
          Positioned(
            top: 85,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/Collection.svg"),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Gap(120),
                      Image.asset("assets/cover/cover1.png"),
                      Gap(20),
                      mainProductsGrid(),
                      Gap(20),
                      CustomText(
                        text: "You may also like".toUpperCase(),
                        size: 26,
                      ),
                      Gap(20),
                      Image.asset("assets/svgs/line.png", width: 100),
                      Gap(40),
                      horizontalList(),
                      Gap(40),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Ionicons.logo_instagram,
                                color: Colors.white,
                              ),
                              Gap(30),
                              Icon(Ionicons.logo_facebook, color: Colors.white),
                              Gap(30),
                              Icon(Ionicons.logo_twitter, color: Colors.white),
                            ],
                          ),
                          about(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: "About"),
                              Gap(20),
                              CustomText(text: "Contact"),
                              Gap(20),
                              CustomText(text: "Blog"),
                            ],
                          ),
                        ],
                      ),
                      Gap(20),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade400,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 10),
                    child: Center(
                      child: CustomText(
                        max: 3,
                        height: 2.5,
                        text: "Copyright© OpenUI All Rights Reserved.",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget about() {
    return Column(
      children: [
        Gap(20),
        Image.asset("assets/svgs/line.png", width: 190),
        Gap(20),
        CustomText(text: "support@openui.design"),
        Gap(20),
        CustomText(text: "+60 825 876"),
        Gap(20),
        CustomText(text: "08:00 - 22:00 - Everyday"),
        Gap(20),
        Image.asset("assets/svgs/line.png", width: 190),
        Gap(20),
      ],
    );
  }

  Widget horizontalList() {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: CoverModel.covers.length,
        itemBuilder: (context, index) {
          final item = CoverModel.covers[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(item.image, height: 350, fit: BoxFit.cover),
                Gap(7),
                CustomText(text: item.name.toUpperCase()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget mainProductsGrid() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        childAspectRatio: 0.5,
      ),
      itemCount: ProductModel.products.length,
      itemBuilder: (context, index) {
        final item = ProductModel.products[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => Checkout(
                image: item.image,
                name: item.name,
                price: item.price,
                description: item.description,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(item.image),
              Gap(10),
              CustomText(text: item.name),
              CustomText(text: item.description, color: Colors.grey),
              Gap(9),
              CustomText(
                text: "\$ ${item.price.toString()}",
                color: Colors.red.shade200,
                size: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
