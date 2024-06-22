// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? selectedDate;
  int? age;
  int? month;
  int? day;

  void datePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
        calculateAge();
      });
    });
  }

  void calculateAge() {
    if (selectedDate != null) {
      DateTime today = DateTime.now();
      int year = today.year - selectedDate!.year;
      int months = today.month - selectedDate!.month;
      int days = today.day - selectedDate!.day;

      if (days < 0) {
        months--;
        days += DateUtils.getDaysInMonth(today.year, today.month - 1);
      }

      if (months < 0) {
        year--;
        months += 12;
      }

      setState(() {
        age = year;
        month = months;
        day = days;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Age Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 19, 17, 17),
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 30,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    datePicker();
                  },
                  child: Text("Select DOB"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                        colors: [Color(0xffeecda3), Color.fromARGB(255, 30, 8, 17)])),
                child: Column(
                  children: [
                    customTitle(
                      Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      "Your Date of Birth",
                    ),
                    GestureDetector(
                      onTap: () => datePicker(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customContainer(
                              selectedDate == null
                                  ? "0"
                                  : selectedDate!.day.toString(),
                              "Day",
                            ),
                            customContainer(
                              selectedDate == null
                                  ? "0"
                                  : selectedDate!.month.toString(),
                              "Month",
                            ),
                            customContainer(
                              selectedDate == null
                                  ? "0"
                                  : selectedDate!.year.toString(),
                              "Year",
                            ),
                          ],
                        ),
                      ),
                    ),
                    customTitle(
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      "Your Age Till Today",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customContainer(
                            age == null ? "0" : age.toString(),
                            "Years",
                          ),
                          customContainer(
                            month == null ? "0" : month.toString(),
                            "Month",
                          ),
                          customContainer(
                            day == null ? "0" : day.toString(),
                            "Days",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customTitle(Icon icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30,
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 101, 106, 114),
            borderRadius: BorderRadius.circular(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customContainer(String number, String type) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade400,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                number,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ),
        Text(
          type,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
