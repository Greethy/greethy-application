import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  ExpandableText({required this.text, this.maxLines = 2});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black.withOpacity(0.7),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: FittedBox(
          child: Container(
            width: isExpanded ? double.infinity : 250,
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              maxLines: isExpanded ? null : widget.maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}