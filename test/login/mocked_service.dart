import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart' as mockito;
import 'package:petshop/models/user.dart';
import 'package:petshop/services/user.dart';

class MockedService extends mockito.Mock implements UserService {
  static const user =  User(credential: 'credential', password: 'password');
  @override
  Future<User?> getLoggedInUser() {
    return Future.value(user);
  }

  @override
  Future<User?>? logIn(String credentials, String password) {
    return Future.value(user);
  }

  @override
  Future<void>? logOut() {
    return Future.value();
  }
}

class MockedServiceWithouLoggedUser extends MockedService {
  @override
  Future<User?> getLoggedInUser() {
    return Future.value();
  }
}
