
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groocy/service/utils.dart';
import 'package:groocy/widget/heart_btn.dart';
import 'package:iconly/iconly.dart';

import '../../widget/text_widget.dart';
class cardWidget extends StatefulWidget {
  const cardWidget({Key? key}) : super(key: key);

  @override
  State<cardWidget> createState() => _cardWidgetState();
}

class _cardWidgetState extends State<cardWidget> {
  final qualityTextControll = TextEditingController();
  int value=1;
  @override
  void initState(){
    qualityTextControll.text='1';
    super.initState();
  }

  @override
  void dispose(){
    qualityTextControll.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size =Utils(context).getScreenSize;
    final Color color=Utils(context).color;
    final Color colorIcon =Utils(context).colorIcon;
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: size.width*0.25,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.width*0.25,
                      width: size.width*0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        "asset/image/vegitables/8.jpg",
                        fit: BoxFit.fill,
                        //color: Theme.of(context).cardColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(title: "title",color: color,textSize: 20,isTitle: true,),
                          const SizedBox(height: 10,),
                          SizedBox(

                              width: size.width*0.35,
                              child: Row(
                                children: [
                                  _quantityControl(colr: Colors.green ,icon: CupertinoIcons.minus,fct:(){} ),
                                  Expanded(
                                    flex: 1,
                                    child:  Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                      child: TextField(
                                        controller: qualityTextControll,
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        onChanged: (val){
                                          setState(() {
                                           if(val.isEmpty){
                                             qualityTextControll.text='1';
                                           }else{

                                             return;
                                           }
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(),
                                          )
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]')
                                          ),
                                        ],
                                      ),
                                    )),
                                  _quantityControl(
                                      colr: Colors.red ,
                                      icon: CupertinoIcons.plus,
                                      fct:(){
                                        setState(() {

                                        });
                                  } ),
                                ],
                              ),
                            ),
                        ],
                      ),

                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){},
                            child:const Icon(CupertinoIcons.cart_badge_minus,color: Colors.red,size: 20,),
                          ),
                          SizedBox(height: 5,),
                          const HeartBTN(),
                          SizedBox(height: 5,),
                          TextWidget(title: "\$0.99", color: color, textSize: 20)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _quantityControl({required Function fct, required IconData icon , required Color colr} ){
    return  Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Material(
          color: colr,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: (){
              fct;
            },
            child:  Padding(
                padding:const EdgeInsets.all(8),
                child: Icon(
                  icon,
                  color: Colors.white,)
            ),
          ),
        ),
      ),
    );
  }
}
