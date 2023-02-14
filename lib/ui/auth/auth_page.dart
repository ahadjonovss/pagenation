import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pagenation/bloc/auth_cubit/auth_cubit.dart';
import 'package:pagenation/ui/auth/sms_page.dart';

class TelegramAuthPage extends StatelessWidget {
   TelegramAuthPage({Key? key}) : super(key: key);

  var maskFormatter = new MaskTextInputFormatter(
      mask: '+### | ## ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state) {
        if(state.isDone){
          print("Ketishi kere");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomePage(),));
        }
      },
      builder: (context, state) {
        return  Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.blue,),onPressed: () {
                Navigator.pop(context);
              },),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            floatingActionButton: FloatingActionButton(
              onPressed: () {


              },
              child: context.read<AuthCubit>().state.isDone?const Padding(
               padding: EdgeInsets.all(14),
                child:  Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ):Icon(Icons.arrow_forward,color: Colors.white,),
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children:  [
                    SizedBox(height: 120,),
                    Text("Your phone number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    Text("Please, confirm your country code\nand enter your phone number",textAlign:TextAlign.center,style: TextStyle(fontSize: 14,),),
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      height: 56,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text(state.isUzb?"🇺🇿 Uzbekistan":"Non defined",style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: 400,
                      child: TextField(
                        inputFormatters: [maskFormatter],
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<AuthCubit>().checkNumber(value);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Phone number"),
                        ),
                      ),
                    )


                  ],
                ),
              ),
            )
        );
      },

    );
  }
}