import 'package:random_password_generator/random_password_generator.dart';
import 'package:telephony/telephony.dart';
class Auth{
  Future<void> sendSms({required String number, required String signature}) async {

    final password = RandomPasswordGenerator();

    String newPassword = password.randomPassword(numbers: true,passwordLength: 4,letters: false);
    await Telephony.instance.sendSms(
        to: number,
        message: "<#> Confimation Code: $newPassword $signature"
    );
  }

}