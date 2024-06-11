import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/food_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class CustomDividerNutritionDetailView extends StatefulWidget {
  final double dividerHeight;
  final Color? color;
  final FoodScreenState state;

  const CustomDividerNutritionDetailView({
    super.key,
    this.dividerHeight = 10.0,
    this.color,
    required this.state,
  }) : assert(dividerHeight != 0.0);

  @override
  _CustomDividerNutritionDetailViewState createState() => _CustomDividerNutritionDetailViewState();
}

class _CustomDividerNutritionDetailViewState extends State<CustomDividerNutritionDetailView> {
  bool _click = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: widget.dividerHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.color ?? GreethyColor.mossGreen,
            border: Border(
              top: BorderSide(color: Colors.grey, width: 1.0),
              bottom: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "THÔNG TIN DINH DƯỠNG CHI TIẾT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_circle,
                    size: 25.0,
                    color: GreethyColor.pakistanGreen,
                  ),
                ],
              ),
            ),
            onTap: () {
              print("press late");
              setState(() {
                _click = !_click;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Các thông tin dưỡng của món ăn đã được phê duyệt bởi Viện Dinh dưỡng Quốc gia",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
