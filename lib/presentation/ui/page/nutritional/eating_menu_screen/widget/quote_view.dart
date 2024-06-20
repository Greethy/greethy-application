import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class QuoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 25, 16, 16),
      child: Center(
        child: Column(
          children: [
            Text(
              'QUOTE OF THE DAY',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: GreethyColor.kawa_green,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: GreethyColor.kawa_green),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '“',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: GreethyColor.kawa_green,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Khi mang thai, hầu hết các mẹ bầu đều lo lắng về chế độ dinh dưỡng, bởi đó là yếu tố then chốt giúp mẹ và bé khoẻ mạnh. Hãy cùng Chương trình Dinh dưỡng Mẹ và Bé khám phá ngân hàng thực đơn dinh dưỡng cho mẹ bầu, đảm bảo cân bằng dưỡng chất, hỗ trợ sức khoẻ của mẹ và sự phát triển của bé yêu nhé.',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '“',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: GreethyColor.kawa_green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
