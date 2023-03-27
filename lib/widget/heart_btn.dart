
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../service/utils.dart';
class HeartBTN extends StatefulWidget {
  const HeartBTN({Key? key}) : super(key: key);

  @override
  State<HeartBTN> createState() => _HeartBTNState();
}

class _HeartBTNState extends State<HeartBTN> {
  bool istrue=false;

  @override
  Widget build(BuildContext context) {
    final Color color=Utils(context).color;
    return  GestureDetector(
      onTap: (){
        setState(() {
         istrue = istrue ? false :true;
        });
      },
      child:istrue
          ? const Icon( Icons.favorite , size: 22,color: Colors.red,)
          : Icon(IconlyLight.heart ,size: 22,color: color,),
    );
  }
}
