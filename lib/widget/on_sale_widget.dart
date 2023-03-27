
import 'package:flutter/material.dart';
import 'package:groocy/service/utils.dart';
import 'package:groocy/widget/price_widget.dart';
import 'package:groocy/widget/text_widget.dart';
import 'package:iconly/iconly.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'heart_btn.dart';

class onSaleWidget extends StatefulWidget {
  const onSaleWidget({Key? key}) : super(key: key);

  @override
  State<onSaleWidget> createState() => _onSaleWidgetState();
}

class _onSaleWidgetState extends State<onSaleWidget> {
  bool istrue=false;
  @override
  Widget build(BuildContext context) {
    final theme =Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    Color color =Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FancyShimmerImage(
                    height: size.width*0.3,
                    boxFit: BoxFit.fill,
                    width: size.width*0.3,
                    errorWidget: Image.asset("asset/image/vegitables/4.jpg"),
                    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiWbrk2qbgBJKIM46SmNB-VWTDDMo4DfFyKhz1jThMugz-pOVVaKX3SFumjgbLDLWXavw&usqp=CAU"),
                  const SizedBox(width: 3,),
                  Column(
                    children: [
                      TextWidget(
                        title: "1 Kg" ,
                        textSize:18 ,
                        color: color,
                        isTitle: true,
                      ),
                      const SizedBox(height: 6,),
                      Row(children: [
                        GestureDetector(
                          onTap: (){
                          },
                          child:Icon( IconlyLight.bag_2 ,
                            size: 22,color: color,),
                        ),
                        const HeartBTN(),
                      ],),

                    ],
                  )
                ],
              ),
              const SizedBox(height: 5,),
              const priceWidget(
              price: 5.5,
              salePrice: 2.99,
              textPrice: '1',
              isOnSale:false ,),
              TextWidget(title: "project title", color: color, textSize: 16,isTitle:true,),
              const SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
