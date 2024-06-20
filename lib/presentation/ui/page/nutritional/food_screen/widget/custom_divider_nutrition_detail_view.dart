import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/nutrition/food_screen_state.dart';
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
            color: widget.color ?? GreethyColor.kawa_green,
            border: Border(
              top: BorderSide(color: Colors.grey, width: 1.0),
              bottom: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
          child: Center(
            child: Text(
              "THÔNG TIN DINH DƯỠNG CHI TIẾT",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
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
