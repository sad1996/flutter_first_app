List<Repo> parseReposFromJson(List<dynamic> list) =>
    List<Repo>.from(list.map((x) => Repo.fromJson(x)));

class Repo {
  String author;
  String name;
  String avatar;
  String url;
  String description;
  String language;
  String languageColor;
  int stars;
  int forks;
  int currentPeriodStars;
  List<BuiltBy> builtBy;

  Repo({
    this.author,
    this.name,
    this.avatar,
    this.url,
    this.description,
    this.language,
    this.languageColor,
    this.stars,
    this.forks,
    this.currentPeriodStars,
    this.builtBy,
  });

  factory Repo.fromJson(Map<String, dynamic> json) => Repo(
        author: json["author"],
        name: json["name"],
        avatar: json["avatar"],
        url: json["url"],
        description: json["description"],
        language: json["language"],
        languageColor: json["languageColor"],
        stars: json["stars"],
        forks: json["forks"],
        currentPeriodStars: json["currentPeriodStars"],
        builtBy:
            List<BuiltBy>.from(json["builtBy"].map((x) => BuiltBy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "name": name,
        "avatar": avatar,
        "url": url,
        "description": description,
        "language": language,
        "languageColor": languageColor,
        "stars": stars,
        "forks": forks,
        "currentPeriodStars": currentPeriodStars,
        "builtBy": List<dynamic>.from(builtBy.map((x) => x.toJson())),
      };
}

class BuiltBy {
  String username;
  String href;
  String avatar;

  BuiltBy({
    this.username,
    this.href,
    this.avatar,
  });

  factory BuiltBy.fromJson(Map<String, dynamic> json) => BuiltBy(
        username: json["username"],
        href: json["href"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "href": href,
        "avatar": avatar,
      };
}
