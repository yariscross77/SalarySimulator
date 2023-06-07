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
  int min15_count = 0;
  int min30_count = 0;
  int min45_count = 0;
  int hour1_count = 0;

  final formkey = GlobalKey<FormState>();
  final TextEditingController _fix = TextEditingController();
  final TextEditingController _after_over_time = TextEditingController();

  bool isAddTime2 = false;
  bool isAddTime3 = false;
  bool isBeforeOverTime = false;
  bool is15MinOverTime = false;
  bool is30MinOverTime = false;
  bool is45MinOverTime = false;
  bool is1HourOverTime = false;

  double padding_top = 30;
  double padding_bottom = 30;

  void dispose() {
    _fix.dispose();
    _after_over_time.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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
                      prefixIcon: Icon(
                        Icons.attach_money,
                      ),
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
                    decoration: InputDecoration(
                      labelText: '勤務時間',
                      border: OutlineInputBorder(),
                    ),
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
                  padding:
                      EdgeInsets.fromLTRB(0, padding_top, 0, padding_bottom),
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: '勤務回数',
                        border: OutlineInputBorder(),
                      ),
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

                // 2つ目の時間帯を追加するスイッチ
                SwitchListTile(
                  secondary: Icon(Icons.add),
                  title: Text('2つ目の時間帯を追加'),
                  value: isAddTime2,
                  onChanged: (bool value) {
                    setState(() {
                      isAddTime2 = value;
                    });
                  },
                ),

                // 勤務時間を選択するコンボボックス（2つ目）
                Visibility(
                  visible: isAddTime2,
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: '勤務時間',
                        border: OutlineInputBorder(),
                      ),
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
                      onChanged: (String? value) {
                        setState(() {
                          work_time2 = value!;
                        });
                      },
                    ),
                  ),
                ),

                // 勤務回数を選択するコンボボックス（2つ目）
                Visibility(
                  visible: isAddTime2,
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, padding_top, 0, padding_bottom),
                    child: SizedBox(
                      width: double.infinity,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: '勤務回数',
                          border: OutlineInputBorder(),
                        ),
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
                        onChanged: (int? value) {
                          setState(() {
                            work_count2 = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                // 3つ目の時間帯を追加するスイッチ
                SwitchListTile(
                  secondary: Icon(Icons.add),
                  title: Text('3つ目の時間帯を追加'),
                  value: isAddTime3,
                  onChanged: (bool value) {
                    setState(() {
                      isAddTime3 = value;
                    });
                  },
                ),

                // 勤務時間を選択するコンボボックス（3つ目）
                Visibility(
                  visible: isAddTime3,
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: '勤務時間',
                        border: OutlineInputBorder(),
                      ),
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
                      onChanged: (String? value) {
                        setState(() {
                          work_time3 = value!;
                        });
                      },
                    ),
                  ),
                ),

                // 勤務回数を選択するコンボボックス（3つ目）
                Visibility(
                  visible: isAddTime3,
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, padding_top, 0, padding_bottom),
                    child: SizedBox(
                      width: double.infinity,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: '勤務回数',
                          border: OutlineInputBorder(),
                        ),
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
                        onChanged: (int? value) {
                          setState(() {
                            work_count3 = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                // 契約時刻前勤務スイッチ
                SwitchListTile(
                  secondary: Icon(Icons.add),
                  title: Text('契約時刻前勤務'),
                  value: isBeforeOverTime,
                  onChanged: (bool value) {
                    setState(() {
                      isBeforeOverTime = value;
                    });
                  },
                ),

                // 15分前勤務スイッチ
                Visibility(
                  visible: isBeforeOverTime,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SwitchListTile(
                          title: Text('15分前'),
                          value: is15MinOverTime,
                          onChanged: (bool value) {
                            setState(() {
                              is15MinOverTime = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(
                              child: Text('回数を選択'),
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
                          value: min15_count,
                          validator: is15MinOverTime
                              ? (int? value) {
                                  if (value == 0) {
                                    return '回数が未選択です。';
                                  }
                                  return null;
                                }
                              : (int? value) {
                                  return null;
                                },
                          onChanged: is15MinOverTime
                              ? (int? value) {
                                  setState(() {
                                    min15_count = value!;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),

                /*
                Row(
                  children: <Widget>[
                    Visibility(
                      visible: isBeforeOverTime,
                      child: Expanded(
                        child: SwitchListTile(
                          title: Text('15分前'),
                          value: is15MinOverTime,
                          onChanged: (bool value) {
                            setState(() {
                              is15MinOverTime = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isBeforeOverTime,
                      child: Expanded(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: '回数',
                            border: OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(
                              child: Text('回数を選択'),
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
                          value: min15_count,
                          validator: is15MinOverTime
                              ? (int? value) {
                                  if (value == 0) {
                                    return '回数が選択されていません。';
                                  }
                                  return null;
                                }
                              : (int? value) {
                                  return null;
                                },
                          onChanged: is15MinOverTime
                              ? (int? value) {
                                  setState(() {
                                    min15_count = value!;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),*/

                // 30分前勤務スイッチ
                Visibility(
                  visible: isBeforeOverTime,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SwitchListTile(
                          title: Text('30分前'),
                          value: is30MinOverTime,
                          onChanged: (bool value) {
                            setState(() {
                              is30MinOverTime = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(
                              child: Text('回数を選択'),
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
                          value: min30_count,
                          validator: is30MinOverTime
                              ? (int? value) {
                                  if (value == 0) {
                                    return '回数が選択されていません。';
                                  }
                                  return null;
                                }
                              : (int? value) {
                                  return null;
                                },
                          onChanged: is30MinOverTime
                              ? (int? value) {
                                  setState(() {
                                    min30_count = value!;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),

                /*
                Row(
                  children: <Widget>[
                    Visibility(
                      visible: isBeforeOverTime,
                      child: Expanded(
                        child: SwitchListTile(
                          title: Text('30分前'),
                          value: is30MinOverTime,
                          onChanged: (bool value) {
                            setState(() {
                              is30MinOverTime = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isBeforeOverTime,
                      child: Expanded(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: '回数',
                            border: OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(
                              child: Text('回数を選択'),
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
                          value: min30_count,
                          validator: is30MinOverTime
                              ? (int? value) {
                                  if (value == 0) {
                                    return '回数が選択されていません。';
                                  }
                                  return null;
                                }
                              : (int? value) {
                                  return null;
                                },
                          onChanged: is30MinOverTime
                              ? (int? value) {
                                  setState(() {
                                    min30_count = value!;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),*/

                // 45分前勤務スイッチ
                Visibility(
                  visible: isBeforeOverTime,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SwitchListTile(
                          title: Text('45分前'),
                          value: is45MinOverTime,
                          onChanged: (bool value) {
                            setState(() {
                              is45MinOverTime = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(
                              child: Text('回数を選択'),
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
                          value: min45_count,
                          validator: is45MinOverTime
                              ? (int? value) {
                                  if (value == 0) {
                                    return '回数が選択されていません。';
                                  }
                                  return null;
                                }
                              : (int? value) {
                                  return null;
                                },
                          onChanged: is45MinOverTime
                              ? (int? value) {
                                  setState(() {
                                    min45_count = value!;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),

                /*
                Row(
                  children: <Widget>[
                    Visibility(
                      visible: isBeforeOverTime,
                      child: Expanded(
                        child: SwitchListTile(
                          title: Text('45分前'),
                          value: is45MinOverTime,
                          onChanged: (bool value) {
                            setState(() {
                              is45MinOverTime = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isBeforeOverTime,
                      child: Expanded(
                        child: DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(
                              child: Text('回数を選択'),
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
                          value: min45_count,
                          validator: is45MinOverTime
                              ? (int? value) {
                                  if (value == 0) {
                                    return '回数が選択されていません。';
                                  }
                                  return null;
                                }
                              : (int? value) {
                                  return null;
                                },
                          onChanged: is45MinOverTime
                              ? (int? value) {
                                  setState(() {
                                    min45_count = value!;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                */

                // 1時間前勤務スイッチ
                Visibility(
                  visible: isBeforeOverTime,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SwitchListTile(
                          title: Text('1時間前'),
                          value: is1HourOverTime,
                          onChanged: (bool value) {
                            setState(() {
                              is1HourOverTime = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(
                              child: Text('回数を選択'),
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
                          value: hour1_count,
                          validator: is1HourOverTime
                              ? (int? value) {
                                  if (value == 0) {
                                    return '回数が選択されていません。';
                                  }
                                  return null;
                                }
                              : (int? value) {
                                  return null;
                                },
                          onChanged: is1HourOverTime
                              ? (int? value) {
                                  setState(() {
                                    hour1_count = value!;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),

                /*
                Row(
                  children: <Widget>[
                    Visibility(
                      visible: isBeforeOverTime,
                      child: Expanded(
                        child: SwitchListTile(
                          title: Text('1時間前'),
                          value: is1HourOverTime,
                          onChanged: (bool value) {
                            setState(() {
                              is1HourOverTime = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isBeforeOverTime,
                      child: Expanded(
                        child: DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(
                              child: Text('回数を選択'),
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
                          value: hour1_count,
                          validator: is1HourOverTime
                              ? (int? value) {
                                  if (value == 0) {
                                    return '回数が選択されていません。';
                                  }
                                  return null;
                                }
                              : (int? value) {
                                  return null;
                                },
                          onChanged: is1HourOverTime
                              ? (int? value) {
                                  setState(() {
                                    hour1_count = value!;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                */

                // 後残業時間を入力するテキストボックス
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, padding_bottom),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.punch_clock,
                      ),
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
                      decoration: InputDecoration(
                        labelText: '有給回数',
                        border: OutlineInputBorder(),
                      ),
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
                  style: /*ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    
                  ),*/

                      ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
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

                    // 前残業代（15分）を求める処理
                    int before_15min_fee = 0;
                    if (is15MinOverTime) {
                      before_15min_fee =
                          (double.parse(min_fee.toStringAsFixed(3)) *
                                  15 *
                                  min15_count)
                              .ceil();
                    } else {
                      before_15min_fee = 0;
                    }

                    // 前残業代（30分）を求める処理
                    int before_30min_fee = 0;
                    if (is30MinOverTime) {
                      before_30min_fee =
                          (double.parse(min_fee.toStringAsFixed(3)) *
                                  30 *
                                  min30_count)
                              .ceil();
                    } else {
                      before_30min_fee = 0;
                    }

                    // 前残業代（45分）を求める処理
                    int before_45min_fee = 0;
                    if (is45MinOverTime) {
                      before_45min_fee =
                          (double.parse(min_fee.toStringAsFixed(3)) *
                                  45 *
                                  min45_count)
                              .ceil();
                    } else {
                      before_45min_fee = 0;
                    }

                    // 前残業代（1時間）を求める処理
                    int before_1hour_fee = 0;
                    if (is1HourOverTime) {
                      before_1hour_fee =
                          (double.parse(min_fee.toStringAsFixed(3)) *
                                  60 *
                                  hour1_count)
                              .ceil();
                    } else {
                      before_1hour_fee = 0;
                    }

                    // 前残業代（合計）を求める計算式
                    int before_over_time_fee = 0;
                    if (isBeforeOverTime) {
                      before_over_time_fee = before_15min_fee +
                          before_30min_fee +
                          before_45min_fee +
                          before_1hour_fee;
                    } else {
                      before_over_time_fee = 0;
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
