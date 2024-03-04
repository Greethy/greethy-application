import 'package:get_it/get_it.dart';
import 'package:greethy_application/presentation/helper/shared_prefrence_helper.dart';

import '../plays/state/feed_viewmodel.dart';

/// Dependency injection (DI) - injection.dart - Register dependencies here
final getIt = GetIt.instance;

void setupDependencies() {
  if (!getIt.isRegistered<SharedPreferenceHelper>()) {
    getIt.registerSingleton<SharedPreferenceHelper>(SharedPreferenceHelper());
  }
  if (!getIt.isRegistered<FeedViewModel>()) {
    getIt.registerSingleton<FeedViewModel>(FeedViewModel());
  }
}
