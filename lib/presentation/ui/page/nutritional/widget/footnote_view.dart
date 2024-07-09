import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class FootnoteView extends StatefulWidget {
  @override
  _FootnoteViewState createState() => _FootnoteViewState();
}

class _FootnoteViewState extends State<FootnoteView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh
            Center(
              child: Image.asset(
                'assets/images/background.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Thông tin liên hệ
            Text(
              'PHẦN MỀM TẠO THỰC ĐƠN CÂN BẰNG DINH DƯỠNG & XÂY DỰNG LỐI SỐNG HEALTHY',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: GreethyColor.kawa_green,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Vui lòng liên hệ để được hướng dẫn khi cần:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: 088.654.9689',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Email: greethy.project@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Bạn có thể nhận được nhiều thông tin hữu ích liên quan đến sức khỏe dinh dưỡng thông qua các kênh hỗ trợ của Chương trình dưới đây:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Các kênh hỗ trợ
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Color(0xFF1877F2),
                  ),
                  onPressed: () {
                    // Thêm hành động cho icon Facebook
                  },
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Color(0xFFFF0000),
                  ),
                  onPressed: () {
                    // Thêm hành động cho icon YouTube
                  },
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Color(0xFF0A66C2),
                  ),
                  onPressed: () {
                    // Thêm hành động cho icon Zalo
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
