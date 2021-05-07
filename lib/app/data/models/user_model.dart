class User {
  /// The user's unique username. Case-sensitive. Required.
  late String about;
  int? created;
  int? delay;
  String? id;
  int? karma;
  List<int>? submitted;

  User({about, created, delay, id, karma, submitted});

  User.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    created = json['created'];
    delay = json['delay'];
    id = json['id'];
    karma = json['karma'];
    submitted = json['submitted'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['about'] = about;
    data['created'] = created;
    data['delay'] = delay;
    data['id'] = id;
    data['karma'] = karma;
    data['submitted'] = submitted;
    return data;
  }
}
