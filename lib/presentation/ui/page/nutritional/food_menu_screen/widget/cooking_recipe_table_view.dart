import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/food_screen_state.dart';

class IngredientsFoodTable extends StatelessWidget {
  final FoodScreenState state;

  IngredientsFoodTable({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Table(
        children: List.generate(state.ingredients.length + 1, (rowIndex) {
          return TableRow(
            children: List.generate(4, (colIndex) {
              if (rowIndex == 0) {
                // Header row
                return Container(
                  height: 70,
                  color: Colors.grey[300],
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Center(
                      child: state.ingredientsCells[0][colIndex],
                    ),
                  ),
                );
              } else {
                // Content rows
                return Container(
                  height: 50,
                  child: Center(
                    child: state.ingredientsCells[rowIndex][colIndex],
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
