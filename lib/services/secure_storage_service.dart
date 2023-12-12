import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  Future<void> writeSecureData({
    required String key,
    required String value,
  }) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readSecureData(String key) async {
    String? value = await storage.read(key: key);
    log('Data read: $value');
    return value;
  }

  Future<void> deleteSecureData(String key) async {
    await storage.delete(key: key);
  }
}
