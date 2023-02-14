import 'package:dio/dio.dart';
import 'package:pagenation/data/models/my_response.dart';
import 'package:pagenation/data/models/page_model.dart';
import 'package:pagenation/data/models/posts_model.dart';
import 'package:pagenation/services/api_service/api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getPages(int page) async {
    MyResponse myResponse=MyResponse();
    try {
      Response response =
      await dio.get("https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=18&page=$page",);
      if (response.statusCode == 200) {
        myResponse.data = response.data.map((e)=>PostsModel.fromJson(e)).toList();
        print("Success");
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}