import 'package:splitbliss/main.dart';

class Rooms {
  void insert(
      {required String title,
      required String admin,
      required String color,
      required String typeOfMode,
      double? balance,
      double? spents,
      required List<String> members}) async {
    final data = {
      "title": title,
      "admin": admin,
      "color": color,
      "mode": typeOfMode,
      "balance": (balance != null) ? 0 : balance,
      "spents": (spents != null) ? 0 : spents,
      "members": members
    };
    await supabase.from("rooms").insert(data);
  }
}
