import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class VerticalCalendarApp extends StatefulWidget {
  @override
  _VerticalCalendarAppState createState() => _VerticalCalendarAppState();
}

class _VerticalCalendarAppState extends State<VerticalCalendarApp> {
  // CalendarController _calendarController;
  // DateTime _selectedStart;
  // DateTime _selectedEnd;
  // RangeSelectionMode _rangeSelectionMode;

  // @override
  // void initState() {
  //   super.initState();
  //   _calendarController = CalendarController();
  //   _selectedStart = null;
  //   _selectedEnd = null;
  //   _rangeSelectionMode = RangeSelectionMode.toggledOff;
  // }

  @override
  void dispose() {
    // _calendarController.dispose();
    super.dispose();
  }

  // void _onDaySelected(DateTime day, List<DateTime> selectedDays) {
  //   setState(() {
  //     if (_rangeSelectionMode == RangeSelectionMode.toggledOff) {
  //       _selectedStart = day;
  //       _selectedEnd = null;
  //       _rangeSelectionMode = RangeSelectionMode.start;
  //     } else if (_rangeSelectionMode == RangeSelectionMode.start) {
  //       _selectedEnd = day;
  //       _rangeSelectionMode = RangeSelectionMode.end;
  //     } else {
  //       _selectedStart = day;
  //       _selectedEnd = null;
  //       _rangeSelectionMode = RangeSelectionMode.start;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vertical Calendar'),
      ),
      body: ListView.builder(
        itemCount: 12, // Number of months
        itemBuilder: (context, index) {
          final month = index + 1;
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Month $month',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
