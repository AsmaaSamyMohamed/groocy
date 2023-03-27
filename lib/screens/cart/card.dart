
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../service/utils.dart';
import '../../widget/text_widget.dart';
import 'cart_widget.dart';
class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =Utils(context).getScreenSize;
    final Color color=Utils(context).color;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: TextWidget(title: "Cart(2)",textSize: 20,isTitle: true,color: color,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(IconlyBroken.delete,color: color,))
        ],
      ),
      body: Column(
        children: [
          _checkOut(ctx: context),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
                return const cardWidget();
            }),
          ),
        ],
      ),
    );


  }
  Widget _checkOut({required BuildContext ctx}){
    final size =Utils(ctx).getScreenSize;
    final Color color=Utils(ctx).color;
    return  Container(
      width: double.infinity,
      height: size.height * 0.1,
      padding:const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget(textSize: 20,title: "Order Now",color:color,),
              ),
            ),
          ),
          const Spacer(),
          FittedBox(
            child: TextWidget(
              title: "Total:\$0.9658",
              color: color,
              textSize: 20,
              isTitle: true,),
          )
        ],
      ),
    );
  }
}
