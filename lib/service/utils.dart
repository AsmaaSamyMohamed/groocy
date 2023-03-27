
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_thems_prefs.dart';

class Utils{
  BuildContext context ;
  Utils(this.context);
  bool get getTheme => Provider.of<DarkThemsProvider>(context).getDarkThems;
  Color get color => getTheme ? Colors.white : Colors.black;
  Color get colorIcon =>getTheme ? Colors.black :Colors.white;
  Size get getScreenSize=> MediaQuery.of(context).size;
}