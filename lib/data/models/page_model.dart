class PaginationModel {
  int page_count;
  int page_number;
  int page_size;
  int total;
  List<Tender> tenders;

  PaginationModel(
      {required this.page_count,
      required this.page_number,
      required this.page_size,
      required this.tenders,
      required this.total});

  factory PaginationModel.fromJson(Map<String,dynamic> json) {
    return PaginationModel(
      page_count: json["page_count"]??0,
      page_number: json["page_number"]??0,
      page_size: json["page_size"]??0,
      tenders: json["data"].toList().map((e)=>Tender.fromJson(e)).toList(),
      total: json["total"]??0,
    );
  }
}

class Tender {

  String id;
  Tender({
    required this.id
});

  factory Tender.fromJson(Map<String,dynamic> json){
    print(json);
    return Tender(
      id: json["id"]??""
    );
  }
}
