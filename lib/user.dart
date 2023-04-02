class User {
  final String status;
  final String name;
  final String species;
  final String gender;
  final String created;
  final int id;
  //final String url;

  User({
    required this.gender,
    required this.status,
    required this.species,
    required this.created,
    required this.id,
    required this.name,
    //required this.url,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        gender: json["gender"],
        name: json["name"],
        status: json["status"],
        created: json["created"],
        id: json["id"],
        species: json["species"],
        //url: json["url"],
      );
}
