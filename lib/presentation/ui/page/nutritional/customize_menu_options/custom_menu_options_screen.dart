import 'package:flutter/material.dart';

class CustomMenuOptionsScreen extends StatefulWidget {
  @override
  _CustomMenuOptionsScreenState createState() => _CustomMenuOptionsScreenState();
}

class _CustomMenuOptionsScreenState extends State<CustomMenuOptionsScreen> {
  // State variables for selected values
  String selectedCourse = '';
  String selectedLocation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kênh & Vai trò'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '2 lựa chọn Tùy chỉnh',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Duyệt các kênh (44)'),
              leading: Icon(Icons.tv),
              onTap: () {
                // Handle channel browsing logic here
              },
            ),
            SizedBox(height: 20),
            Text(
              'Câu hỏi Tùy chỉnh',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Hãy chọn khóa học mà bạn tham gia 2024:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: <Widget>[
                ChoiceChip(
                  label: Text('PM'),
                  selected: selectedCourse == 'PM',
                  onSelected: (selected) {
                    setState(() {
                      selectedCourse = selected ? 'PM' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('DA'),
                  selected: selectedCourse == 'DA',
                  onSelected: (selected) {
                    setState(() {
                      selectedCourse = selected ? 'DA' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('UX'),
                  selected: selectedCourse == 'UX',
                  onSelected: (selected) {
                    setState(() {
                      selectedCourse = selected ? 'UX' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('DM'),
                  selected: selectedCourse == 'DM',
                  onSelected: (selected) {
                    setState(() {
                      selectedCourse = selected ? 'DM' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('IT'),
                  selected: selectedCourse == 'IT',
                  onSelected: (selected) {
                    setState(() {
                      selectedCourse = selected ? 'IT' : '';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Bạn đang sinh sống và làm việc ở gần khu vực nào?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: <Widget>[
                ChoiceChip(
                  label: Text('Hà Nội'),
                  selected: selectedLocation == 'Hà Nội',
                  onSelected: (selected) {
                    setState(() {
                      selectedLocation = selected ? 'Hà Nội' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Đà Nẵng'),
                  selected: selectedLocation == 'Đà Nẵng',
                  onSelected: (selected) {
                    setState(() {
                      selectedLocation = selected ? 'Đà Nẵng' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Hồ Chí Minh'),
                  selected: selectedLocation == 'Hồ Chí Minh',
                  onSelected: (selected) {
                    setState(() {
                      selectedLocation = selected ? 'Hồ Chí Minh' : '';
                    });
                  },
                ),
                ChoiceChip(
                  label: Text('Khác'),
                  selected: selectedLocation == 'Khác',
                  onSelected: (selected) {
                    setState(() {
                      selectedLocation = selected ? 'Khác' : '';
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
