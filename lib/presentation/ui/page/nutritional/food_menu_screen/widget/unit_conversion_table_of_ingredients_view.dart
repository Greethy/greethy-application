import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/theme/theme.dart';

class UnitConversionTableOfIngredientsView extends StatefulWidget {
  final double dividerHeight;
  final Color? color;

  const UnitConversionTableOfIngredientsView({
    super.key,
    this.dividerHeight = 10.0,
    this.color,
  }) : assert(dividerHeight != 0.0);

  @override
  _UnitConversionTableOfIngredientsViewState createState() => _UnitConversionTableOfIngredientsViewState();
}

class _UnitConversionTableOfIngredientsViewState extends State<UnitConversionTableOfIngredientsView> {
  bool _click = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
          child: Container(
            height: widget.dividerHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.color ?? GreethyColor.mossGreen,
              border: Border(
                top: BorderSide(color: Colors.grey, width: 1.0),
                bottom: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 2, 25, 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bảng chuyển đổi đơn vị của nguyên liệu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              onTap: () {
                print("press late");
                setState(() {
                  _click = !_click;
                });
              },
            ),
          ),
        ),
        _click
            ? Padding(
                padding: EdgeInsets.all(16.0),
                child: buildTableWidget(
                  56,
                  4,
                  [
                    [
                      Text('STT', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                      Text('TÊN NGUYÊN LIỆU', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                      Text('KHỐI LƯỢNG CHUẨN', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                      Text('ĐƠN VỊ CHUYỂN ĐỔI', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ],
                    [
                      Text('1', textAlign: TextAlign.center),
                      Text('Bột canh', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('2', textAlign: TextAlign.center),
                      Text('Bột canh', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('12,5 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('3', textAlign: TextAlign.center),
                      Text('Bột ngọt', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('4', textAlign: TextAlign.center),
                      Text('Bột ngọt', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('12,5 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('5', textAlign: TextAlign.center),
                      Text('Dầu ăn dùng để chiên', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('50 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('6', textAlign: TextAlign.center),
                      Text('Dầu ăn dùng để chiên', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('7', textAlign: TextAlign.center),
                      Text('Dầu ăn thấm vào thực phẩm (*)', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('50 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('8', textAlign: TextAlign.center),
                      Text('Dầu ăn thấm vào thực phẩm (*)', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('9', textAlign: TextAlign.center),
                      Text('Dầu ăn/Dầu thực vật', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('50 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('10', textAlign: TextAlign.center),
                      Text('Dầu ăn/Dầu thực vật', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('11', textAlign: TextAlign.center),
                      Text('Dầu hào', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('33,3 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('12', textAlign: TextAlign.center),
                      Text('Dầu hào', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('16,7 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('13', textAlign: TextAlign.center),
                      Text('Đường cát', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('14', textAlign: TextAlign.center),
                      Text('Đường cát', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('12,5 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('15', textAlign: TextAlign.center),
                      Text('Đường kính', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('16', textAlign: TextAlign.center),
                      Text('Đường kính', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('12,5 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('17', textAlign: TextAlign.center),
                      Text('Gia vị nêm sẵn Bột tẩm khô chiên giòn', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('50 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('18', textAlign: TextAlign.center),
                      Text('Gia vị nêm sẵn Bột tẩm khô chiên giòn', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('19', textAlign: TextAlign.center),
                      Text('Gia vị nêm sẵn Phở Bò', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('50 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('20', textAlign: TextAlign.center),
                      Text('Gia vị nêm sẵn Phở Bò', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('21', textAlign: TextAlign.center),
                      Text('Giấm gạo lên men', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('33,3 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('22', textAlign: TextAlign.center),
                      Text('Giấm gạo lên men', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('16,7 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('23', textAlign: TextAlign.center),
                      Text('Hạt nêm', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('33,3 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('24', textAlign: TextAlign.center),
                      Text('Hạt nêm', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('16,7 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('25', textAlign: TextAlign.center),
                      Text('Muối', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('16,7 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('26', textAlign: TextAlign.center),
                      Text('Muối', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('8,3 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('27', textAlign: TextAlign.center),
                      Text('Muối i-ốt', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('16,7 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('28', textAlign: TextAlign.center),
                      Text('Muối i-ốt', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('8,3 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('29', textAlign: TextAlign.center),
                      Text('Nước lọc', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('100 ml', textAlign: TextAlign.center),
                    ],
                    [
                      Text('30', textAlign: TextAlign.center),
                      Text('Nước mắm', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('33,3 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('31', textAlign: TextAlign.center),
                      Text('Nước mắm', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('16,7 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('32', textAlign: TextAlign.center),
                      Text('Nước mắm cá (loại đặc biệt)', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('33,3 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('33', textAlign: TextAlign.center),
                      Text('Nước mắm cá (loại đặc biệt)', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('16,7 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('34', textAlign: TextAlign.center),
                      Text('Nước mắm cá loại 1', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('33,3 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('35', textAlign: TextAlign.center),
                      Text('Nước mắm cá loại 1', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('16,7 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('36', textAlign: TextAlign.center),
                      Text('Nước mắm cô đặc', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('33,3 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('37', textAlign: TextAlign.center),
                      Text('Nước mắm cô đặc', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('16,7 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('38', textAlign: TextAlign.center),
                      Text('Nước mắm loại 2', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('33,3 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('39', textAlign: TextAlign.center),
                      Text('Nước mắm loại 2', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('16,7 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('40', textAlign: TextAlign.center),
                      Text('Nước tương', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('50 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('41', textAlign: TextAlign.center),
                      Text('Nước tương', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('42', textAlign: TextAlign.center),
                      Text('Nước tương Hương vị Nhật Bản', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('50 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('43', textAlign: TextAlign.center),
                      Text('Nước tương Hương vị Nhật Bản', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('44', textAlign: TextAlign.center),
                      Text('Trứng chim cút', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('10 quả', textAlign: TextAlign.center),
                    ],
                    [
                      Text('45', textAlign: TextAlign.center),
                      Text('Trứng gà công nghiệp', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('2 quả', textAlign: TextAlign.center),
                    ],
                    [
                      Text('46', textAlign: TextAlign.center),
                      Text('Trứng gà ta', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('3,3 quả', textAlign: TextAlign.center),
                    ],
                    [
                      Text('47', textAlign: TextAlign.center),
                      Text('Trứng ngỗng', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('1,7 quả', textAlign: TextAlign.center),
                    ],
                    [
                      Text('48', textAlign: TextAlign.center),
                      Text('Tương cà', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('49', textAlign: TextAlign.center),
                      Text('Tương cà', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('12,5 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('50', textAlign: TextAlign.center),
                      Text('Tương ớt', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('51', textAlign: TextAlign.center),
                      Text('Tương ớt', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('12,5 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('52', textAlign: TextAlign.center),
                      Text('Xốt Mayonnaise', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('53', textAlign: TextAlign.center),
                      Text('Xốt Mayonnaise', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('12,5 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                    [
                      Text('54', textAlign: TextAlign.center),
                      Text('Xốt Mayonnaise Ngọt dịu', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('25 thìa / muỗng cà phê', textAlign: TextAlign.center),
                    ],
                    [
                      Text('55', textAlign: TextAlign.center),
                      Text('Xốt Mayonnaise Ngọt dịu', textAlign: TextAlign.center),
                      Text('100g', textAlign: TextAlign.center),
                      Text('12,5 thìa / muỗng canh', textAlign: TextAlign.center),
                    ],
                  ],
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }

  List<TableRow> buildTable(int rows, int columns, List<List<Widget>> cells) {
    return List.generate(rows, (rowIndex) {
      return TableRow(
        children: List.generate(columns, (colIndex) {
          if (rowIndex == 0) {
            // Header row
            return Container(
              height: 70,
              color: Colors.grey[300],
              child: Center(
                child: cells[0][colIndex],
              ),
            );
          } else {
            // Content rows
            return Container(
              height: 60,
              child: Center(
                child: cells[rowIndex][colIndex],
              ),
            );
          }
        }),
      );
    });
  }

  Widget buildTableWidget(int rows, int columns, List<List<Widget>> cells) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(50),
        },
        children: buildTable(rows, columns, cells),
      ),
    );
  }
}
