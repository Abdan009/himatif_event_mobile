part of 'services.dart';

class AuthEmailServices {
  static var _auth = FirebaseAuth.instance;

  static Future signUp(
      {String email, String password, Users usersInput}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await result.user.sendEmailVerification();
      // Users users = result.user.convertToAdmin(usersInput);
      // await UsersServices.updateUser(users);
      return SignInSignOutResult(user: null);
    } on auth.FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message =
            'Kata sandi lemah. Gunakan kombinasi huruf, angka, dan symbol';
      } else if (e.code == 'email-already-in-use') {
        message =
            'Email telah digunakan oleh pengguna lain. Silahkan menggunakan fitur lupa password';
      } else {
        message = "Terjadi kesalahan. Coba lagi!";
      }
      return SignInSignOutResult(message: message);
    }
  }

  static Future<SignInSignOutResult> signIn(
      {String email, String password}) async {
    try {
      // UserCredential result = await _auth.signInWithEmailAndPassword(
      //     email: email, password: password);
      // Users users = await result.user.fromFireStore();
      return SignInSignOutResult(user: null);
    } on FirebaseException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'Email belum terdaftar';
      } else if (e.code == 'wrong-password') {
        message = 'Password tidak sesuai';
      } else {
        message = "Terjadi kesalahan. Coba lagi!";
      }
      print(e);
      return SignInSignOutResult(message: message);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {}
  }

  static Stream<auth.User> get userStream => _auth.authStateChanges();
}

class SignInSignOutResult {
  final Users user;
  final String message;

  SignInSignOutResult({this.user, this.message});
}
