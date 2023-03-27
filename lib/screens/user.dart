
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_thems_prefs.dart';
import '../widget/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  final TextEditingController addressController =TextEditingController();
  String text ="my address";

  @override
  void dispose(){
    addressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemsProvider>(context);
    final color = themeState.getDarkThems? Colors.white :Colors.black;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
               RichText (
                text: TextSpan(
                  text: "Hi, " ,
                  style:const TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 27
                  ),
                  children:<TextSpan> [
                    TextSpan(
                        text: "My Name" ,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w600,
                            fontSize: 25
                        ),
                     // recognizer: GestureRecognizer()..onTap=(){}
                    ),
                  ]
              ),
              ),
             const SizedBox(
               height: 5,
             ),
             TextWidget(
                 title: "asmaa@gmail.com",
                 color: color,
                 textSize: 18
             ),
             const SizedBox(
                height: 30,
              ),
             const Divider(
                thickness: 3,
              ),
              _listTitle(
                title: "address 2",
                subtitle: text,
                icon: IconlyLight.profile,
                color: color,
                onPressed: () async{
                 await _showAddressDialog();
                }
              ),
              _listTitle(
                title: "Orders",
                icon: IconlyLight.bag,
                onPressed: (){},
                color:color
              ),
              _listTitle(
                title: "Wishlist",
                icon: IconlyLight.heart,
                color: color,
                onPressed: (){}
              ),
              _listTitle(
                title: "Forget password",
                color: color,
                icon: IconlyLight.unlock,
                onPressed: (){}
              ),
              _listTitle(
                title: "Viewed",
                color: color,
                icon: IconlyLight.show,
                onPressed: (){}
              ),
              SwitchListTile(
                title: TextWidget(
                  title:themeState.getDarkThems ? "Dark mode": "light mode",
                  color: color,
                  textSize: 20,),
                secondary:Icon(
                    themeState.getDarkThems
                    ? Icons.dark_mode_outlined
                    :Icons.light_mode_outlined),
                onChanged: (bool value){
                  setState(() {
                    themeState.setDarkthems=value;
                  });

                },
                value: themeState.getDarkThems,
              ),
              _listTitle(
                color: color,
                title: "Logout",
                icon: IconlyLight.logout,
                onPressed: () async{
                  await _showLogoutDialog();
                }
              )
            ],
          ),
        ),),
    );
  }

  Future<void> _showAddressDialog() async{
   await showDialog(
        context:context ,
        builder: (context){
      return AlertDialog(
        title: const Text("Up date"),
        content: TextFormField(
          controller: addressController,
          // maxLines: 5,
          onChanged: (value){
            setState(() {
              text=addressController.text;
            });

          },
          decoration: InputDecoration(
              hintText: "your address"
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            text=addressController.text;
            Navigator.of(context).pop();
          }, child: Text("up date")),

        ],
      );
    }
   );
  }

  Future<void> _showLogoutDialog() async{
    await showDialog(
        context:context ,
        builder: (context){
          return AlertDialog(
            title: Row(
              children: [
                Image.asset("asset/image/warinig_signup.webp",height: 20,width: 20,fit: BoxFit.fill,),
                const SizedBox(width: 5,),
                const Text("Sign Up"),
              ],
            ),
            content: const Text("do you want sign up"),
            actions: [
              TextButton(
                onPressed: (){
                  if (Navigator.canPop(context)){
                    Navigator.of(context).pop();
                  }

              }, child: TextWidget(
                title: "Cancel",
                color: Colors.cyan,
                textSize: 20,
              )),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: TextWidget(
                title: "Ok",
                color: Colors.red,
                textSize: 20,
              )),
            ],
          );
        }
    );
  }


  Widget _listTitle({
    required String title ,
    String  subtitle="" ,
    required IconData icon,
    required Function onPressed,
    required Color color
  }){
    return ListTile(
      title: TextWidget(title: title, textSize: 20,color: color,),
      subtitle: TextWidget(title: subtitle, textSize: 18,color: color,),
      leading: Icon(icon),
      trailing:const Icon(IconlyLight.arrow_right_2),
      onTap: (){
        onPressed();
      },
    );
  }
}
