import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  void setUser(User? user) {
    state = user;
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, User?>((ref) => UserNotifier());
