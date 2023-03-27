
import 'package:flutter/material.dart';
class searchWidget extends StatelessWidget {
  const searchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "What's your need",
        prefixIcon: Icon(Icons.search ,color: Colors.grey,),

      ),
    );
  }
}
