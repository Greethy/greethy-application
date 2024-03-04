import 'package:flutter/material.dart';

import '../../../model/user_model/user.dart';
import '../../../widgets/customAppBar.dart';
import '../../../widgets/customWidgets.dart';
import '../../../widgets/newWidget/emptyList.dart';
import '../../theme/theme.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({
    Key? key,
    this.pageTitle = "",
    required this.emptyScreenText,
    required this.emptyScreenSubTileText,
    this.userIdsList,
    this.onFollowPressed,
    this.isFollowing,
  }) : super(key: key);

  final String pageTitle;
  final String emptyScreenText;
  final String emptyScreenSubTileText;
  final bool Function(UserModel user)? isFollowing;
  final List<String>? userIdsList;
  final Function(UserModel user)? onFollowPressed;

  @override
  Widget build(BuildContext context) {
    List<UserModel>? userList;
    return Scaffold(
      backgroundColor: GreethyColor.mystic,
      appBar: CustomAppBar(
        isBackButton: true,
        title: customTitleText(
          pageTitle,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
        child: NotifyText(
          title: emptyScreenText,
          subTitle: emptyScreenSubTileText,
        ),
      ),
      // Consumer<SearchState>(
      //   builder: (context, state, child) {
      //     if (userIdsList != null && userIdsList!.isNotEmpty) {
      //       userList = state.getuserDetail(userIdsList!);
      //     }
      //     return userList != null && userList!.isNotEmpty
      //         ? UserListWidget(
      //             list: userList!,
      //             emptyScreenText: emptyScreenText,
      //             emptyScreenSubTileText: emptyScreenSubTileText,
      //             onFollowPressed: onFollowPressed,
      //             isFollowing: isFollowing,
      //           )
      //         :
      //     Container(
      //   width: double.infinity,
      //   padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
      //   child: NotifyText(
      //     title: emptyScreenText,
      //     subTitle: emptyScreenSubTileText,
      //   ),
      // ),
    );
  }
}