import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i_gatchu/src/utils/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsCalendar extends ConsumerStatefulWidget {
  const EventsCalendar({super.key});

  @override
  ConsumerState<EventsCalendar> createState() => _EventsCalendarState();
}

class _EventsCalendarState extends ConsumerState<EventsCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  late Map<DateTime, List<dynamic>> _events;
  late List<dynamic> _selectedEvents;

  List<dynamic> getEvents(DateTime day) {
    final events = [];
    final day_ = _events.keys.firstWhere((element) => isSameDay(element, day),
        orElse: () => _events.keys.first);
    events.addAll(_events[day_] ?? []);
    return events;
  }

  @override
  void initState() {
    _events = LinkedHashMap(
        equals: isSameDay,
        hashCode: (DateTime key) =>
            key.day * 1000000 + key.month * 10000 + key.year)
      ..addAll({
        // .. signifies a builder on curr object
        // Add holiday dates and corresponding events
        DateTime(2023, 12, 25): [
          'Re-fill Appointment',
          'Medication adherence',
          "Blood Pressure",
          "Chogo Event"
        ],
        // Christmas
        DateTime(2024, 1, 1): ['Clinical Review Appointment'],
        // New Year's Day
        DateTime(2024, 2, 14): ['Lab Test Appointment', 'Chockablock ART'],
        // Valentine's Day
        DateTime(2024, 4, 21): ['Clinical Review', "Marathon ART"],
        // Easter Sunday
      });
    _selectedEvents = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text("My Calendar"),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            eventLoader: (DateTime day) {
              return _events[day] ?? [];
            },
            headerStyle: const HeaderStyle(
              leftChevronIcon: Icon(Icons.arrow_back),
              rightChevronIcon: Icon(Icons.arrow_forward),
            ),
            calendarStyle: CalendarStyle(
              canMarkersOverflow: true,
              todayDecoration: BoxDecoration(color: theme.colorScheme.primary),
              holidayDecoration: const BoxDecoration(color: Colors.redAccent),
              selectedDecoration: BoxDecoration(
                color: theme.colorScheme.inversePrimary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    Constants.ROUNDNESS,
                  ),
                ),
              ),
              markerDecoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),

            ),
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedEvents = _events[selectedDay] ?? [];
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(
            height: Constants.SPACING,
          ),
          Center(
              child: Text(
            "Events",
            style: theme.textTheme.titleLarge,
          )),
          if (_selectedEvents.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _selectedEvents.length,
                itemBuilder: (context, index) {
                  final event = _selectedEvents[index];
                  return Card(
                    margin: const EdgeInsets.only(top: Constants.SPACING),
                    child: Padding(
                      padding: const EdgeInsets.all(Constants.SPACING * 0.6),
                      child: ListTile(
                        title: Text(event),
                        leading: const Icon(Icons.event_note),
                        subtitle: Text("Some notes here for the $event"),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => FractionallySizedBox(
                widthFactor: 1,
                child: Column(
                  children: [
                    const SizedBox(height: Constants.SPACING),
                    Text(
                      "Add Event",
                      style: theme.textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Icon(Icons.edit_calendar_outlined)),
    );
  }
}
