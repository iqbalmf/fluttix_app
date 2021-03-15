part of 'services.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguages) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Users user = result.user.convertToUser(
          name: name,
          selectedLanguages: selectedLanguages,
          selectedGenres: selectedGenres);

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      print(e);
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Users user = await result.user.fromFirestore();

      return SignInSignUpResult(user: user);
    } catch (e) {
      print(e);
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<User> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  final Users user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
