import 'package:splitbliss/main.dart';

class UsersInfo {
  const UsersInfo();

  void insert({
    required String email,
    required String username,
    required String firstname,
    required String lastname,
    required String color,
  }) async {
    var data = {
      "email": email,
      "username": username,
      "firstname": firstname,
      "lastname": lastname,
      "color": color
    };

    await supabase.from("users").insert(data);
  }
}
