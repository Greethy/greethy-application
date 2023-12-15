import 'dart:convert';

import 'package:greethy_application/model/user_model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:greethy_application/data/link_media_info.dart';

class SharedPreferenceHelper {
  SharedPreferenceHelper._internal();

  static final SharedPreferenceHelper _singleton = SharedPreferenceHelper._internal();

  factory SharedPreferenceHelper() {
    return _singleton;
  }

  Future<String?> getUserName() async {
    return (await SharedPreferences.getInstance()).getString(UserPreferenceKey.UserName.toString());
  }

  Future<bool> saveUserProfile(UserModel user) async {
    return (await SharedPreferences.getInstance()).setString(UserPreferenceKey.UserProfile.toString(), json.encode(user.toJson()));
  }

  Future<UserModel?> getUserProfile() async {
    final String? jsonString = (await SharedPreferences.getInstance()).getString(UserPreferenceKey.UserProfile.toString());
    if (jsonString == null) return null;
    return UserModel.fromJson(json.decode(jsonString));
  }

  Future<bool> saveLinkMediaInfo(String key, LinkMediaInfo model) async {
    return (await SharedPreferences.getInstance()).setString(key, json.encode(model.toJson()));
  }

  Future<LinkMediaInfo?> getLinkMediaInfo(String key) async {
    final String? jsonString = (await SharedPreferences.getInstance()).getString(key);
    if (jsonString == null) {
      return null;
    }
    return LinkMediaInfo.fromJson(json.decode(jsonString));
  }

  Future<bool> isFirstTimeApp() async {
    return (await SharedPreferences.getInstance()).getBool(UserPreferenceKey.IsFirstTimeApp.toString()) ?? true;
  }

  Future<bool> endWelcomeFirstTime() async {
    return (await SharedPreferences.getInstance()).setBool(UserPreferenceKey.IsFirstTimeApp.toString(), false);
  }

  Future clearPreferenceValues() async {
    (await SharedPreferences.getInstance()).clear();
  }
}

enum UserPreferenceKey { AccessToken, UserProfile, UserName, IsFirstTimeApp }
