import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:home/slot_button.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text(today.toString().split(" ")[0]),
        Container(
            child: TableCalendar(
          rowHeight: 60,
          headerStyle: const HeaderStyle(
              formatButtonVisible: false, titleCentered: true),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: ((day) => isSameDay(day, today)),
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          onDaySelected: _onDaySelected,
          calendarStyle: const CalendarStyle(
            todayDecoration: const BoxDecoration(
              color: Color.fromARGB(255, 162, 162, 162),
              shape: BoxShape.circle,
            ),
            selectedDecoration: const BoxDecoration(
              color: Color(0xFF212121),
              shape: BoxShape.circle,
            ),
            isTodayHighlighted: true,
            //selectedDecoration: BoxDecoration(),
          ),
        )),
        Slot_Button(),
      ],
    );
  }
}
