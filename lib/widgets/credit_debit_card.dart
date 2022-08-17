import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_and_drug_admin/assets/constants.dart';

class CreditDebitCard extends StatelessWidget {
  const CreditDebitCard({
    Key? key,
    required this.cardType,
    required this.expiryDate,
    required this.lastDigits,
  }) : super(key: key);

  final PaymentCard cardType;
  final String expiryDate;
  final String lastDigits;

  IconData _getCardIcon(cardType) {
    if (cardType == PaymentCard.visa) {
      return FontAwesomeIcons.ccVisa;
    }
    return FontAwesomeIcons.ccMastercard;
  }

  String _getCardName(cardType) {
    if (cardType == PaymentCard.visa) {
      return "Visa";
    }
    return "Mastercard";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.grey.shade200,
      ),
      margin: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            FaIcon(
              _getCardIcon(cardType),
              size: 36.0,
            ),
            const SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getCardName(cardType),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(expiryDate),
              ],
            ),
          ]),
          Text("*********$lastDigits"),
        ],
      ),
    );
  }
}
