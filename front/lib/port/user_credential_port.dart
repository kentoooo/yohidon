
import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/mailaddress.dart';
import 'package:yohidon/domain/password.dart';
import 'package:yohidon/domain/user_credential.dart';
import 'package:yohidon/domain/user_id.dart';
import 'package:yohidon/driver/firebase.dart';
import 'package:yohidon/driver/local_storage.dart';

abstract class UserCredentialPort {
  Future<UserCredential> authn(MailAddress mailAddress, Password password);
  Future<void> save(UserCredential userCredential);
}

@Injectable(as: UserCredentialPort)
class UserCredentialGateway extends UserCredentialPort {

  final LocalStorage _localStorage;

  UserCredentialGateway(this._localStorage);

  @override
  Future<UserCredential> authn(MailAddress mailAddress, Password password) async {
    final response = await Firebase().authnWithEmailAndPassword(mailAddress.value, password.value);
    return UserCredential(UserId(response!.user!.uid));
  }

  @override
  Future<void> save(UserCredential userCredential) async {
    _localStorage.save(userCredential);
  }

}