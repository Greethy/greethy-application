import 'package:flutter/material.dart';

import 'package:greethy_application/presentation/theme/theme.dart';

class OptionChangeFood extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final VoidCallback? onTap;

  const OptionChangeFood({
    Key? key,
    this.titleTxt = "a",
    this.subTxt = "b",
    this.animationController,
    this.animation,
    this.onTap,
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
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          titleTxt,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                            color: AppTheme.lightText,
                          ),
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          onTap: onTap,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  subTxt,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                    color: AppTheme.nearlyDarkBlue,
                                  ),
                                ),
                                SizedBox(
                                  height: 38,
                                  width: 26,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: AppTheme.darkText,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     Expanded(
                    //       child: Text(
                    //         titleTxt,
                    //         textAlign: TextAlign.left,
                    //         style: TextStyle(
                    //           fontFamily: AppTheme.fontName,
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 18,
                    //           letterSpacing: 0.5,
                    //           color: AppTheme.lightText,
                    //         ),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       highlightColor: Colors.transparent,
                    //       borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    //       onTap: onTap,
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 8),
                    //         child: Row(
                    //           children: <Widget>[
                    //             Text(
                    //               subTxt,
                    //               textAlign: TextAlign.left,
                    //               style: TextStyle(
                    //                 fontFamily: AppTheme.fontName,
                    //                 fontWeight: FontWeight.normal,
                    //                 fontSize: 16,
                    //                 letterSpacing: 0.5,
                    //                 color: AppTheme.nearlyDarkBlue,
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               height: 38,
                    //               width: 26,
                    //               child: Icon(
                    //                 Icons.arrow_forward,
                    //                 color: AppTheme.darkText,
                    //                 size: 18,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Column(
                    //   children: [
                    //     Expanded(
                    //       child: Text(
                    //         titleTxt,
                    //         textAlign: TextAlign.left,
                    //         style: TextStyle(
                    //           fontFamily: AppTheme.fontName,
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 18,
                    //           letterSpacing: 0.5,
                    //           color: AppTheme.lightText,
                    //         ),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       highlightColor: Colors.transparent,
                    //       borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    //       onTap: onTap,
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 8),
                    //         child: Row(
                    //           children: <Widget>[
                    //             Text(
                    //               subTxt,
                    //               textAlign: TextAlign.left,
                    //               style: TextStyle(
                    //                 fontFamily: AppTheme.fontName,
                    //                 fontWeight: FontWeight.normal,
                    //                 fontSize: 16,
                    //                 letterSpacing: 0.5,
                    //                 color: AppTheme.nearlyDarkBlue,
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               height: 38,
                    //               width: 26,
                    //               child: Icon(
                    //                 Icons.arrow_forward,
                    //                 color: AppTheme.darkText,
                    //                 size: 18,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
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
