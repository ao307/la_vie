// ignore: avoid_classes_with_only_static_members
import 'package:google_sign_in/google_sign_in.dart';

// ignore: avoid_classes_with_only_static_members
class GoogleSignInApi {
  static const String clientId =
      "755451410576-ip2pei4in4dh72ijhddacr9nbu018a3e.apps.googleusercontent.com";

  static const sha1 =
      "10:2F:CB:23:AC:54:EA:EA:F6:3F:77:11:C0:EE:A0:3F:3A:41:71:33";
  static final googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      "https://www.googleapis.com/auth/contacts.readonly",
    ],
  );

  static Future<GoogleSignInAccount?> login() => googleSignIn.signIn();
}
