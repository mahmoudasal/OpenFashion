import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/components/address_info.dart';
import 'package:openfashion/components/cart_widget.dart';
import 'package:openfashion/components/custom_appbar.dart';
import 'package:openfashion/components/custom_button.dart';
import 'package:openfashion/components/custom_container.dart';
import 'package:openfashion/components/custom_text.dart';
import 'package:openfashion/components/dialog.dart';
import 'package:openfashion/components/header.dart';
import 'package:openfashion/components/shipping_method.dart';
import 'package:openfashion/core/colors.dart';
import 'package:openfashion/screens/add_address.dart';
import 'package:openfashion/screens/add_card.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    super.key,
    required this.image,
    required this.name,
    required this.descrep,
    required this.qty,
    required this.total,
    required this.price,
  });

  final String image;
  final String name;
  final String descrep;
  final int qty;
  final int total;
  final int price;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic _savedAddress;
  dynamic _savedCard;
  late int selectedQty;

  @override
  void initState() {
    super.initState();
    selectedQty = widget.qty;
  }

  /// address

  void _openAddress(BuildContext context) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddAddress(editData: _savedAddress)),
    );

    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }

  void _editAdderss() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddAddress(editData: _savedAddress)),
    );
    setState(() {
      _savedAddress = newAddress;
    });
  }

  void _editCard(cardData) async {
    final editCard = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddCard(savedCard: _savedCard)),
    );
    setState(() {
      _savedCard = editCard;
    });
  }

  /// Card
  void _openCard(BuildContext context) async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddCard()),
    );

    if (cardData != null) {
      setState(() {
        _savedCard = cardData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0 ,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Header(text: "Checkout"),
            _savedAddress != null && _savedCard != null
                ? SizedBox.shrink()
                : CustomText(
                    text: "Shipping Address".toUpperCase(),
                    color: Colors.black38,
                    size: 16,
                  ),Gap(10),
            

            ///Address Flow
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _savedAddress != null
                      ? AddressInfo(
                          savedAddress: _savedAddress,
                          onTap: () {
                            _editAdderss();
                          },
                        )
                      : SizedBox.shrink(),

                  _savedAddress == null
                      ? GestureDetector(
                          onTap: () {
                            _openAddress(context);
                          },
                          child: CustomContainer(
                            isFree: false,
                            icon: Icons.add,
                            text: "Add shipping adress",
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),Gap(10),

            /// Shipping Method
            _savedAddress != null && _savedCard != null
                ? SizedBox.shrink()
                : ShippingMethod(),

            ///Payment Method
            _savedAddress != null && _savedCard != null
                ? SizedBox.shrink()
                : Column(
                    children: [
                      CustomText(
                        text: "Payment method".toUpperCase(),
                        color: Colors.black38,
                        size: 16,
                      ),
                      Gap(20),
                    ],
                  ),

            _savedCard != null
                ? GestureDetector(
                    onTap: () => _editCard({
                      _savedCard['number'],
                      _savedCard['name'],
                      _savedCard['date'],
                      _savedCard['cvv'],
                    }),
                    child: Column(
                      children: [
                        Divider(color: Colors.grey.shade300),
                        Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svgs/Mastercard.svg",
                                  width: 40,
                                ),
                                Gap(10),
                                CustomText(
                                  text: "Master Card Ending",
                                  color: AppColors.primary,
                                ),
                                Gap(10),
                                CustomText(
                                  text:
                                      "••••${_savedCard['number'].toString().substring(_savedCard['number'].length - 2)}",
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                            SvgPicture.asset("assets/svgs/arrow.svg"),
                          ],
                        ),
                        Gap(20),
                        Divider(color: Colors.grey.shade300),
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: () => _openCard(context),
                    child: CustomContainer(
                      isFree: false,
                      icon: Icons.keyboard_arrow_down_sharp,
                      text: 'select payment method',
                    ),
                  ),
            Gap(20),
            _savedAddress != null && _savedCard != null
                ? CartWidget(
                    image: widget.image,
                    name: widget.name,
                    des: widget.descrep,
                    price: widget.price,
                    quantity: selectedQty,
                    onChanged: (qty) {
                      setState(() {
                        selectedQty = qty;
                      });
                    },
                  )
                : SizedBox.shrink(),
            Spacer(),
            Row(
              children: [
                CustomText(text: "Total", color: AppColors.primary),
                Spacer(),
                CustomText(
                  text: "\$ ${widget.price * selectedQty} ",
                  color: Colors.red.shade200,
                ),
              ],
            ),
            Gap(20),
            CustomButton(
              isSvgOrPic: true,
              svg: 'assets/svgs/shopping bag.svg',
              title: 'Place Order',
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (c) => CustomDialog(),
                );
              },
            ),
            Gap(70),
          ],
        ),
      ),
    );
  }
}
