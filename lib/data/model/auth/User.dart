class User {
  int id;
  String name;
  String job;

  User({
    this.id,
    this.name,
    this.job,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        job: json["job"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "job": job,
      };
}
