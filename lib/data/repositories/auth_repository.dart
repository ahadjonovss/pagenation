import 'package:telephony/telephony.dart';

class AuthRepository{
  Future<void> sendSms({required String number, required String signature}) async {
    await Telephony.instance.sendSms(
        to: number,
        message: "<#> Confimation Code: 20121007 $signature"
    );
  }

}