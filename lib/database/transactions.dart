import 'package:splitbliss/main.dart';

class Transaction {
  void insert({
    required String roomId,
    required double amount,
    required String reason,
    required String paidby,
    required List<String> variedAmount,
  }) async {
    var data = {
      "roomId": roomId,
      "amount": amount,
      "reason": reason,
      "paidby": paidby,
      "variedamount": variedAmount
    };
    await supabase.from("transactions").insert(data);
  }
}
