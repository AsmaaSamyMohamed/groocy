import 'package:flutter/material.dart';
import 'package:groocy/inner_screens/feed_Screen.dart';
import 'package:groocy/provider/dark_thems_prefs.dart';
import 'package:groocy/screens/btn_bar_screen.dart';
import 'package:groocy/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:groocy/inner_screens/on_sale_screen.dart';
import 'package:provider/provider.dart';

import 'const/thems_data.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemsProvider themsChangeProvider = DarkThemsProvider();

  void getCurrentAppTheme() async{
    themsChangeProvider.setDarkthems =
      await themsChangeProvider.darkThemsPrefs.getTheme();
  }

  @override
  void initState(){
    getCurrentAppTheme();
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return themsChangeProvider;
        })
      ],
      child: Consumer<DarkThemsProvider>(builder: (context ,themeProvider,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themedata(themeProvider.getDarkThems, context),
          home: bottomBarScreen(),
          routes: {
            onSaleScreen.routeName :(ctx)=> const onSaleScreen(),
            feedScreen.routeName :(ctx)=> const feedScreen(),
          },
        );

      }),
      );

  }
}


