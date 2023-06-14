import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget _loadingWidget(double size) {
  return Center(
    child: LoadingAnimationWidget.hexagonDots(color: Colors.blue, size: size),
  );
}

Future _wait(seconds) async {
  return await Future.delayed(Duration(seconds: seconds));
}

class ResultPage extends StatelessWidget {
  int payment;
  int before_over_time_fee;
  int after_over_time_fee;
  int paid_holiday_fee;
  int all_payment;

  ResultPage(this.payment, this.before_over_time_fee, this.after_over_time_fee,
      this.paid_holiday_fee, this.all_payment);

  final yen_format = NumberFormat('#,###');
  double font_size = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('シミュレーション結果'),
      ),
      body: FutureBuilder(
          future: _wait(2),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _loadingWidget(100);
            } else {
              return Center(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columns: [
                            DataColumn(
                                label: Text(
                              '項目',
                              style: TextStyle(fontSize: font_size),
                            )),
                            DataColumn(
                                label: Text(
                              '金額',
                              style: TextStyle(fontSize: font_size),
                            )),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(Text(
                                  '支給額',
                                  style: TextStyle(fontSize: font_size),
                                )),
                                DataCell(Text(
                                  yen_format.format(payment) + '円',
                                  style: TextStyle(fontSize: font_size),
                                )),
                              ],
                              color:
                                  MaterialStateProperty.resolveWith((states) {
                                return Colors.blue[100];
                              }),
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text(
                                  '前残業代',
                                  style: TextStyle(fontSize: font_size),
                                )),
                                DataCell(Text(
                                  yen_format.format(before_over_time_fee) + '円',
                                  style: TextStyle(fontSize: font_size),
                                )),
                              ],
                              color:
                                  MaterialStateProperty.resolveWith((states) {
                                return Colors.blue[200];
                              }),
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text(
                                  '後残業代',
                                  style: TextStyle(fontSize: font_size),
                                )),
                                DataCell(Text(
                                  yen_format.format(after_over_time_fee) + '円',
                                  style: TextStyle(fontSize: font_size),
                                )),
                              ],
                              color:
                                  MaterialStateProperty.resolveWith((states) {
                                return Colors.blue[100];
                              }),
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text(
                                  '有給代',
                                  style: TextStyle(fontSize: font_size),
                                )),
                                DataCell(Text(
                                  yen_format.format(paid_holiday_fee) + '円',
                                  style: TextStyle(fontSize: font_size),
                                )),
                              ],
                              color:
                                  MaterialStateProperty.resolveWith((states) {
                                return Colors.blue[200];
                              }),
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text(
                                  '総支給額',
                                  style: TextStyle(fontSize: font_size),
                                )),
                                DataCell(Text(
                                  yen_format.format(all_payment) + '円',
                                  style: TextStyle(fontSize: font_size),
                                )),
                              ],
                              color:
                                  MaterialStateProperty.resolveWith((states) {
                                return Colors.blue[100];
                              }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: ElevatedButton(
                          child: const Text('戻る'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
