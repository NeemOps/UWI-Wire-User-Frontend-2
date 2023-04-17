import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Repository {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<bool> containsKey(String key) async {
    return _storage.containsKey(key: key);
  }

  Future<void> write(String key, String? value) async {
    _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    _storage.delete(key: key);
  }

  Future<void> clear() async {
    _storage.deleteAll();
  }
}
