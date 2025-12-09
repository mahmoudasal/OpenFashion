import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/components/custom_appbar.dart';
import 'package:openfashion/components/custom_button.dart';
import 'package:openfashion/components/header.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key, this.savedCard});

  final dynamic savedCard;
  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.savedCard != null) {
      cardNumber = widget.savedCard['number'] ?? '';
      expiryDate = widget.savedCard['date'] ?? '';
      cardHolderName = widget.savedCard['name'] ?? '';
      cvvCode = widget.savedCard['cvv'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// to make the field which the user is using to be focused
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(isBlackk: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(text: "Payment Method"),
                Gap(13),

                ///visa
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName.toUpperCase(),
                  cvvCode: cvvCode,
                  showBackView:
                      isCvvFocused, //true when you want to show cvv(back) view
                  onCreditCardWidgetChange:
                      (
                        v,
                      ) {}, // Callback for anytime credit card brand is changed

                  cardBgColor: Colors.black,
                  isHolderNameVisible: true,
                  isChipVisible: true,
                ),

                CreditCardForm(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  formKey: _key,
                ),
                Gap(70),
                CustomButton(
                  isSvgOrPic: false,
                  svg: '',
                  title: 'Add Card',
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      final data = {
                        'number': cardNumber,
                        'name': cardHolderName,
                        'date': expiryDate,
                        'cvv': cvvCode,
                      };

                      Navigator.pop(context, data);
                    } else {}
                  },
                ),
                Gap(70),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isCvvFocused = data.isCvvFocused;
    });
  }
}
