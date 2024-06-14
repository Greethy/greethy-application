import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/food_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class CookingInstructionsFoodView extends StatefulWidget {
  final double dividerHeight;
  final Color? color;
  final FoodScreenState state;

  const CookingInstructionsFoodView({
    super.key,
    this.dividerHeight = 10.0,
    this.color,
    required this.state,
  }) : assert(dividerHeight != 0.0);

  @override
  _CookingInstructionsFoodViewState createState() => _CookingInstructionsFoodViewState();
}

class _CookingInstructionsFoodViewState extends State<CookingInstructionsFoodView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              // Table row 1 - Cách chế biến
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.cookie_outlined,
                  color: GreethyColor.kawa_green,
                ),
              ),
              Text(
                "Cách chế biến (được gợi ý bởi Greethy)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            widget.state.food?.recipe ?? "",
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                // Table row 1 - Cách chế biến
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.message_outlined,
                    color: GreethyColor.kawa_green
                  ),
                ),
                Text(
                  "Mẹo hay mách nhỏ:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.state.food?.tips ?? "",
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                // Table row 1 - Cách chế biến
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.info_outline,
                    color: GreethyColor.kawa_green
                  ),
                ),
                Text(
                  "Thông tin thêm:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
              widget.state.food?.moreInformation ?? "",
          ),
        ],
      ),
    );
  }
}
