import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isLoading: false, isDone: false,isUzb: false));


  void checkNumber(String number){
    if(number.startsWith("+998")){
      emit(state.copyWith(isUzb: true));
    }
    if(number.length==19){
      print("Keldi");
      nextPage();
    }
    print(number.length);
  }


  Future<void> nextPage() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed( const Duration(seconds: 3));
    emit(state.copyWith(isDone:true));
  }
}
