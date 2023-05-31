import 'package:flutter/material.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SimulatorPage(),
    );
  }
}

class SimulatorPage extends StatefulWidget {
  const SimulatorPage({Key? key}) : super(key: key);

  State<SimulatorPage> createState() => _SimulatorPage();
}

String work_time = '0';
String work_time2 = '0';
String work_time3 = '0';
int work_count = 0;
int work_count2 = 0;
int work_count3 = 0;
int yukyu_count = -1;
int fix = 0;
int before_time = 0;
int after_time = 0;
double before_time_fee = 0;
double after_time_fee = 0;

class _SimulatorPage extends State<SimulatorPage> {
  bool time_add_flag = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アルバイト給与シミュレーターアプリ'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '時給を入力してください。',
              ),
              onChanged: (value) {
                fix = int.parse(value);
              },
            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButton(
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
                onChanged: (value) {
                  setState(() {
                    work_time = value!;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButton(
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
                onChanged: (value) {
                  setState(() {
                    work_count = value!;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButton(
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
                onChanged: (value) {
                  setState(() {
                    work_time2 = value!;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButton(
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
                onChanged: (value) {
                  setState(() {
                    work_count2 = value!;
                  });
                },
              ),
            ),
            SwitchListTile(
              secondary: Icon(Icons.add),
              title: Text('時間帯を追加'),
              value: time_add_flag,
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() {
                    time_add_flag = value;
                    if (time_add_flag) {
                      print('ON');
                    } else {
                      print('OFF');
                    }
                  });
                }
              },
            ),

            /*
            Row(
              children: <Widget>[
                DropdownButton(
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
                  onChanged: (value) {
                    setState(() {
                      work_time2 = value!;
                    });
                  },
                ),
                DropdownButton(
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
                  onChanged: (value) {
                    setState(() {
                      work_count2 = value!;
                    });
                  },
                ),
                Switch(
                  value: isBeforeTime,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        isBeforeTime = value;
                        if (isBeforeTime) {
                          print('ON');
                        } else {
                          print('OFF');
                        }
                      });
                    }
                  },
                ),
              ],
            ),*/

            SizedBox(
              width: double.infinity,
              child: DropdownButton(
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
                onChanged: (value) {
                  setState(() {
                    work_time3 = value!;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButton(
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
                onChanged: (value) {
                  setState(() {
                    work_count3 = value!;
                  });
                },
              ),
            ),
            /*
            Row(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
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
                    onChanged: (value) {
                      setState(() {
                        work_time2 = value!;
                      });
                    },
                  ),
                ),
                Switch(
                    value: isBeforeTime,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          if (isBeforeTime) {
                            print(isBeforeTime);
                          } else {
                            print(isBeforeTime);
                          }
                        });
                      }
                    }),
              ],
            ),*/
            TextField(
              decoration: InputDecoration(
                hintText: '前残業時間を入力してください。単位：分',
              ),
              onChanged: (value) {
                before_time = int.parse(value);
                double min_fee = fix / 60;

                if (before_time % 15 == 0) {
                  before_time_fee =
                      double.parse(min_fee.toStringAsFixed(3)) * before_time;
                } else {
                  before_time_fee = double.parse(min_fee.toStringAsFixed(3)) *
                      (before_time - (before_time % 15));
                }
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '後残業時間を入力してください。単位：分',
              ),
              onChanged: (value) {
                after_time = int.parse(value);

                double min_fee = fix / 60;
                after_time_fee =
                    double.parse(min_fee.toStringAsFixed(3)) * after_time;
              },
            ),
            SizedBox(
              width: double.infinity,
              child: DropdownButton(
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
                onChanged: (value) {
                  setState(() {
                    yukyu_count = value!;
                  });
                },
                value: yukyu_count,
              ),
            ),
            TextButton(
              child: Text('計算する'),
              onPressed: () {
                /*
                if (work_time == 0 || work_count == 0 || yukyu_count == -1) {
                  return;
                }*/

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ResultPage();
                  }),
                );

                /*
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // （2） 実際に表示するページ(ウィジェット)を指定する
                        builder: (context) => result()));*/

                print((fix * double.parse(work_time) * work_count) +
                    (fix * double.parse(work_time2) * work_count2) +
                    (fix * double.parse(work_time3) * work_count3));
                print('前' + before_time_fee.ceil().toString());
                print('後' + after_time_fee.ceil().toString());
                int o = before_time_fee.ceil() + after_time_fee.ceil();
                print("残業代" + o.toString());
                print('有給' +
                    (fix * double.parse(work_time) * yukyu_count).toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        Text('支給額：' +
            (fix * double.parse(work_time) * work_count).toString() +
            '円'),
        Text('テスト'),
      ]),
    ));
  }
}
