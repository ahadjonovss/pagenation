import 'package:flutter/material.dart';

class TelegramAuthPage extends StatelessWidget {
  const TelegramAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.blue,),onPressed: () {
          Navigator.pop(context);
        },),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children:const  [
            Text("Your phone number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            Text("Please, confirm your country code\nand enter your phone number",textAlign:TextAlign.center,style: TextStyle(fontSize: 14,),),


          ],
        ),
      ),
    );
  }
}