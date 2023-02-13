import 'package:pagenation/data/models/page_model.dart';


class MyResponse{
  String error;
  dynamic data;

  MyResponse({this.data,this.error=''});
}