import 'package:firebase_auth/firebase_auth.dart';

import 'auth_datasource.dart';

class AuthUseCase {
  final AuthDataSource _dataSource;

  AuthUseCase(this._dataSource);

  Future<UserCredential> signUp(String email, String password) {
    return _dataSource.signUpWithEmailAndPassword(email, password);
  }

  Future<UserCredential> signIn(String email, String password) {
    return _dataSource.signInWithEmailAndPassword(email, password);
  }

  Future<void> signOut() {
    return _dataSource.signOut();
  }
}
