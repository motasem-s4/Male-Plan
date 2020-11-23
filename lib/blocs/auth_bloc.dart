import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_plan/services/auth_service.dart';

class AuthBloc with ChangeNotifier {
  final authService = AuthService();
  final fb = FacebookLogin();
  final googleSignIn = GoogleSignIn(scopes: ['email']);

  Stream<User> get currentUser {
    return authService.currentUser;
  }

  loginFacebook() async {
    print('Starting Facebook Login');

    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email
    ]);

    switch (res.status) {
      case FacebookLoginStatus.Success:
        print('It worked');

        //Get Token
        final FacebookAccessToken fbToken = res.accessToken;

        //Convert to Auth Credential
        final AuthCredential credential =
            FacebookAuthProvider.credential(fbToken.token);

        //User Credential to sign in with Firebase
        final result = await authService.signInWithCredential(credential);

        print('${result.user.displayName} is now logged in');
        break;
      case FacebookLoginStatus.Cancel:
        print('The user canceled the login');
        break;
      case FacebookLoginStatus.Error:
        print('There was an error with facebook');
        break;
    }
  }
  logoutOf(){
    authService.logout();
  }

  signInGoogle() async {
    //Google Login
    try{
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken
      );

      //Sign in to Firebase
      final result = await authService.signInWithCredential(credential);

    }catch (error) {
      print('There was an error with google');
    }
  }

}
