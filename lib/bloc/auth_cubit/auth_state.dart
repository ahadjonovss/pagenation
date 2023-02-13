part of 'auth_cubit.dart';

 // ignore: must_be_immutable
 class AuthState extends Equatable {
   bool isDone;
   bool isLoading;
   bool isUzb;

   AuthState({required this.isLoading,required this.isDone,required this.isUzb});


   copyWith(
   {
     bool? isLoading,
     bool? isDone,
     bool? isUzb,
 }
       ){
     return AuthState(isLoading: isLoading??this.isLoading, isDone: isDone??this.isDone, isUzb: isUzb??this.isUzb);
   }






  @override
  // TODO: implement props
  List<Object?> get props => [
    isDone,
    isLoading
  ];
}




