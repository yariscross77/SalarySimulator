import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ResultPage.dart';

class SimulatorPage extends StatefulWidget {
  const SimulatorPage({Key? key}) : super(key: key);

  State<SimulatorPage> createState() => _SimulatorPage();
}

class _SimulatorPage extends State<SimulatorPage> {
  String work_time = '0';
  String work_time2 = '0';
  String work_time3 = '0';
  int work_count = 0;
  int work_count2 = 0;
  int work_count3 = 0;
  int paid_holiday_count = -1;

  double padding_bottom = 30;

  final formkey = GlobalKey<FormState>();

  final TextEditingController _fix = TextEditingController();
  final TextEditingController _before_over_time = TextEditingController();
  final TextEditingController _after_over_time = TextEditingController();

  bool isAddTime2 = false;
  bool isAddTime3 = false;

  void dispose() {
    _fix.dispose();
    _before_over_time.dispose();
    _after_over_time.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アルバイト給与シミュレーターアプリ'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                // 時給を入力するテキストボックス
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, padding_bottom),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: '時給',
                      hintText: '時給を入力してください。',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return '時給が入力されていません。';
                      }
                      return null;
                    },
                    controller: _fix,
                  ),
                ),

                // 勤務時間を選択するコンボボックス（1つ目）
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        child: Text('勤務時間を選択してください。'),
                        value: '0',
                      ),
                      DropdownMenuItem(
                        child: Text('1時間'),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text('1時間30分'),
                        value: '1.5',
                      ),
                      DropdownMenuItem(
                        child: Text('2時間'),
                        value: '2',
                      ),
                      DropdownMenuItem(
                        child: Text('2時間30分'),
                        value: '2.5',
                      ),
                      DropdownMenuItem(
                        child: Text('3時間'),
                        value: '3',
                      ),
                      DropdownMenuItem(
                        child: Text('3時間30分'),
                        value: '3.5',
                      ),
                      DropdownMenuItem(
                        child: Text('4時間'),
                        value: '4',
                      ),
                      DropdownMenuItem(
                        child: Text('4時間30分'),
                        value: '4.5',
                      ),
                      DropdownMenuItem(
                        child: Text('5時間'),
                        value: '5',
                      ),
                      DropdownMenuItem(
                        child: Text('5時間30分'),
                        value: '5.5',
                      ),
                      DropdownMenuItem(
                        child: Text('6時間'),
                        value: '6',
                      ),
                      DropdownMenuItem(
                        child: Text('6時間30分'),
                        value: '6.5',
                      ),
                      DropdownMenuItem(
                        child: Text('7時間'),
                        value: '7',
                      ),
                      DropdownMenuItem(
                        child: Text('7時間30分'),
                        value: '7.5',
                      ),
                      DropdownMenuItem(
                        child: Text('8時間'),
                        value: '8',
                      ),
                    ],
                    value: work_time,
                    validator: (String? value) {
                      if (value == '0') {
                        return '勤務時間が選択されていません。';
                      }
                      return null;
                    },
                    onChanged: (String? value) {
                      setState(() {
                        work_time = value!;
                      });
                    },
                  ),
                ),

                // 勤務回数を選択するコンボボックス（1つ目）
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, padding_bottom),
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(
                          child: Text('勤務回数を選択してください。'),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text('1回'),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('2回'),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text('3回'),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text('4回'),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Text('5回'),
                          value: 5,
                        ),
                        DropdownMenuItem(
                          child: Text('6回'),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: Text('7回'),
                          value: 7,
                        ),
                        DropdownMenuItem(
                          child: Text('8回'),
                          value: 8,
                        ),
                        DropdownMenuItem(
                          child: Text('9回'),
                          value: 9,
                        ),
                        DropdownMenuItem(
                          child: Text('10回'),
                          value: 10,
                        ),
                        DropdownMenuItem(
                          child: Text('11回'),
                          value: 11,
                        ),
                        DropdownMenuItem(
                          child: Text('12回'),
                          value: 12,
                        ),
                        DropdownMenuItem(
                          child: Text('13回'),
                          value: 13,
                        ),
                        DropdownMenuItem(
                          child: Text('14回'),
                          value: 14,
                        ),
                        DropdownMenuItem(
                          child: Text('15回'),
                          value: 15,
                        ),
                        DropdownMenuItem(
                          child: Text('16回'),
                          value: 16,
                        ),
                        DropdownMenuItem(
                          child: Text('17回'),
                          value: 17,
                        ),
                        DropdownMenuItem(
                          child: Text('18回'),
                          value: 18,
                        ),
                        DropdownMenuItem(
                          child: Text('19回'),
                          value: 19,
                        ),
                        DropdownMenuItem(
                          child: Text('20回'),
                          value: 20,
                        ),
                        DropdownMenuItem(
                          child: Text('21回'),
                          value: 21,
                        ),
                        DropdownMenuItem(
                          child: Text('22回'),
                          value: 22,
                        ),
                        DropdownMenuItem(
                          child: Text('23回'),
                          value: 23,
                        ),
                        DropdownMenuItem(
                          child: Text('24回'),
                          value: 24,
                        ),
                        DropdownMenuItem(
                          child: Text('25回'),
                          value: 25,
                        ),
                      ],
                      value: work_count,
                      validator: (int? value) {
                        if (value == 0) {
                          return '勤務回数が選択されていません。';
                        }
                        return null;
                      },
                      onChanged: (int? value) {
                        setState(() {
                          work_count = value!;
                        });
                      },
                    ),
                  ),
                ),

                // 勤務時間を選択するコンボボックス（2つ目）
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        child: Text('勤務時間を選択してください。'),
                        value: '0',
                      ),
                      DropdownMenuItem(
                        child: Text('1時間'),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text('1時間30分'),
                        value: '1.5',
                      ),
                      DropdownMenuItem(
                        child: Text('2時間'),
                        value: '2',
                      ),
                      DropdownMenuItem(
                        child: Text('2時間30分'),
                        value: '2.5',
                      ),
                      DropdownMenuItem(
                        child: Text('3時間'),
                        value: '3',
                      ),
                      DropdownMenuItem(
                        child: Text('3時間30分'),
                        value: '3.5',
                      ),
                      DropdownMenuItem(
                        child: Text('4時間'),
                        value: '4',
                      ),
                      DropdownMenuItem(
                        child: Text('4時間30分'),
                        value: '4.5',
                      ),
                      DropdownMenuItem(
                        child: Text('5時間'),
                        value: '5',
                      ),
                      DropdownMenuItem(
                        child: Text('5時間30分'),
                        value: '5.5',
                      ),
                      DropdownMenuItem(
                        child: Text('6時間'),
                        value: '6',
                      ),
                      DropdownMenuItem(
                        child: Text('6時間30分'),
                        value: '6.5',
                      ),
                      DropdownMenuItem(
                        child: Text('7時間'),
                        value: '7',
                      ),
                      DropdownMenuItem(
                        child: Text('7時間30分'),
                        value: '7.5',
                      ),
                      DropdownMenuItem(
                        child: Text('8時間'),
                        value: '8',
                      ),
                    ],
                    value: work_time2,
                    validator: isAddTime2
                        ? (String? value) {
                            if (value == '0') {
                              return '勤務時間が選択されていません。';
                            }
                            return null;
                          }
                        : (String? value) {
                            return null;
                          },
                    onChanged: isAddTime2
                        ? (String? value) {
                            setState(() {
                              work_time2 = value!;
                            });
                          }
                        : null,
                  ),
                ),

                // 勤務回数を選択するコンボボックス（2つ目）
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        child: Text('勤務回数を選択してください。'),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('1回'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('2回'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('3回'),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text('4回'),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text('5回'),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text('6回'),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text('7回'),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text('8回'),
                        value: 8,
                      ),
                      DropdownMenuItem(
                        child: Text('9回'),
                        value: 9,
                      ),
                      DropdownMenuItem(
                        child: Text('10回'),
                        value: 10,
                      ),
                      DropdownMenuItem(
                        child: Text('11回'),
                        value: 11,
                      ),
                      DropdownMenuItem(
                        child: Text('12回'),
                        value: 12,
                      ),
                      DropdownMenuItem(
                        child: Text('13回'),
                        value: 13,
                      ),
                      DropdownMenuItem(
                        child: Text('14回'),
                        value: 14,
                      ),
                      DropdownMenuItem(
                        child: Text('15回'),
                        value: 15,
                      ),
                      DropdownMenuItem(
                        child: Text('16回'),
                        value: 16,
                      ),
                      DropdownMenuItem(
                        child: Text('17回'),
                        value: 17,
                      ),
                      DropdownMenuItem(
                        child: Text('18回'),
                        value: 18,
                      ),
                      DropdownMenuItem(
                        child: Text('19回'),
                        value: 19,
                      ),
                      DropdownMenuItem(
                        child: Text('20回'),
                        value: 20,
                      ),
                      DropdownMenuItem(
                        child: Text('21回'),
                        value: 21,
                      ),
                      DropdownMenuItem(
                        child: Text('22回'),
                        value: 22,
                      ),
                      DropdownMenuItem(
                        child: Text('23回'),
                        value: 23,
                      ),
                      DropdownMenuItem(
                        child: Text('24回'),
                        value: 24,
                      ),
                      DropdownMenuItem(
                        child: Text('25回'),
                        value: 25,
                      ),
                    ],
                    value: work_count2,
                    validator: isAddTime2
                        ? (int? value) {
                            if (value == 0) {
                              return '勤務回数が選択されていません。';
                            }
                            return null;
                          }
                        : (int? value) {
                            return null;
                          },
                    onChanged: isAddTime2
                        ? (int? value) {
                            setState(() {
                              work_count2 = value!;
                            });
                          }
                        : null,
                  ),
                ),

                // 2つ目の時間帯を追加するスイッチ
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, padding_bottom),
                  child: SwitchListTile(
                    secondary: Icon(Icons.add),
                    title: Text('時間帯を追加'),
                    value: isAddTime2,
                    onChanged: (bool value) {
                      setState(() {
                        isAddTime2 = value;
                      });
                    },
                  ),
                ),

                // 勤務時間を選択するコンボボックス（3つ目）
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        child: Text('勤務時間を選択してください。'),
                        value: '0',
                      ),
                      DropdownMenuItem(
                        child: Text('1時間'),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text('1時間30分'),
                        value: '1.5',
                      ),
                      DropdownMenuItem(
                        child: Text('2時間'),
                        value: '2',
                      ),
                      DropdownMenuItem(
                        child: Text('2時間30分'),
                        value: '2.5',
                      ),
                      DropdownMenuItem(
                        child: Text('3時間'),
                        value: '3',
                      ),
                      DropdownMenuItem(
                        child: Text('3時間30分'),
                        value: '3.5',
                      ),
                      DropdownMenuItem(
                        child: Text('4時間'),
                        value: '4',
                      ),
                      DropdownMenuItem(
                        child: Text('4時間30分'),
                        value: '4.5',
                      ),
                      DropdownMenuItem(
                        child: Text('5時間'),
                        value: '5',
                      ),
                      DropdownMenuItem(
                        child: Text('5時間30分'),
                        value: '5.5',
                      ),
                      DropdownMenuItem(
                        child: Text('6時間'),
                        value: '6',
                      ),
                      DropdownMenuItem(
                        child: Text('6時間30分'),
                        value: '6.5',
                      ),
                      DropdownMenuItem(
                        child: Text('7時間'),
                        value: '7',
                      ),
                      DropdownMenuItem(
                        child: Text('7時間30分'),
                        value: '7.5',
                      ),
                      DropdownMenuItem(
                        child: Text('8時間'),
                        value: '8',
                      ),
                    ],
                    value: work_time3,
                    validator: isAddTime3
                        ? (String? value) {
                            if (value == '0') {
                              return '勤務時間が選択されていません。';
                            }
                            return null;
                          }
                        : (String? value) {
                            return null;
                          },
                    onChanged: isAddTime3
                        ? (String? value) {
                            setState(() {
                              work_time3 = value!;
                            });
                          }
                        : null,
                  ),
                ),

                // 勤務回数を選択するコンボボックス（3つ目）
                SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        child: Text('勤務回数を選択してください。'),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('1回'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('2回'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('3回'),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text('4回'),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text('5回'),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text('6回'),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text('7回'),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text('8回'),
                        value: 8,
                      ),
                      DropdownMenuItem(
                        child: Text('9回'),
                        value: 9,
                      ),
                      DropdownMenuItem(
                        child: Text('10回'),
                        value: 10,
                      ),
                      DropdownMenuItem(
                        child: Text('11回'),
                        value: 11,
                      ),
                      DropdownMenuItem(
                        child: Text('12回'),
                        value: 12,
                      ),
                      DropdownMenuItem(
                        child: Text('13回'),
                        value: 13,
                      ),
                      DropdownMenuItem(
                        child: Text('14回'),
                        value: 14,
                      ),
                      DropdownMenuItem(
                        child: Text('15回'),
                        value: 15,
                      ),
                      DropdownMenuItem(
                        child: Text('16回'),
                        value: 16,
                      ),
                      DropdownMenuItem(
                        child: Text('17回'),
                        value: 17,
                      ),
                      DropdownMenuItem(
                        child: Text('18回'),
                        value: 18,
                      ),
                      DropdownMenuItem(
                        child: Text('19回'),
                        value: 19,
                      ),
                      DropdownMenuItem(
                        child: Text('20回'),
                        value: 20,
                      ),
                      DropdownMenuItem(
                        child: Text('21回'),
                        value: 21,
                      ),
                      DropdownMenuItem(
                        child: Text('22回'),
                        value: 22,
                      ),
                      DropdownMenuItem(
                        child: Text('23回'),
                        value: 23,
                      ),
                      DropdownMenuItem(
                        child: Text('24回'),
                        value: 24,
                      ),
                      DropdownMenuItem(
                        child: Text('25回'),
                        value: 25,
                      ),
                    ],
                    value: work_count3,
                    validator: isAddTime3
                        ? (int? value) {
                            if (value == 0) {
                              return '勤務回数が選択されていません。';
                            }
                            return null;
                          }
                        : (int? value) {
                            return null;
                          },
                    onChanged: isAddTime3
                        ? (int? value) {
                            setState(() {
                              work_count3 = value!;
                            });
                          }
                        : null,
                  ),
                ),

                // 3つ目の時間帯を追加するスイッチ
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, padding_bottom),
                  child: SwitchListTile(
                    secondary: Icon(Icons.add),
                    title: Text('時間帯を追加'),
                    value: isAddTime3,
                    onChanged: (bool value) {
                      setState(() {
                        isAddTime3 = value;
                      });
                    },
                  ),
                ),

                // 前残業時間を入力するテキストボックス
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, padding_bottom),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.punch_clock),
                      labelText: '前残業時間（分）',
                      hintText: '前残業時間を入力してください。単位：分',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '前残業時間が入力されていません。';
                      }
                      return null;
                    },
                    controller: _before_over_time,
                  ),
                ),

                // 後残業時間を入力するテキストボックス
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, padding_bottom),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.punch_clock),
                      labelText: '後残業時間（分）',
                      hintText: '後残業時間を入力してください。単位：分',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '後残業時間が入力されていません。';
                      }
                      return null;
                    },
                    controller: _after_over_time,
                  ),
                ),

                // 有給回数を選択するコンボボックス
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, padding_bottom),
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(
                          child: Text('有給回数を選択してください。'),
                          value: -1,
                        ),
                        DropdownMenuItem(
                          child: Text('なし'),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text('1回'),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('2回'),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text('3回'),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text('4回'),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Text('5回'),
                          value: 5,
                        ),
                        DropdownMenuItem(
                          child: Text('6回'),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: Text('7回'),
                          value: 7,
                        ),
                        DropdownMenuItem(
                          child: Text('8回'),
                          value: 8,
                        ),
                        DropdownMenuItem(
                          child: Text('9回'),
                          value: 9,
                        ),
                        DropdownMenuItem(
                          child: Text('10回'),
                          value: 10,
                        ),
                      ],
                      value: paid_holiday_count,
                      validator: (value) {
                        if (value == -1) {
                          return '有給回数が選択されていません。';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          paid_holiday_count = value!;
                        });
                      },
                    ),
                  ),
                ),

                // 「計算する」ボタンが押された時の処理
                ElevatedButton(
                  child: const Text('計算する'),
                  onPressed: () {
                    if (!formkey.currentState!.validate()) {
                      return;
                    }
                    int fix = int.parse(_fix.text);

                    int sum =
                        (fix * double.parse(work_time) * work_count).ceil();
                    int sum2 = 0;
                    if (isAddTime2) {
                      sum2 =
                          (fix * double.parse(work_time2) * work_count2).ceil();
                    } else {
                      sum2 = 0;
                    }
                    int sum3 = 0;
                    if (isAddTime3) {
                      sum3 =
                          (fix * double.parse(work_time3) * work_count3).ceil();
                    } else {
                      sum3 = 0;
                    }

                    // 支給額を求める計算式
                    int payment = sum + sum2 + sum3;

                    // 1分あたりの残業代を求める計算式
                    double min_fee = fix / 60;

                    // 前残業代を求める計算式
                    int before_over_time = int.parse(_before_over_time.text);
                    int before_over_time_fee = 0;

                    if (before_over_time % 15 == 0) {
                      before_over_time_fee =
                          (double.parse(min_fee.toStringAsFixed(3)) *
                                  before_over_time)
                              .ceil();
                    } else {
                      before_over_time_fee =
                          (double.parse(min_fee.toStringAsFixed(3)) *
                                  (before_over_time - (before_over_time % 15)))
                              .ceil();
                    }

                    // 後残業代を求める計算式
                    int after_over_time = int.parse(_after_over_time.text);

                    int after_over_time_fee =
                        (double.parse(min_fee.toStringAsFixed(3)) *
                                after_over_time)
                            .ceil();

                    // 有給代を求める計算式
                    int paid_holiday_fee =
                        (fix * double.parse(work_time) * paid_holiday_count)
                            .ceil();

                    // 総支給額を求める計算式
                    int all_payment = payment +
                        before_over_time_fee +
                        after_over_time_fee +
                        paid_holiday_fee;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                            payment,
                            before_over_time_fee,
                            after_over_time_fee,
                            paid_holiday_fee,
                            all_payment),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
