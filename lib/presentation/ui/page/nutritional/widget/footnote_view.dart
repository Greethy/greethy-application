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
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh
            Center(
              child: Image.network(
                'https://scontent.fhan17-1.fna.fbcdn.net/v/t39.30808-6/405182058_122121285482086639_8326761993881129327_n.jpg?stp=dst-jpg_s960x960&_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGriacBYRWErUSk7c5-tqg3yecMmtofmEHJ5wya2h-YQdPNG8D3ATeywmWZ42YYCXAWLX8Zmki7r6SscghBEgvt&_nc_ohc=X-bAm-RAHvEQ7kNvgHNeUZh&_nc_ht=scontent.fhan17-1.fna&oh=00_AYDXOIwjh7k5SPa4C-3v1Z2q_Hg_3LoU4fEW2zFW6bL9wA&oe=6671CD58', // Thay thế bằng URL ảnh của bạn
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
