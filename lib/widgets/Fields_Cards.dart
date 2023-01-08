import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class FieldsCardText extends StatelessWidget {
  final String place;
  final String Field;
  final String price;
  Future<void> showSchedule(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SfCalendar(
            view: CalendarView.week,
            firstDayOfWeek: 6,
            dataSource: _getCalendarDataSource(),
          ),
        );
      },
    );
  }

  const FieldsCardText(
      {super.key,
      required this.place,
      required this.Field,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 285,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 51, 51, 51),
            borderRadius: BorderRadius.horizontal(),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 185, 185, 185).withOpacity(0.5),
                spreadRadius: 0.5,
                offset: Offset(0, 0),
              )
            ]),
        //sooooooooooooooooooooooooooooooooooooooooooooora
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),

              //teeeeeeeeeeeeeeeeexxxxxxxxxxxxxxtttttttt
              SizedBox(
                height: 5,
              ),
              Text(
                'Field Information',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 151, 232, 134)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Place : " + place,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.italic),
              ),

              Text(
                "Field Number : " + Field,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontStyle: FontStyle.italic),
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                "Price per hour : " + price,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFF5F5F5),
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(85, 40),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Color.fromARGB(189, 175, 168, 49),
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  showSchedule(context);
                },
                child: const Text('Schedule'),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(97, 20, 30, 0),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(85, 40),
                      textStyle: TextStyle(fontSize: 18),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text('Delete'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}

DataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime StartTime =
      DateTime(today.year, today.month, today.year, today.hour);
  final DateTime EndTime =
      DateTime(today.year, today.month, today.year, today.hour - 2);
  appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 2)),
      isAllDay: false,
      subject: 'Booked',
      color: Color.fromARGB(255, 58, 243, 33),
      startTimeZone: '',
      endTimeZone: ''));

  return DataSource(appointments);
}
