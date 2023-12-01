import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  ExpandableText({required this.text, this.maxLines = 3});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: isExpanded
            ? Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black.withOpacity(0.7),
                ),
                child: FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            : FittedBox(
                child: Container(
                  width: isExpanded ? double.infinity : MediaQuery.of(context).size.width - 10,
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    maxLines: widget.maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
      ),
    );
  }
}
