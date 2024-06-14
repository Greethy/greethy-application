import 'package:flutter/material.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/widget/dyamic_table.dart';

class CustomDividerMealView extends StatefulWidget {
  final double dividerHeight;
  final Color? color;
  final String text;
  final Meal? meal;

  const CustomDividerMealView({
    super.key,
    this.dividerHeight = 10.0,
    this.color,
    required this.text,
    this.meal,
  }) : assert(dividerHeight != 0.0);

  @override
  _CustomDividerMealViewState createState() => _CustomDividerMealViewState();
}

class _CustomDividerMealViewState extends State<CustomDividerMealView> {
  bool _click = false;

  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsetsDirectional.only(top: 16),
      child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    widget.text,
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
        _click
            ? Padding(
          padding: EdgeInsets.all(16.0),
          child: DynamicTable(
            columns: 3,
            rows: 5,
            cells: [
              [
                Text('CHỈ TIÊU', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('GIÁ TRỊ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('ĐƠN VỊ', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
              [
                Text('Năng lượng (calories)', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                Text(widget.meal!.calories.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Kcal', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
              [
                Text('Protein', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.meal!.protein.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                Text('g', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
              [
                Text('Lipid', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.meal!.lipid.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                Text('g', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
              [
                Text('Glucid', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.meal!.glucid.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                Text('g', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ],
          ),
        )
            : SizedBox.shrink(),
      ],
    ),);
  }
}
