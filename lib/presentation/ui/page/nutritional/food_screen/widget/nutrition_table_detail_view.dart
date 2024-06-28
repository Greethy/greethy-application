import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/nutrition/food_screen_state.dart';

class NutritionFoodTable extends StatelessWidget {
  final FoodScreenState state;

  NutritionFoodTable({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Table(
        children: List.generate(state.nutrients.length + 1, (rowIndex) {
          return TableRow(
            children: List.generate(3, (colIndex) {
              if (rowIndex == 0) {
                // Header row
                return Container(
                  height: 50,
                  color: Colors.grey[300],
                  child: Center(
                    child: state.nutrientsCells[0][colIndex],
                  ),
                );
              } else {
                // Content rows
                return Container(
                  height: 50,
                  child: Center(
                    child: state.nutrientsCells[rowIndex][colIndex],
                  ),
                );
              }
            }),
          );
        }),
      ),
    );
  }
}
