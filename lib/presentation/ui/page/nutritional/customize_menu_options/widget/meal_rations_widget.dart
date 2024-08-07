import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class MealRationsWidget extends StatefulWidget {
  MealRationsWidget({
    required this.meal,
    required this.initialRations,
  });

  final int? initialRations;
  final String meal;

  @override
  _MealRationsWidgetState createState() => _MealRationsWidgetState();
}

class _MealRationsWidgetState extends State<MealRationsWidget> {
  late int mealRations;
  bool showButtons = false;

  @override
  void initState() {
    super.initState();
    mealRations = widget.initialRations ?? 3;
  }

  void _updateRations(int value) {
    setState(() {
      mealRations = value;
      showButtons = false; // Hide buttons after selection
    });
  }

  void _toggleButtons() {
    setState(() {
      showButtons = !showButtons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleButtons,
          child: _buildInfoRow(widget.meal + " ", mealRations.toString()),
        ),
        if (showButtons)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _updateRations(3),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: GreethyColor.kawa_green,
                          // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          // Padding
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('3'),
                      ),
                    ),
                    SizedBox(width: 25,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _updateRations(4),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: GreethyColor.kawa_green,
                          // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          // Padding
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('4'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _updateRations(5),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: GreethyColor.kawa_green,
                          // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          // Padding
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('5'),
                      ),
                    ),
                    SizedBox(width: 25,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _updateRations(0),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: GreethyColor.kawa_green,
                          // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          // Padding
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Tự Động'),
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: GreethyColor.kawa_green.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: GreethyColor.kawa_green,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  '$label: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
