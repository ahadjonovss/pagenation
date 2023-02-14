import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagenation/bloc/auth_cubit/auth_cubit.dart';
import 'package:pagenation/ui/pagenation_page.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class SmsVerificationPage extends StatefulWidget {
  const SmsVerificationPage({super.key});

@override
// ignore: library_private_types_in_public_api
_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SmsVerificationPage> {
  final int _otpCodeLength = 4;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final intRegex = RegExp(r'\d+', multiLine: true);
  TextEditingController textEditingController =  TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _getSignatureCode();
    _startListeningSms();
  }

  @override
  void dispose() {
    super.dispose();
    SmsVerification.stopListening();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  /// get signature code
  _getSignatureCode() async {
    String? signature = await SmsVerification.getAppSignature();
  }

  /// listen sms
  _startListeningSms()  {
    SmsVerification.startListeningSms().then((message) {
      setState(() {
        _otpCode = SmsVerification.getCode(message, intRegex);
        textEditingController.text = _otpCode;
        _onOtpCallBack(_otpCode, true);
      });
    });
  }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
  }

  _onClickRetry() {
    _startListeningSms();
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(()  {
      _otpCode = otpCode;
    });

    setState(() async {
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        print("1 Tushdi");
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
        print("2 Tushdi");

      } else {
        _enableButton = false;
        await Future.delayed( const Duration(seconds: 3));
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PageNationPage(),), (route) => false);
      }
    });
  }

  _verifyOtpCode() {
    FocusScope.of(context).requestFocus( FocusNode());
    Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: AppBar(
         backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon:const  Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: () {

          },),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(height: 180,),
              const Text("Enter Code",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
              const Text("We have sent an SMS  an activation code to your phone ",style: TextStyle(fontSize: 12),),
              Text(context.read<AuthCubit>().number,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
              const SizedBox(height: 40,),
              TextFieldPin(
                  textController: textEditingController,
                  autoFocus: true,
                  codeLength: _otpCodeLength,
                  alignment: MainAxisAlignment.center,
                  defaultBoxSize: 46.0,
                  margin: 4,
                  selectedBoxSize: 46.0,
                  textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  defaultDecoration: _pinPutDecoration.copyWith(
                      border: Border.all(
                          color: Theme.of(context)
                              .primaryColor
                              .withOpacity(0.6))),
                  selectedDecoration: _pinPutDecoration,
                  onChange: (code) {
                    _onOtpCallBack(code,false);
                  }),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

}