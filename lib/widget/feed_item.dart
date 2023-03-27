
import 'package:flutter/material.dart';
import 'package:groocy/widget/price_widget.dart';
import 'package:groocy/widget/text_widget.dart';
import 'package:iconly/iconly.dart';

import '../service/utils.dart';
import 'heart_btn.dart';
class FeedWidget extends StatefulWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  bool istrue= false;
  final _qualityTextController =TextEditingController();

  @override
  void initState(){
    _qualityTextController.text='1';
    super.initState();
  }
  @override
  void dispose(){
    _qualityTextController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final theme =Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    Color color =Utils(context).color;

    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: (){},
        child: Column(
          children: [
            Image.asset(
              "asset/image/fruits/4.webp",
              height: size.width*0.24,
              width: size.width * 0.24,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  TextWidget(
                    title: "Title",
                    color: color,
                    textSize: 20,
                    isTitle: true,
                  ),
                  const HeartBTN(),
                ],
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Flexible(
                    flex:4,
                    child: priceWidget(
                      price: 5.5,
                      salePrice: 2.99,
                      textPrice: _qualityTextController.text,
                      isOnSale:true ,),
                  ),
                  const SizedBox(width: 8,),
                  Flexible(
                    child: Row(
                      children: [
                        Flexible(
                          flex:1,
                          child: FittedBox(
                            child: TextWidget(
                              textSize: 24,
                              title: "Kg",
                              color: color,
                              isTitle: true,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Flexible(
                          flex: 2,
                          child: TextFormField(
                            onChanged: (val){
                              setState(() {
                              });
                            },
                            controller: _qualityTextController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: color,fontSize: 18),
                            key: const ValueKey(10),
                            maxLines: 1,
                            enabled: true,

                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: (){},
              child: TextWidget(
                title: "Add to card",
                color: color,
                textSize: 20,
                isTitle: true,
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const  RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      )

                    ))
            ),
            )
          ],
        ),
      ),
    );
  }
}
