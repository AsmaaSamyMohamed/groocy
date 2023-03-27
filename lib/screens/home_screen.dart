
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:groocy/inner_screens/feed_Screen.dart';
import 'package:groocy/service/gloable_method.dart';
import 'package:groocy/service/utils.dart';
import 'package:groocy/widget/text_widget.dart';
import 'package:iconly/iconly.dart';
import 'package:card_swiper/card_swiper.dart';
import '../widget/feed_item.dart';
import '../widget/on_sale_widget.dart';
import 'package:groocy/inner_screens/on_sale_screen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  final List<String> _offerImage=[
    "asset/image/supermarket/1.jpg",
    "asset/image/supermarket/2.jpg",
    "asset/image/supermarket/3.webp",
    "asset/image/supermarket/gallery-2.jpg"
  ];
  @override
  Widget build(BuildContext context) {
 //
    Size size = Utils(context).getScreenSize;
    Color color =Utils(context).color;
    final themeState = Utils(context).getTheme;
    double height =size.height;
    GlobalMethods globalMethod = GlobalMethods();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
             height:height *0.3,
             width: double.infinity,
             child:  Swiper(
               itemBuilder: (BuildContext context,int index){
                 return Image.asset(
                   _offerImage[index],
                   fit: BoxFit.fill,);
               },
               itemCount: _offerImage.length,
               autoplay: true,
               pagination:const SwiperPagination(
                 alignment: Alignment.bottomCenter,
                 builder: DotSwiperPaginationBuilder(
                   color: Colors.white,
                   activeColor: Colors.red
                 )
               ),
               //control:const SwiperControl(color: Colors.red),
             ),
           ),
            const SizedBox(height: 5,),
            TextButton(
                onPressed: (){
                  globalMethod.navigateTo(
                      ctx: context,
                      routeName: onSaleScreen.routeName);
                },
                child: TextWidget(
                  textSize:20 ,
                  title: "View All",
                  color: Colors.blue,),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              height: height*.27,
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns:-1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TextWidget(
                              title: "on sale".toUpperCase(),
                              color: Colors.red,
                              textSize: 22,
                              isTitle: true,
                            ),
                            const SizedBox(width: 5,),
                            const Icon(IconlyLight.discount,color: Colors.red,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Flexible(
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return  onSaleWidget();
                      }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  TextWidget(
                    title: "Our product",
                    color: color,
                    textSize: 22 ,
                    isTitle: true,
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: (){
                        globalMethod.navigateTo(
                            ctx: context,
                            routeName: feedScreen.routeName);
                      },
                      child: TextWidget(
                        title: "Browse all",
                        color: Colors.blue,
                        textSize: 20,
                      )),
              ],),
            ),
            GridView.count(
               physics:const NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               padding: EdgeInsets.zero,
               childAspectRatio: size.width/(size.height *0.6),
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
               crossAxisCount: 2,
               children: List.generate(4, (index) {
                 return const FeedWidget();
               })
           )
          ],
        ),
      ),

    );
  }
}


