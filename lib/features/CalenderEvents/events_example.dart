import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/CalenderEvents/func/day_checker.dart';
import 'package:flutter_application_1/features/CalenderEvents/model/event_model.dart';
import 'package:flutter_application_1/features/CalenderEvents/widgets/month_title.dart';
import 'package:flutter_application_1/utils/extentions/logger.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TableEventsExample extends StatefulWidget {
  const TableEventsExample({super.key});

  @override
  TableEventsExampleState createState() => TableEventsExampleState();
}

class TableEventsExampleState extends State<TableEventsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();
  DateTime _oldfocusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool isLoadingEvents = true;

  @override
  void initState() {
    super.initState();
    addEvent(_focusedDay);
    _selectedDay = _focusedDay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    List<Event> list =
        userEvents.where((e) => isSameDate(e.date, day)).toList();
    return list;
  }

  Future addEvent(DateTime date) async {
    if (userEvents.where((e) => isSameDate(e.date, date)).isEmpty) {
      setState(() {
        isLoadingEvents = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      if (date.day % 2 == 0) {
        setState(() {
          userEvents
              .add(Event('Event ${userEvents.length + 1}', _selectedDay!));
        });
      }

      setState(() {
        isLoadingEvents = false;
      });
    }
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _oldfocusedDay = _focusedDay;
        _focusedDay = focusedDay;
      });
      addEvent(_selectedDay!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar - Events'),
      ),
      body: Column(
        children: [
          Text(
            DateFormat.yMMMMd().format(_focusedDay),
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(
                child: MonthTitle(
                  text: DateFormat.MMMM().format(
                      _focusedDay.copyWith(month: _focusedDay.month - 1)),
                  date: _focusedDay,
                  previousDate: _oldfocusedDay,
                  isActive: false,
                  onTap: () {
                    _focusedDay =
                        _focusedDay.copyWith(month: _focusedDay.month - 1);
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: MonthTitle(
                  text: DateFormat.MMMM()
                      .format(_focusedDay.add(const Duration())),
                  date: _focusedDay,
                  previousDate: _oldfocusedDay,
                  isActive: true,
                  onTap: () {
                    _focusedDay = _focusedDay.copyWith();
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: MonthTitle(
                  text: DateFormat.MMMM().format(
                      _focusedDay.copyWith(month: _focusedDay.month + 1)),
                  date: _focusedDay,
                  previousDate: _oldfocusedDay,
                  isActive: false,
                  onTap: () {
                    _focusedDay =
                        _focusedDay.copyWith(month: _focusedDay.month + 1);
                    setState(() {});
                  },
                ),
              ),
            ]),
          ),
          TableCalendar(
            headerVisible: false,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            eventLoader: (d) => _getEventsForDay(d).length > 1
                ? [_getEventsForDay(d).first]
                : _getEventsForDay(d),
            startingDayOfWeek: StartingDayOfWeek.saturday,
            calendarStyle: CalendarStyle(
              markerDecoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              markerMargin: const EdgeInsets.only(top: 7, bottom: 5),
              markerSize: 7,
              todayTextStyle: const TextStyle(color: Colors.amber),
              todayDecoration: BoxDecoration(
                // color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.amber,
                  width: 2,
                ),
              ),
              outsideDaysVisible: false,
              selectedDecoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _oldfocusedDay = _focusedDay;
              _focusedDay = focusedDay;
              setState(() {});
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
              child: isLoadingEvents
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount:
                          _getEventsForDay(_selectedDay ?? DateTime.now())
                              .length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            onTap: () => Logger(_getEventsForDay(
                                    _selectedDay ?? DateTime.now())[index]
                                .title),
                            title: Text(
                                "${_getEventsForDay(_selectedDay ?? DateTime.now())[index].title} || ${_getEventsForDay(_selectedDay ?? DateTime.now())[index].date}"),
                          ),
                        );
                      },
                    )),
        ],
      ),
    );
  }
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year - 3, kToday.month, 1);
final kLastDay = DateTime(kToday.year + 5, kToday.month, 1);
