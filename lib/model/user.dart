import 'package:meta/meta.dart';

class User {
  String name;
  String positif;
  String sembuh;
  String meninggal;
  String dirawat;

  User({
    @required this.name,
    @required this.positif,
    @required this.sembuh,
    @required this.meninggal,
    @required this.dirawat,
  });

  static User fromJson(json) => User(
        name: json["name"],
        positif: json["positif"].toString(),
        sembuh: json["sembuh"].toString(),
        meninggal: json["meninggal"].toString(),
        dirawat: json["dirawat"].toString(),
      );
}
