import 'package:flutter/material.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/presentation/state/nutrition/eating_menu_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/widget/dyamic_table.dart';

class CustomDividerMealView extends StatefulWidget {
  final double dividerHeight;
  final Color? color;
  final String text;
  final Meal? meal;
  final EatingMenuScreenState? state;

  const CustomDividerMealView({
    super.key,
    this.dividerHeight = 40.0,
    this.color,
    required this.text,
    this.meal,
    this.state,
  }) : assert(dividerHeight != 0.0);

  @override
  _CustomDividerMealViewState createState() => _CustomDividerMealViewState();
}

class _CustomDividerMealViewState extends State<CustomDividerMealView> {
  bool _click = false;

  @override
  Widget build(BuildContext context) {
    bool isDone = !(widget.meal?.status == null || !widget.meal!.status!);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 16),
              child: Container(
                height: widget.dividerHeight,
                width: double.infinity,
                decoration: !isDone
                    ? BoxDecoration(
                        color: widget.color ?? GreethyColor.kawa_green,
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 1.0),
                          bottom: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      )
                    : BoxDecoration(
                        border: Border(
                          top: BorderSide(color: GreethyColor.mossGreen, width: 2.0),
                          bottom: BorderSide(color: GreethyColor.mossGreen, width: 2.0),
                        ),
                      ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        widget.text,
                        textAlign: TextAlign.center,
                        style: !isDone
                            ? TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                            : TextStyle(
                                fontWeight: FontWeight.bold,
                                color: GreethyColor.mossGreen,
                              ),
                      ),
                      InkWell(
                        child: SizedBox(
                          width: 30,
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            size: 25.0,
                            color: GreethyColor.pakistanGreen,
                          ),
                        ),
                        onTap: () {
                          print("press show");
                          setState(() {
                            _click = !_click;
                          });
                        },
                      ),
                    ],
                  ),
                ),
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
        ),
        Positioned(
          top: 5,
          left: 10,
          child: GestureDetector(
            onTap: () {
              isDone = !isDone;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isDone ? 'Rất tốt, tiếp tục cố gắng nhé!' : "Xem rằng bạn đã không tuân thủ menu ăn uống :( !!" ),
                  backgroundColor: GreethyColor.kawa_green,
                ),
              );
              setState(() {
                print(widget.text);
                 widget.state?.updateStatus(widget.text);
              });
            },
            child: Container(
              height: 25,
              width: 80,
              decoration: BoxDecoration(
                color: isDone ? GreethyColor.kawa_green : Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: isDone ? Colors.white : GreethyColor.kawa_green,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 1, 15, 1),
                child: Center(
                  child: Text(
                    isDone ? "Done" : "Eat",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isDone ? GreethyColor.white : GreethyColor.kawa_green,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
