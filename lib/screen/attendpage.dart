import 'package:flutter/material.dart';

class AttendanceScreenState extends StatefulWidget {
  const AttendanceScreenState({super.key});

  @override
  State<AttendanceScreenState> createState() => _AttendanceScreenStateState();
}

class _AttendanceScreenStateState extends State<AttendanceScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 30),
              child: const Text(
                "Today Attendance",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
