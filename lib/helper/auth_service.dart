class AuthService {
  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final HttpsCallable createUser =
  //     CloudFunctions.instance.getHttpsCallable(functionName: 'createUser');
  // String verificationId;
  // AuthRoute _authRoute = AuthRoute();

  // Future<void> validatePhoneNumberWithOTP(
  //     BuildContext context, String code) async {
  //   Provider.of<AuthenticationProvider>(context, listen: false).loading = true;
  //   // final AuthCredential authCredential = PhoneAuthProvider.getCredential(verificationId: this.verificationId, smsCode: code);
  //   final AuthCredential authCredential = PhoneAuthProvider.credential(
  //       verificationId: this.verificationId, smsCode: code);

  //   // final AuthResult _userCredential = await _firebaseAuth.signInWithCredential(authCredential);
  //   final UserCredential _userCredential =
  //       await _firebaseAuth.signInWithCredential(authCredential);
  //   Provider.of<AuthenticationProvider>(context, listen: false).loading = false;
  //   if (_userCredential.user != null) {
  //     Provider.of<AuthenticationProvider>(context, listen: false)
  //         .userIsVerified = true;
  //     //route here
  //   } else {
  //     Provider.of<AuthenticationProvider>(context, listen: false)
  //         .userIsVerified = false;
  //     print("Enter the correct PIN");
  //   }
  // }

  // initAuth({BuildContext context, String phoneNumber}) async {
  //   Provider.of<AuthenticationProvider>(context, listen: false).loading = true;

  //   final PhoneVerificationCompleted verificationCompleted =
  //       (AuthCredential phoneAuthCredential) async {
  //     Provider.of<AuthenticationProvider>(context, listen: false).loading =
  //         true;
  //     // final AuthResult authResult = await _firebaseAuth.signInWithCredential(phoneAuthCredential);
  //     final UserCredential authResult =
  //         await _firebaseAuth.signInWithCredential(phoneAuthCredential);
  //     if (authResult.user != null) {
  //       Provider.of<AuthenticationProvider>(context, listen: false).loading =
  //           false;
  //       Provider.of<AuthenticationProvider>(context, listen: false)
  //           .userIsVerified = true;
  //     }
  //   };

  //   // final PhoneVerificationFailed verificationFailed = (AuthException authException) {
  //   final PhoneVerificationFailed verificationFailed =
  //       (FirebaseAuthException authException) {
  //     print('Auth Exception is ${authException.message}');
  //   };

  //   final PhoneCodeSent codeSent =
  //       (String verificationId, [int forceResendingToken]) async {
  //     Provider.of<AuthenticationProvider>(context, listen: false).loading =
  //         false;
  //     Provider.of<AuthenticationProvider>(context, listen: false).codeSent =
  //         true;
  //     this.verificationId = verificationId;
  //   };

  //   final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
  //       (String verificationId) {
  //     this.verificationId = verificationId;
  //   };

  //   await _firebaseAuth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       verificationCompleted: verificationCompleted,
  //       verificationFailed: verificationFailed,
  //       codeSent: codeSent,
  //       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
  //       timeout: Duration(seconds: 60));
  // }

  // Future<Response> updateUserprofile(
  //     {context, String name, String email}) async {
  //   User _user = _firebaseAuth.currentUser;
  //   Response response = Response(success: false);
  //   Provider.of<AuthenticationProvider>(context, listen: false).loading = true;

  //   try {
  //     HttpsCallableResult functionResponse = await createUser.call({
  //       'displayName': name,
  //       'email': email,
  //       'phoneNumber': _user.phoneNumber
  //     });
  //     response.success = functionResponse.data['success'];
  //     response.message = functionResponse.data['message'];

  //     _user.updateProfile(displayName: name);
  //     // _user.updateEmail(email);

  //     AuthCredential credential = AuthCredential(
  //         providerId: PhoneAuthProvider.PROVIDER_ID,
  //         signInMethod: PhoneAuthProvider.PHONE_SIGN_IN_METHOD);
  //     await _user.reauthenticateWithCredential(credential);

  //     _user.reload();

  //     Provider.of<AuthenticationProvider>(context, listen: false).loading =
  //         false;

  //     return response;
  //   } catch (e) {
  //     Provider.of<AuthenticationProvider>(context, listen: false).loading =
  //         false;
  //     response.message = e.message;
  //     return response;
  //   }
  // }

  // signOut(BuildContext context) async {
  //   await _firebaseAuth.signOut();
  //   _authRoute.route(context);
  // }
}
