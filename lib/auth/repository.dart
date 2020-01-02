import 'package:firebase_auth/firebase_auth.dart';
import './auth_provider.dart';

class Repository {
  final _authProvider = AuthProvider();

  Future<AuthResult> signInWithCredential(AuthCredential credential) =>
      _authProvider.signInWithCredential(credential);

  Future<FirebaseUser> getCurrentUser() => _authProvider.getCurrentUser();

  Future<void> verifyPhoneNumber(
          String phone,
          PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
          PhoneCodeSent codeSent,
          Duration duration,
          PhoneVerificationCompleted verificationCompleted,
          PhoneVerificationFailed verificationFailed) =>
      _authProvider.verifyPhoneNumber(phone, codeAutoRetrievalTimeout, codeSent,
          duration, verificationCompleted, verificationFailed);
}
