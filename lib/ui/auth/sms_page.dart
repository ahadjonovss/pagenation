import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:sms_autofill/sms_autofill.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with CodeAutoFill {
  String? appSignature;
  static const platform = const MethodChannel('sendSms');
  String? otpCode;

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }
  // code  Bu test sms 123456 C3V4NnEVb93
  //Ваш код подтверждения 231559 C3V4NnEVb93

  @override
  void initState() {
    super.initState();
    listenForCode();

    SmsAutoFill().getAppSignature.then((signature) {

      print("MY DEVICE SIGNATURE:$signature");

      setState(() {
        appSignature = signature;
        // phone number
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 18);

    return Scaffold(
      appBar: AppBar(
        title: Text("Listening for code"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Text(
              "This is the current app signature: $appSignature",
            ),
          ),
          const Spacer(),
          IconButton(onPressed: () async {
            await platform.invokeMethod('send',<String,dynamic>{"phone":"+998909319051","msg":"<#> Confimation Code: 478519 mn+vioyEIVY"});
            // await sendSMS(message: "<#> Confimation Code: 478519 mn+vioyEIVY", recipients: ["+998909319051"]);
              // print(_result)
          }, icon: Icon(Icons.sms)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Builder(
              builder: (_) {
                if (otpCode == null) {
                  return Text("Listening for code...", style: textStyle);
                }
                return Text("Code Received: $otpCode", style: textStyle);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}