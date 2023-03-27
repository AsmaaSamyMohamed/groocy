
import 'package:flutter/material.dart';
import 'package:groocy/service/utils.dart';
import 'package:groocy/widget/text_widget.dart';

class priceWidget extends StatelessWidget {
  const priceWidget({
    Key? key,
    required this.price,
    required this.salePrice,
    required this.textPrice,
    required this.isOnSale}) : super(key: key);

  final double price ,salePrice;
  final String textPrice;
  final bool isOnSale;
  @override
  Widget build(BuildContext context) {
    Color color =Utils(context).color;
    double usersale = isOnSale? salePrice :price;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            title: '\$ ${(usersale * int.parse(textPrice)).toStringAsFixed(2)}',
            color: Colors.green,
            textSize: 18,
            isTitle: true,),
          const SizedBox(width: 5,),
          Visibility(
            visible: isOnSale?true:false,
            child: TextWidget(
              title: '\$ ${(price * int.parse(textPrice)).toStringAsFixed(2)}',
              color: color,
              textSize: 15 ,
              isTitle: true,
            )),
        ],
      )
    );
  }
}
