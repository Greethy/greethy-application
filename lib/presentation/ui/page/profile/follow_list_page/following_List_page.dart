import 'package:flutter/material.dart';
import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/newWidget/customLoader.dart';
import '../../common/usersListPage.dart';
import 'follow_List_state.dart';

class FollowingListPage extends StatelessWidget {
  const FollowingListPage(
      {Key? key, required this.profile, required this.userList})
      : super(key: key);
  final List<String> userList;
  final User profile;

  static MaterialPageRoute getRoute(
      {required List<String> userList, required User profile}) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (_) => FollowListState(StateType.following),
          child: FollowingListPage(profile: profile, userList: userList),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<FollowListState>().isBusy) {
      return SizedBox(
        height: context.height,
        child: const CustomScreenLoader(
          height: double.infinity,
          width: double.infinity,
          backgroundColor: Colors.white,
        ),
      );
    }
    return UsersListPage(
      pageTitle: 'Following',
      userIdsList: userList,
      emptyScreenText:
          '${profile.nickName ?? profile.nickName} isn\'t follow anyone',
      emptyScreenSubTileText: 'When they do they\'ll be listed here.',
      onFollowPressed: (user) {
        context.read<FollowListState>().followUser(user);
      },
      isFollowing: (user) {
        return context.watch<FollowListState>().isFollowing(user);
      },
    );
  }
}
