import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAndTIme extends StatefulWidget {
  @override
  _DateAndTImeState createState() => _DateAndTImeState();
}

class _DateAndTImeState extends State<DateAndTIme> {
  String _timeString;

  @override
  void initState() {
    _timeString = _formatTime(DateTime.now());
    Timer.periodic(Duration(minutes: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  String formattedDate = DateFormat('MMM d, EEE').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$_timeString",
          textAlign: TextAlign.center,
          style: new TextStyle(
            // color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
          ),
        ),
        Text(
          "$formattedDate",
          textAlign: TextAlign.center,
          style: new TextStyle(
              // color: Colors.white,
              ),
        ),
      ],
    );
  }
}
