import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petshop/models/user.dart';

class UserService {
  final store = const FlutterSecureStorage();

  Future<User?>? logIn(String credencial, String senha) async {
    try {
      final _user = await store.read(key: 'user');
      if (_user != null) {
        final User user = User.fromJson(_user);
        if (user.credential == credencial) {
          return user;
        }
      } else {
        final userData = '{"credential": "$credencial", "senha": "$senha"}';
        await store.write(key: 'user', value: userData);
        return User.fromJson(userData);
      }
    } catch (e) {
      throw LoginError.NETWORK_ERROR;
    }
  }

  Future<User?>? getLoggedInUser() async {
    final user = await store.read(key: 'user');
    if (user != null) {
      return User.fromJson(user);
    }
    return null;
  }

  Future<void>? logOut() async {
    return store.delete(key: 'user');
  }
}

enum LoginError {
  // ignore: constant_identifier_names
  NETWORK_ERROR,
  // ignore: constant_identifier_names
  UNAUTHORIZED_ACCES,
}
