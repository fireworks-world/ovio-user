import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import './auth_validators.dart';
import './constants.dart';
import './repository.dart';
import 'package:rxdart/rxdart.dart';

// Define all possible states for the auth form.
enum AuthStatus { emailAuth, phoneAuth, emailLinkSent, smsSent, isLoading }

class AuthBloc with AuthValidators {
  final _repository = Repository();
  final _dialCode = BehaviorSubject<String>();
  final _phone = BehaviorSubject<String>();
  final _authStatus = BehaviorSubject<AuthStatus>();
  final _verificationId = BehaviorSubject<String>();

// Add data to stream, validate inputs
  Observable<String> get phone => _phone.stream.transform(validatePhone);
  Observable<String> get dialCode => _dialCode.stream;
  Observable<String> get verificationID => _verificationId.stream;
  Observable<AuthStatus> get authStatus => _authStatus.stream;

// get value
  String get getPhone => _phone.value;
  String get getDialCode => _dialCode.value;
  String get getVerificationId => _verificationId.value;
  AuthStatus get getAuthStatus => _authStatus.value;

// change data
  Function(String) get changePhone => _phone.sink.add;
  Function(String) get changeDialCode => _dialCode.sink.add;
  Function(String) get changeVerificationId => _verificationId.sink.add;
  Function(AuthStatus) get changeAuthStatus => _authStatus.sink.add;

  Future<FirebaseUser> getCurrentUser() {
    return _repository.getCurrentUser();
  }

  Future<AuthResult> signInWithCredential(AuthCredential credential) {
    return _repository.signInWithCredential(credential);
  }

  Future<void> verifyPhoneNumber(
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
      PhoneCodeSent codeSent,
      PhoneVerificationCompleted verificationCompleted,
      PhoneVerificationFailed verificationFailed) {
    // For the full phone number we need to concat the dialcode and the number entered by the user
    String phoneNumber = '+91' + _phone.value.toString();
    return _repository.verifyPhoneNumber(
        phoneNumber,
        codeAutoRetrievalTimeout,
        codeSent,
        Duration(seconds: Constants.timeOutDuration),
        verificationCompleted,
        verificationFailed);
  }

  dispose() async {
    await _phone.drain();
    _phone.close();
    await _authStatus.drain();
    _authStatus.close();
    await _dialCode.drain();
    _dialCode.close();
    await _verificationId.drain();
    _verificationId.close();
  }
}
