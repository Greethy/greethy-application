// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/finance_state/shopping_monthly_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../model/finance_model/shopping_monthly.dart';
import '../../common/error_indicator.dart';
import 'calender_header.dart';

class FinanceCalendar extends StatefulWidget {
  @override
  _FinanceCalendarState createState() => _FinanceCalendarState();
}

class _FinanceCalendarState extends State<FinanceCalendar> {
  late final ValueNotifier<List<ShoppingItem>> _selectedShoppingItems;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  late Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  late PageController _pageController;
  int currentCalenderPage = 0;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  LinkedHashMap<DateTime, List<ShoppingItem>> kShoppingItems = LinkedHashMap<DateTime, List<ShoppingItem>>();
  Map<DateTime, List<ShoppingItem>> _kShoppingItemSource = {};

  final kToday = DateTime.now();
  late DateTime kFirstDay = DateTime(kToday.year, kToday.month, 1);
  late DateTime kLastDay = DateTime(kToday.year, kToday.month + 1, 0);

  bool isFetchShoppingItemsSuccess = false;

  @override
  void initState() {
    super.initState();
    _selectedShoppingItems = ValueNotifier(_getShoppingItemsForDay(_focusedDay.value));
    _selectedDays.add(_focusedDay.value);

    kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);

    print("init");
    Timer(Duration(seconds: 1), () async {
      var state = Provider.of<ShoppingMonthlyState>(context, listen: false);

      setState(() {
        _kShoppingItemSource = state.kShoppingItemSource;
        kShoppingItems = LinkedHashMap<DateTime, List<ShoppingItem>>(
          equals: isSameDay,
          hashCode: getHashCode,
        )..addAll(_kShoppingItemSource);
      });
    });
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedShoppingItems.dispose();
    super.dispose();
  }

  bool get canClearSelection => _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  List<ShoppingItem> _getShoppingItemsForDay(DateTime day) {
    return kShoppingItems[day] ?? [];
  }

  List<ShoppingItem> _getShoppingItemsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getShoppingItemsForDay(d),
    ];
  }

  List<ShoppingItem> _getShoppingItemsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return _getShoppingItemsForDays(days);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }

      _focusedDay.value = focusedDay;
      _rangeStart = null;
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });

    _selectedShoppingItems.value = _getShoppingItemsForDays(_selectedDays);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _selectedDays.clear();
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedShoppingItems.value = _getShoppingItemsForRange(start, end);
    } else if (start != null) {
      _selectedShoppingItems.value = _getShoppingItemsForDay(start);
    } else if (end != null) {
      _selectedShoppingItems.value = _getShoppingItemsForDay(end);
    }
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<ShoppingMonthlyState>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Builder(builder: (BuildContext context) {
          final calender = state.dsShoppingMonthlyModel;
          return calender.onState(
            fetched: (value) => _buildView(),
            failed: (e) => ErrorIndicator(e),
            loading: () => const CircularProgressIndicator(),
          );
        }),
      ),
    );
  }

  Widget _buildView() {
    return Padding(
      padding: EdgeInsetsDirectional.all(5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(start: 5, end: 5, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: GreethyColor.kawa_green,
                  width: 20,
                ),
                right: BorderSide(
                  color: GreethyColor.kawa_green,
                  width: 7,
                ),
                left: BorderSide(
                  color: GreethyColor.kawa_green,
                  width: 7,
                ),
                bottom: BorderSide(
                  color: GreethyColor.kawa_green,
                  width: 7,
                ),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                ValueListenableBuilder<DateTime>(
                  valueListenable: _focusedDay,
                  builder: (context, value, _) {
                    return CalendarHeader(
                      focusedDay: value,
                      clearButtonVisible: canClearSelection,
                      onTodayButtonTap: () {
                        setState(() => _focusedDay.value = DateTime.now());
                      },
                      onClearButtonTap: () {
                        setState(() {
                          _rangeStart = null;
                          _rangeEnd = null;
                          _selectedDays.clear();
                          _selectedShoppingItems.value = [];
                        });
                      },
                      onLeftArrowTap: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                        isFetchShoppingItemsSuccess = false;
                      },
                      onRightArrowTap: () {
                        // setState(() {
                        //   _rangeStart = null;
                        //   _rangeEnd = null;
                        //   _selectedDays.clear();
                        //   _selectedShoppingItems.value = [];
                        //   isFetchShoppingItemsSuccess = false;
                        // });
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                    );
                  },
                ),
                TableCalendar<ShoppingItem>(
                  locale: 'vi_VN',
                  availableCalendarFormats: {
                    CalendarFormat.month: 'THÁNG',
                    CalendarFormat.twoWeeks: '2 TUẦN',
                    CalendarFormat.week: 'TUẦN',
                  },
                  calendarStyle: _calendarStyle,
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: _focusedDay.value,
                  headerVisible: false,
                  selectedDayPredicate: (day) => _selectedDays.contains(day),
                  rangeStartDay: _rangeStart,
                  rangeEndDay: _rangeEnd,
                  calendarFormat: _calendarFormat,
                  rangeSelectionMode: _rangeSelectionMode,
                  eventLoader: _getShoppingItemsForDay,
                  holidayPredicate: (day) {
                    // Every 20th day of the month will be treated as a holiday
                    return day.day == 20;
                  },
                  onDaySelected: _onDaySelected,
                  onRangeSelected: _onRangeSelected,
                  onCalendarCreated: (controller) => _pageController = controller,
                  onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() => _calendarFormat = format);
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("Lịch sử chi tiêu", style: TextStyle(fontSize: 17)),
                Spacer(),
                Container(
                  padding: EdgeInsetsDirectional.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: GreethyColor.kawa_green,
                  ),
                  child: Center(
                    child: Text(
                      " " + _selectedShoppingItems.value.length.toString() + " ",
                      style: TextStyle(color: GreethyColor.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<ShoppingItem>>(
              valueListenable: _selectedShoppingItems,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
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
                        onTap: () => {},
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${value[index].name}'),
                            Text('${value[index].kindName}'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

CalendarStyle _calendarStyle = CalendarStyle(
  defaultDecoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: GreethyColor.kawa_green,
    ),
  ),
  selectedDecoration: BoxDecoration(
    color: GreethyColor.kawa_green,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: GreethyColor.brunswickGreen,
        offset: Offset(1, 1),
        blurRadius: 5,
      ),
    ],
  ),
  todayDecoration: BoxDecoration(
    color: GreethyColor.kawa_green.withOpacity(0.5),
    shape: BoxShape.circle,
  ),
  rangeStartDecoration: BoxDecoration(
    color: GreethyColor.pakistanGreen,
    shape: BoxShape.circle,
  ),
  rangeEndDecoration: BoxDecoration(
    color: GreethyColor.pakistanGreen,
    shape: BoxShape.circle,
  ),
  rangeHighlightColor: GreethyColor.mossGreen,
  holidayDecoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: GreethyColor.redHoliday,
      width: 1.5,
    ),
  ),
  holidayTextStyle: TextStyle(),
);
