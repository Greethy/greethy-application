import 'dart:convert';

import 'package:greethy_application/data/dto/user_dto/user_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:greethy_application/zdataDev/link_media_info.dart';

import '../../domain/entities/user_entities/user.dart';

class SharedPreferenceHelper {
  SharedPreferenceHelper._internal();

  static final SharedPreferenceHelper _singleton = SharedPreferenceHelper._internal();

  factory SharedPreferenceHelper() {
    return _singleton;
  }

  Future<String?> getUserName() async {
    return (await SharedPreferences.getInstance()).getString(UserPreferenceKey.UserName.toString());
  }

  Future<bool> saveUserProfile(User user) async {
    return (await SharedPreferences.getInstance()).setString(UserPreferenceKey.UserProfile.toString(), json.encode(user.toString()));
  }

  Future<User?> getUserProfile() async {
    final String? jsonString = (await SharedPreferences.getInstance()).getString(UserPreferenceKey.UserProfile.toString());
    if (jsonString == null) return null;
    return UserDto.fromMap(json.decode(jsonString));
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
