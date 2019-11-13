class Brand {
  String brandCode;
  List<String> categories;
  String imageUrl;
  String title;

  Brand({
    this.brandCode,
    this.categories,
    this.imageUrl,
    this.title,
  });

  factory Brand.fromJson(Map json) => Brand(
        brandCode: json["brandCode"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        imageUrl: json["imageUrl"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "brandCode": brandCode,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "imageUrl": imageUrl,
        "title": title,
      };
}
