import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pagenation/data/models/my_response.dart';
import 'package:pagenation/data/service/api_service/api_service.dart';
import 'package:shimmer/shimmer.dart';

class PageNationPage extends StatefulWidget {
   PageNationPage({Key? key}) : super(key: key);

  @override
  State<PageNationPage> createState() => _PageNationPageState();
}

class _PageNationPageState extends State<PageNationPage> {
  List posts = [];
  int page = 1;
  var scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageNation"),),
      body: posts.isNotEmpty?ListView.builder(
        shrinkWrap: true,
        itemCount: posts.length+1,
        controller: scrollController,
        itemBuilder: (context, index) => index==posts.length?const SizedBox(
          height: 40,
            child: Center(child: CircularProgressIndicator())):Container(
          margin: const EdgeInsets.all(12),
              child: ListTile(
          subtitle: CachedNetworkImage(
              imageUrl: posts[index].jetpackFeaturedMediaUrl,
              errorWidget: (context, url, error) =>  Container(
                height: 200,
                width: 400,
                child: Center(
                  child: Text(error),
                ),
              ),
              progressIndicatorBuilder: (context, url, progress) => Shimmer.fromColors(baseColor: Colors.grey, highlightColor: Colors.white, child: Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
                ),
              )),
          ),
          title: Center(child: Text(posts[index].title.rendered.toString())),),
            ),): const SizedBox(),
    );
  }


  void _scrollListener(){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      page++;
      getData();
    }
  }


  Future<void> getData() async {
    MyResponse result = await ApiService().getPages(page);
    posts.addAll(result.data);
    print('${posts.length} ta page keldi');
    setState(() {});
  }
}
