import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/eating_menu_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class FoodView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final EatingMenuScreenState state;

  const FoodView({
    Key? key,
    this.animationController,
    this.animation,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppTheme.grey.withOpacity(0.2),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 2 / 5,
                          height: MediaQuery.of(context).size.width / 3,
                          child: Image.network(
                            'https://media.licdn.com/dms/image/D5603AQE94bklZfqiEQ/profile-displayphoto-shrink_800_800/0/1692931978549?e=1718841600&v=beta&t=KbMr4hpwt6gMHyG6lMYw4LCg5cYqeK6IeDkcNMmQ9cY',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 10, top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hủ Tiếu"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Icon(Icons.change_circle_outlined),
                                      Wrap(
                                        children: [Text("Công thức")],
                                      ),
                                      Wrap(
                                        children: [Text("món ăn")],
                                      ),
                                      Wrap(),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Icon(Icons.change_circle_outlined),
                                      Wrap(
                                        children: [Text("Thông tin")],
                                      ),
                                      Wrap(
                                        children: [Text("Dinh Dưỡng")],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
