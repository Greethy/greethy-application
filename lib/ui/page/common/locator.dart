import 'package:greethy_application/helper/shared_prefrence_helper.dart';
import 'package:get_it/get_it.dart';

import '../plays/feed_viewmodel.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  if (!getIt.isRegistered<SharedPreferenceHelper>()) {
    getIt.registerSingleton<SharedPreferenceHelper>(SharedPreferenceHelper());
    getIt.registerSingleton<FeedViewModel>(FeedViewModel());
  }
}