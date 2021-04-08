import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/user_credential.dart';

@singleton
class LocalStorage {

  UserCredential? userCredential;

  Future<void> save(UserCredential userCredential) async {
    this.userCredential = userCredential;
  }
}
