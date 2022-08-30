// ignore: avoid_classes_with_only_static_members
import 'package:google_sign_in/google_sign_in.dart';

// ignore: avoid_classes_with_only_static_members
class GoogleSignInApi {
  static const String clientId =
      "755451410576-ip2pei4in4dh72ijhddacr9nbu018a3e.apps.googleusercontent.com";
  static final googleSignIn = GoogleSignIn(
    clientId: clientId,
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount?> login() => googleSignIn.signIn();
}
