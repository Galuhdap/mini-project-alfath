import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninConfig {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  // client id web
    serverClientId:
        '303939612981-5mpg90fgoq3q7h70llfb1t9sqrusitu0.apps.googleusercontent.com',
  );

  /// Login dan mengembalikan akun Google
  static Future<GoogleSignInAccount?> login() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      return account;
    } catch (e) {
      print("Google Sign-In error: $e");
      return null;
    }
  }

  /// Mendapatkan ID Token + Access Token
  static Future<Map<String, String?>> getTokens() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account == null) return {"idToken": null, "accessToken": null};

      final GoogleSignInAuthentication auth = await account.authentication;

      return {"idToken": auth.idToken, "accessToken": auth.accessToken};
    } catch (e) {
      print("Google Token error: $e");
      return {"idToken": null, "accessToken": null};
    }
  }

  /// Logout
  static Future<void> logout() => _googleSignIn.signOut();
}
