import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task2/screens/screen2.dart';
import 'package:task2/widgets/date_select_view.dart';
import 'package:task2/widgets/time_select_view.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final List<Map<String, dynamic>> _itemsDate = [
    {
      "title": "Fri",
      "date": "16 DEC",
      "day": "Yesterday",
    },
    {
      "title": "Sat",
      "date": "17 DEC",
      "day": "Today",
    },
    {
      "title": "Sun",
      "date": "18 DEC",
      "day": "Tomorrow",
    },
    {
      "title": "Mon",
      "date": "19 DEC",
      "day": "Backday",
    },
  ];

  final List<Map<String, dynamic>> _itemsTime = [
    {
      "time": "7am-9am",
    },
    {
      "time": "10am-12pm",
    },
    {
      "time": "1pm-2pm",
    },
    {
      "time": "4pm-6pm",
    },
    {
      "time": "8pm-10pm",
    },
  ];

  int optionSelectedDate = 0;
  int optionSelectedTime = 0;

  bool isRepeat = false;

  String? _dropDownValue;
  String? _dropDown2Value;

  void checkOptionDate(int index) {
    setState(() {
      optionSelectedDate = index;
    });
  }

  void checkOptionTime(int index) {
    setState(() {
      optionSelectedTime = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pickup Date",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(
            Icons.menu,
            color: Colors.blue,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            //TODO: DATE SELECTOR
            const Center(
              child: Text(
                "When would you like your pickup?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 14,
              children: [
                for (int i = 0; i < _itemsDate.length; i++)
                  SelectDateView(
                    title: _itemsDate[i]["title"] as String,
                    onTap: () => checkOptionDate(i + 1),
                    isSelected: i + 1 == optionSelectedDate,
                    date: _itemsDate[i]["date"] as String,
                    day: _itemsDate[i]["day"] as String,
                  )
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            //TODO: TIME SELECTOR
            const Center(
              child: Text(
                "Available Time Slots",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 25,
              childAspectRatio: 2,
              children: [
                for (int i = 0; i < _itemsTime.length; i++)
                  SelectTimeView(
                    time: _itemsTime[i]["time"] as String,
                    onTap: () => checkOptionTime(i + 1),
                    isSelected: i + 1 == optionSelectedTime,
                    color: Colors.blue,
                  )
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            //TODO:TOGGLE SWITCH

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(3, 5),
                      spreadRadius: 2)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Reapeat Pickup",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Switch(
                    value: isRepeat,
                    onChanged: (val) {
                      setState(() {
                        isRepeat = !isRepeat;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            //TODO:DROPDOWN1

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "How Often Repeat?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(3, 5),
                        spreadRadius: 2)
                  ]),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _dropDownValue,
                  items: <String>[
                    'Every Week',
                    'Every Month',
                    'Every Day',
                    'Alternate'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _dropDownValue = val;
                      },
                    );
                  },
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            //TODO:DROPDOWN2

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "How Many Times?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(3, 5),
                        spreadRadius: 2)
                  ]),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _dropDown2Value,
                  items: <String>['1', '2', '3', '4'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _dropDown2Value = val;
                      },
                    );
                  },
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Screen2()));
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
