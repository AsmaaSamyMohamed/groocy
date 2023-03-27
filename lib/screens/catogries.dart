
import 'package:flutter/material.dart';
import 'package:groocy/service/utils.dart';
import 'package:groocy/widget/text_widget.dart';

import '../widget/categry_widget.dart';
class catogriesScreen extends StatelessWidget {
   catogriesScreen({Key? key}) : super(key: key);

   List<Color> gridColors=[
      const Color(0xff53b175),
      const Color(0xfffba44c),
      const Color(0xfff7a573),
      const Color(0xffd3b0f0),
      const Color(0xfffde578),
      const Color(0xffb7dff5),
   ];
  final List<Map<String , dynamic>> catInfo=[
    {
      'imagePath': "asset/image/fruits/fruits.webp",
      'catText':"fruits",
      'colors': Color(0xff53b175),
    },
    {
      'imagePath': "asset/image/vegitables/5.jpg" ,
      'catText':"vegitables",
      'colors': Color(0xfffba44c),
    },
    {
      'imagePath':"asset/image/nuts/7.jpg" ,
      'catText':"nuts",
      'colors': Color(0xfff7a573),
    },
    {
      'imagePath':"asset/image/nuts/1.jpg",
      'catText':"user screen",
      'colors': Color(0xffd3b0f0),
    },
    {
      'imagePath':"asset/image/nuts/1.jpg",
      'catText':"user screen",
      'colors': Color(0xfffde578),
    },
    {
      'imagePath':"asset/image/nuts/1.jpg",
      'catText':"user screen",
      'colors':const  Color(0xffb7dff5),
    }
  ];
  @override
  Widget build(BuildContext context) {
    final utils =Utils(context);
    Color color =utils.color;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          title: "categories",
          color: color,
          textSize: 20 ,
          isTitle: true,
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 240/250,
          children: List.generate(6, (index){
            return  CategoriesWidget(
              colors:gridColors[index],
              catText:catInfo[index]['catText'],
              imagePath:catInfo[index]['imagePath'] ,);
          }),
        ),
      )
    );
  }
}
