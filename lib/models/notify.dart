import 'package:splitbliss/enums.dart';

class Notify {
  const Notify(
      this.message, this.groupname, this.intiator, this.type, this.date);
  final String message;
  final String groupname;
  final String intiator;
  final Type type;
  final DateTime date;
}
