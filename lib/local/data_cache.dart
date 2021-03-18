import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DataCache {
  // Scope: Auth
  static const ACCESS_TOKEN = "ACCESS_TOKEN";

  SharedPreferences _preferences;

  DataCache(this._preferences);

  Future<void> clearData() async {
    return await _preferences.clear();
  }

  // Future<void> saveAccessToken(Token token) async {
  //   return await _preferences.setString(
  //       ACCESS_TOKEN, json.encode(token.toJson()));
  // }

  // Token getAccessToken() {
  //   return _preferences.getString(ACCESS_TOKEN) != null
  //       ? Token.buildToken(json.decode(_preferences.getString(ACCESS_TOKEN)))
  //       : null;
  // }
}