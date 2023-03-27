
import 'package:flutter/material.dart';
import 'package:groocy/widget/text_widget.dart';
import 'package:iconly/iconly.dart';
import '../service/utils.dart';
import '../widget/feed_item.dart';
import '../widget/on_sale_widget.dart';
class onSaleScreen extends StatelessWidget {

  static const routeName ="/OnSaleScreen";
  const onSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color =Utils(context).color;
    bool isSale =true;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (){
            Navigator.pop(context);
          },child: Icon(
            IconlyLight.arrow_left,
            color: color,
        ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(title: "Product on sale ", color: color, textSize: 24 ,isTitle: true,),
      ),
      body: isSale
          ? Center(
             // child: Lottie.asset("asset/lottie/nodata.json"),
              child: Text("No product fins!\n in server"),
             )
          :GridView.count(
                physics:const NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                padding: EdgeInsets.zero,
                childAspectRatio: size.width/(size.height *0.5),
                // crossAxisSpacing: 10,
                // mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(16, (index) {
                  return const onSaleWidget();
                })
            ),

    );
  }
}
