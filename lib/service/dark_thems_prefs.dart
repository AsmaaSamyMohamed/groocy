
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemsPrefs{
  static const Themes_status= "ThemesStatus";

  setDarkthems (bool value) async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setBool(Themes_status, value);
  }

  Future<bool> getTheme() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.getBool(Themes_status)?? false;
  }
}