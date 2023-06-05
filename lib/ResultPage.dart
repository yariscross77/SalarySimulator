import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      appBar: AppBar(title: Text('結果')),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell((Text(
                        '支給額',
                        style: TextStyle(fontSize: font_size),
                      ))),
                      DataCell((Text(
                        yen_format.format(payment) + '円',
                        style: TextStyle(fontSize: font_size),
                      ))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell((Text(
                        '前残業代',
                        style: TextStyle(fontSize: font_size),
                      ))),
                      DataCell((Text(
                        yen_format.format(before_over_time_fee) + '円',
                        style: TextStyle(fontSize: font_size),
                      ))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell((Text(
                        '後残業代',
                        style: TextStyle(fontSize: font_size),
                      ))),
                      DataCell((Text(
                        yen_format.format(after_over_time_fee) + '円',
                        style: TextStyle(fontSize: font_size),
                      ))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell((Text(
                        '有給代',
                        style: TextStyle(fontSize: font_size),
                      ))),
                      DataCell((Text(
                        yen_format.format(paid_holiday_fee) + '円',
                        style: TextStyle(fontSize: font_size),
                      ))),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell((Text(
                        '総支給額',
                        style: TextStyle(fontSize: font_size),
                      ))),
                      DataCell((Text(
                        yen_format.format(all_payment) + '円',
                        style: TextStyle(fontSize: font_size),
                      ))),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: const Text('戻る'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
