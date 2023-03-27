

import 'package:flutter/cupertino.dart';
import '../service/dark_thems_prefs.dart';

class DarkThemsProvider with ChangeNotifier{

  DarkThemsPrefs  darkThemsPrefs =DarkThemsPrefs();
  bool _darkThems =false ;
  bool get getDarkThems => _darkThems;

  set setDarkthems(bool value){
    _darkThems =value;
    darkThemsPrefs.setDarkthems(value);
    notifyListeners();
  }
}