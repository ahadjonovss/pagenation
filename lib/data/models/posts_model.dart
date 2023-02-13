// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PostsModel> postsModelFromJson(String str) => List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromJson(x)));

String postsModelToJson(List<PostsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsModel {
  PostsModel({
    required this.id,
    required this.date,
    required this.slug,
    required this.type,
    required this.link,
    required this.title,
    required this.excerpt,
    required this.author,
    required this.featuredMedia,
    required this.jetpackFeaturedMediaUrl,
    required this.parsely,
    required this.shortlink,
    required this.parselyMeta,
    required this.rapidData,
    required this.premiumContent,
    required this.premiumCutoffPercent,
    required this.featured,
    required this.subtitle,
    required this.editorialContentProvider,
    required this.tcCbMapping,
    required this.associatedEvent,
    required this.event,
    required this.authors,
    required this.hideFeaturedImage,
    required this.canonicalUrl,
    required this.primaryCategory,
    required this.links,
  });

  int id;
  DateTime date;
  String slug;
  Type type;
  String link;
  Title title;
  Excerpt excerpt;
  int author;
  int featuredMedia;
  String jetpackFeaturedMediaUrl;
  Parsely parsely;
  String shortlink;
  ParselyMeta parselyMeta;
  RapidData rapidData;
  bool premiumContent;
  double premiumCutoffPercent;
  bool featured;
  String subtitle;
  String editorialContentProvider;
  List<dynamic> tcCbMapping;
  dynamic associatedEvent;
  dynamic event;
  List<int> authors;
  bool hideFeaturedImage;
  String canonicalUrl;
  PrimaryCategory primaryCategory;
  Links links;

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    slug: json["slug"],
    type: typeValues.map[json["type"]]!,
    link: json["link"],
    title: Title.fromJson(json["title"]),
    excerpt: Excerpt.fromJson(json["excerpt"]),
    author: json["author"],
    featuredMedia: json["featured_media"],
    jetpackFeaturedMediaUrl: json["jetpack_featured_media_url"],
    parsely: Parsely.fromJson(json["parsely"]),
    shortlink: json["shortlink"],
    parselyMeta: ParselyMeta.fromJson(json["parselyMeta"]),
    rapidData: RapidData.fromJson(json["rapidData"]),
    premiumContent: json["premiumContent"],
    premiumCutoffPercent: json["premiumCutoffPercent"]?.toDouble(),
    featured: json["featured"],
    subtitle: json["subtitle"],
    editorialContentProvider: json["editorialContentProvider"],
    tcCbMapping: List<dynamic>.from(json["tc_cb_mapping"].map((x) => x)),
    associatedEvent: json["associatedEvent"],
    event: json["event"],
    authors: List<int>.from(json["authors"].map((x) => x)),
    hideFeaturedImage: json["hide_featured_image"],
    canonicalUrl: json["canonical_url"],
    primaryCategory: PrimaryCategory.fromJson(json["primary_category"]),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "slug": slug,
    "type": typeValues.reverse[type],
    "link": link,
    "title": title.toJson(),
    "excerpt": excerpt.toJson(),
    "author": author,
    "featured_media": featuredMedia,
    "jetpack_featured_media_url": jetpackFeaturedMediaUrl,
    "parsely": parsely.toJson(),
    "shortlink": shortlink,
    "parselyMeta": parselyMeta.toJson(),
    "rapidData": rapidData.toJson(),
    "premiumContent": premiumContent,
    "premiumCutoffPercent": premiumCutoffPercent,
    "featured": featured,
    "subtitle": subtitle,
    "editorialContentProvider": editorialContentProvider,
    "tc_cb_mapping": List<dynamic>.from(tcCbMapping.map((x) => x)),
    "associatedEvent": associatedEvent,
    "event": event,
    "authors": List<dynamic>.from(authors.map((x) => x)),
    "hide_featured_image": hideFeaturedImage,
    "canonical_url": canonicalUrl,
    "primary_category": primaryCategory.toJson(),
    "_links": links.toJson(),
  };
}

class Excerpt {
  Excerpt({
    required this.rendered,
    required this.protected,
  });

  String rendered;
  bool protected;

  factory Excerpt.fromJson(Map<String, dynamic> json) => Excerpt(
    rendered: json["rendered"],
    protected: json["protected"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
    "protected": protected,
  };
}

class Links {
  Links({
    required this.self,
    required this.collection,
    required this.about,
    required this.replies,
    required this.versionHistory,
    required this.predecessorVersion,
    required this.authors,
    required this.httpsTechcrunchComEdit,
    required this.author,
    required this.wpFeaturedmedia,
    required this.wpAttachment,
    required this.wpTerm,
    required this.curies,
  });

  List<About> self;
  List<About> collection;
  List<About> about;
  List<Author> replies;
  List<VersionHistory> versionHistory;
  List<PredecessorVersion> predecessorVersion;
  List<Author> authors;
  List<About> httpsTechcrunchComEdit;
  List<Author> author;
  List<Author> wpFeaturedmedia;
  List<About> wpAttachment;
  List<WpTerm> wpTerm;
  List<Cury> curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
    replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
    versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
    predecessorVersion: List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromJson(x))),
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    httpsTechcrunchComEdit: List<About>.from(json["https://techcrunch.com/edit"].map((x) => About.fromJson(x))),
    author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
    wpFeaturedmedia: List<Author>.from(json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
    wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
    wpTerm: List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
    curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    "about": List<dynamic>.from(about.map((x) => x.toJson())),
    "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
    "version-history": List<dynamic>.from(versionHistory.map((x) => x.toJson())),
    "predecessor-version": List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
    "https://techcrunch.com/edit": List<dynamic>.from(httpsTechcrunchComEdit.map((x) => x.toJson())),
    "author": List<dynamic>.from(author.map((x) => x.toJson())),
    "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
    "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
    "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
    "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
  };
}

class About {
  About({
    required this.href,
  });

  String href;

  factory About.fromJson(Map<String, dynamic> json) => About(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Author {
  Author({
    required this.embeddable,
    required this.href,
  });

  bool embeddable;
  String href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable,
    "href": href,
  };
}

class Cury {
  Cury({
    required this.name,
    required this.href,
    required this.templated,
  });

  Name name;
  Href href;
  bool templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: nameValues.map[json["name"]]!,
    href: hrefValues.map[json["href"]]!,
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "href": hrefValues.reverse[href],
    "templated": templated,
  };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
  "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = EnumValues({
  "wp": Name.WP
});

class PredecessorVersion {
  PredecessorVersion({
    required this.id,
    required this.href,
  });

  int id;
  String href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) => PredecessorVersion(
    id: json["id"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "href": href,
  };
}

class VersionHistory {
  VersionHistory({
    required this.count,
    required this.href,
  });

  int count;
  String href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
    count: json["count"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "href": href,
  };
}

class WpTerm {
  WpTerm({
    required this.taxonomy,
    required this.embeddable,
    required this.href,
  });

  Taxonomy taxonomy;
  bool embeddable;
  String href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
    taxonomy: taxonomyValues.map[json["taxonomy"]]!,
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "taxonomy": taxonomyValues.reverse[taxonomy],
    "embeddable": embeddable,
    "href": href,
  };
}

enum Taxonomy { CATEGORY, POST_TAG, TC_CB_TAG_TAXONOMY, TC_STORIES_TAX, TC_EC_CATEGORY, TC_EVENT, TC_REGIONS_TAX }

final taxonomyValues = EnumValues({
  "category": Taxonomy.CATEGORY,
  "post_tag": Taxonomy.POST_TAG,
  "_tc_cb_tag_taxonomy": Taxonomy.TC_CB_TAG_TAXONOMY,
  "tc_ec_category": Taxonomy.TC_EC_CATEGORY,
  "tc_event": Taxonomy.TC_EVENT,
  "tc_regions_tax": Taxonomy.TC_REGIONS_TAX,
  "tc_stories_tax": Taxonomy.TC_STORIES_TAX
});

class Parsely {
  Parsely({
    required this.version,
    required this.meta,
    required this.rendered,
  });

  Version version;
  List<dynamic> meta;
  String rendered;

  factory Parsely.fromJson(Map<String, dynamic> json) => Parsely(
    version: versionValues.map[json["version"]]!,
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    rendered: json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "version": versionValues.reverse[version],
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "rendered": rendered,
  };
}

enum Version { THE_100 }

final versionValues = EnumValues({
  "1.0.0": Version.THE_100
});

class ParselyMeta {
  ParselyMeta({
    required this.parselyTitle,
    required this.parselyLink,
    required this.parselyType,
    required this.parselyPubDate,
    required this.parselyImageUrl,
    required this.parselyAuthor,
    required this.parselySection,
    required this.parselyTags,
    required this.parselyMetadata,
  });

  String parselyTitle;
  String parselyLink;
  Type parselyType;
  DateTime parselyPubDate;
  String parselyImageUrl;
  List<String> parselyAuthor;
  String parselySection;
  String parselyTags;
  String parselyMetadata;

  factory ParselyMeta.fromJson(Map<String, dynamic> json) => ParselyMeta(
    parselyTitle: json["parsely-title"],
    parselyLink: json["parsely-link"],
    parselyType: typeValues.map[json["parsely-type"]]!,
    parselyPubDate: DateTime.parse(json["parsely-pub-date"]),
    parselyImageUrl: json["parsely-image-url"],
    parselyAuthor: List<String>.from(json["parsely-author"].map((x) => x)),
    parselySection: json["parsely-section"],
    parselyTags: json["parsely-tags"],
    parselyMetadata: json["parsely-metadata"],
  );

  Map<String, dynamic> toJson() => {
    "parsely-title": parselyTitle,
    "parsely-link": parselyLink,
    "parsely-type": typeValues.reverse[parselyType],
    "parsely-pub-date": parselyPubDate.toIso8601String(),
    "parsely-image-url": parselyImageUrl,
    "parsely-author": List<dynamic>.from(parselyAuthor.map((x) => x)),
    "parsely-section": parselySection,
    "parsely-tags": parselyTags,
    "parsely-metadata": parselyMetadata,
  };
}

enum Type { POST }

final typeValues = EnumValues({
  "post": Type.POST
});

class PrimaryCategory {
  PrimaryCategory({
    required this.termId,
    required this.name,
    required this.slug,
    required this.termGroup,
    required this.termTaxonomyId,
    required this.taxonomy,
    required this.description,
    required this.parent,
    required this.count,
    required this.filter,
  });

  int termId;
  String name;
  String slug;
  int termGroup;
  int termTaxonomyId;
  Taxonomy taxonomy;
  String description;
  int parent;
  int count;
  Filter filter;

  factory PrimaryCategory.fromJson(Map<String, dynamic> json) => PrimaryCategory(
    termId: json["term_id"],
    name: json["name"],
    slug: json["slug"],
    termGroup: json["term_group"],
    termTaxonomyId: json["term_taxonomy_id"],
    taxonomy: taxonomyValues.map[json["taxonomy"]]!,
    description: json["description"],
    parent: json["parent"],
    count: json["count"],
    filter: filterValues.map[json["filter"]]!,
  );

  Map<String, dynamic> toJson() => {
    "term_id": termId,
    "name": name,
    "slug": slug,
    "term_group": termGroup,
    "term_taxonomy_id": termTaxonomyId,
    "taxonomy": taxonomyValues.reverse[taxonomy],
    "description": description,
    "parent": parent,
    "count": count,
    "filter": filterValues.reverse[filter],
  };
}

enum Filter { RAW }

final filterValues = EnumValues({
  "raw": Filter.RAW
});

class RapidData {
  RapidData({
    required this.pt,
    required this.pct,
  });

  String pt;
  String pct;

  factory RapidData.fromJson(Map<String, dynamic> json) => RapidData(
    pt: json["pt"],
    pct: json["pct"],
  );

  Map<String, dynamic> toJson() => {
    "pt": pt,
    "pct": pct,
  };
}

class Title {
  Title({
    required this.rendered,
  });

  String rendered;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    rendered: json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
