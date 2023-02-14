import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pagenation/data/repositories/auth_repository.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isLoading: false, isDone: false,isUzb: false));

  String number = '';


  void checkNumber(String number,String signature){
    if(number.startsWith("+998")){
      emit(state.copyWith(isUzb: true));
    }
    if(number.length==19){
      print("Keldi");
      nextPage( number,signature);
    }
    print(number.length);
  }


  Future<void> nextPage(String number,String signature) async {
    this.number = number;
    emit(state.copyWith(isLoading: true));
    await Future.delayed( const Duration(seconds: 3));
    emit(state.copyWith(isDone:true));
    AuthRepository().sendSms(number: number, signature: signature);
  }
}
