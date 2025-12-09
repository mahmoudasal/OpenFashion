import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:openfashion/components/cart_widget.dart';
import 'package:openfashion/components/custom_appbar.dart';
import 'package:openfashion/components/custom_button.dart';
import 'package:openfashion/components/custom_text.dart';

import 'package:openfashion/components/header.dart';
import 'package:openfashion/core/colors.dart';
import 'package:openfashion/screens/place_order.dart';

class Checkout extends StatefulWidget {
  const Checkout({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  final String image;
  final String name;
  final int price;
  final String description;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int selectedQty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Header(text: 'Checkout'),
            CartWidget(
              image: widget.image,
              name: widget.name,
              des: widget.description,
              price: widget.price,
              quantity: selectedQty,
              onChanged: (v) {
                setState(() {
                  selectedQty = v;
                });
              },
            ),
            promo(),
            Spacer(),
            Row(
              children: [
                CustomText(text: "Est. Total", color: AppColors.primary),
                Spacer(),
                CustomText(
                  text: "\$ ${widget.price * selectedQty}",
                  color: Colors.red.shade200,
                ),
              ],
            ),
            Gap(20),
            CustomButton(
              isSvgOrPic: true,
              svg: 'assets/svgs/shopping bag.svg',
              title: 'Checkout',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => PlaceOrder(
                      image: widget.image,
                      name: widget.name,
                      descrep: widget.description,
                      qty: selectedQty,
                      total: widget.price * selectedQty,
                      price: widget.price,
                    ),
                  ),
                );
              },
            ),
            Gap(70),
          ],
        ),
      ),
    );
  }

  Widget promo() {
    return Column(
      children: [
        Gap(20),
        Divider(),
        Gap(20),
        Row(
          children: [
            SvgPicture.asset("assets/svgs/promo.svg"),
            Gap(15),
            CustomText(text: "Add promo code", color: AppColors.primary),
          ],
        ),
        Gap(20),
        Divider(),
        Gap(20),
        Row(
          children: [
            SvgPicture.asset("assets/svgs/delivery.svg"),
            Gap(15),
            CustomText(text: "Delivery", color: AppColors.primary),
            Spacer(),
            CustomText(text: "FREE", color: AppColors.primary),
            Gap(30),
          ],
        ),
        Gap(20),
        Divider(),
      ],
    );
  }
}
