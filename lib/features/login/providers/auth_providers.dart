import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final loggedUserProvider = StateProvider<EndUserModel?>((ref) {
//   return null;
// });

// With firebase I often find myself writing simple providers
// Usually, stream-based redirects is more than enough.
// Most of the auth-related logic is handled by the SDK
final authProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});
