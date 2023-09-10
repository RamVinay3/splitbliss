import 'package:splitbliss/main.dart';

class Poll {
  void createPoll({
    required String roomId,
    required String option2,
    required String question,
    required String option1,
  }) async {
    var data = {
      "roomId": roomId,
      "options": [option1, option2],
      "option2": option2,
      "results": []
    };
    await supabase.from("poll").insert(data);
  }
}
