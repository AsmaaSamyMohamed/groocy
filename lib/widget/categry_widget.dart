
import 'package:flutter/material.dart';
import 'package:groocy/provider/dark_thems_prefs.dart';
import 'package:groocy/widget/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
    required this.imagePath,
    required this.catText,
    required this.colors}) : super(key: key);

  final String imagePath;
  final String catText;
  final Color colors;
  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemsProvider>(context);
    double _screenWidth =MediaQuery.of(context).size.width;
    final  Color color = themeState.getDarkThems ? Colors.white : Colors.black;

    return Container(
      decoration: BoxDecoration(
        color: colors.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.withOpacity(0.7),width: 2)
      ),
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: _screenWidth*0.3,
                width: _screenWidth*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                        imagePath
                    ),
                    fit: BoxFit.fill
                  )
                )

              ),
              SizedBox(height: 8,),
              TextWidget(textSize:18 ,
                title:catText ,
                color:color ,
                )
            ],
          ),
        ),
      ),
    );
  }
}
