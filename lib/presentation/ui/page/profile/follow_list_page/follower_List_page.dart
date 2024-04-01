
import 'package:flutter/material.dart';
import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/newWidget/customLoader.dart';
import '../../common/usersListPage.dart';
import 'follow_List_state.dart';

class FollowerListPage extends StatelessWidget {
  const FollowerListPage({Key? key, this.userList, this.profile})
      : super(key: key);
  final List<String>? userList;
  final User? profile;

  static MaterialPageRoute getRoute(
      {required List<String> userList, required User profile}) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (_) => FollowListState(StateType.follower),
          child: FollowerListPage(userList: userList, profile: profile),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<FollowListState>().isbusy) {
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
      pageTitle: 'Followers',
      userIdsList: userList,
      emptyScreenText: '${profile?.nickName} doesn\'t have any followers',
      emptyScreenSubTileText:
          'When someone follow them, they\'ll be listed here.',
      isFollowing: (user) {
        return context.watch<FollowListState>().isFollowing(user);
      },
      onFollowPressed: (user) {
        context.read<FollowListState>().followUser(user);
      },
    );
  }
}
