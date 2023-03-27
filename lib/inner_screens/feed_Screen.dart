
import 'package:flutter/material.dart';
import 'package:groocy/service/utils.dart';
import 'package:iconly/iconly.dart';

import '../widget/feed_item.dart';
import '../widget/text_widget.dart';
class feedScreen extends StatefulWidget {
  static const routeName ="/feedScreen";
  const feedScreen({Key? key}) : super(key: key);

  @override
  State<feedScreen> createState() => _feedScreenState();
}

class _feedScreenState extends State<feedScreen> {

  final TextEditingController textEditingController =TextEditingController();
  final FocusNode focusNode =FocusNode();

  @override
  void dispose(){
    textEditingController!.dispose();
    focusNode!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color =Utils(context).color;

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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(title: "All Product", color: color, textSize: 20 ,isTitle: true,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: focusNode,
                  controller: textEditingController,
                  onChanged: (value){
                    setState(() {

                    });
                  },
                  decoration: InputDecoration(
                    hintText: "What's in your mind",
                   // contentPadding:const EdgeInsets.symmetric(vertical: 8,horizontal: 30),
                    prefixIcon:const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:  BorderSide(color: color ,width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:const BorderSide(color: Colors.greenAccent ,width: 2),
                    ),
                    suffix: IconButton(
                      onPressed: (){
                        textEditingController!.clear();
                        focusNode!.unfocus();
                      },
                      icon: Icon(Icons.close ,color:focusNode.hasFocus? Colors.red:color,),)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8,),
            GridView.count(
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                childAspectRatio: size.width/(size.height *0.6),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(10, (index) {
                  return const FeedWidget();
                })
            ),
          ],
        ),
      ),
    );
  }
}
