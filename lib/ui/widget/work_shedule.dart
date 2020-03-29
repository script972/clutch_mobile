import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/helpers/utils/date_utils.dart';

class WorkSchedule extends StatefulWidget {
  final List<WorkingDay> workingDays = [
    WorkingDay('Понедельник', '12:00', '00:00'),
    WorkingDay('Вторник', '12:00', '00:00'),
    WorkingDay('Среда', '12:00', '00:00'),
    WorkingDay('Четверг', '12:00', '00:00'),
    WorkingDay('Пятница', '12:00', '00:00'),
    WorkingDay('Суббота', '12:00', '00:00'),
    WorkingDay('Воскресенье', '12:00', '00:00'),
  ];

  WorkSchedule({Key key}) : super(key: key);

  @override
  _WorkScheduleState createState() => _WorkScheduleState();
}

class _WorkScheduleState extends State<WorkSchedule> {
  bool get _isWorkingTime {
    DateTime today = DateTime.now();
    if (today.hour > 12 && today.hour < 24) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Icon(
              Icons.access_time,
              size: 20.0,
              color: Colors.black.withOpacity(0.38),
            )),
        Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'График работы',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.54),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(_isWorkingTime ? 'Открыто' : 'Закрыто',
                          style: TextStyle(
                              color: _isWorkingTime
                                  ? Theme.of(context).primaryColor
                                  : Color(0xFFFF473D),
                              fontSize: 14,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(16.0), child: Column(children: widget.workingDays)),
                ],
              ),
            )),
      ],
    );
}

class WorkingDay extends StatelessWidget {
  final String weekday;
  final String openingTime;
  final String closingTime;

  WorkingDay(this.weekday, this.openingTime, this.closingTime);

  bool get _isWorkingTime {
    DateTime today = DateTime.now();
    String todayWeekday = DateUtils.weekdays[today.weekday];
    if (todayWeekday == weekday) {
      int openHour = int.parse(openingTime.split(':')[0]);
      int openMinute = int.parse(openingTime.split(':')[1]);

      int closeHour = int.parse(closingTime.split(':')[0]);
      int closeMinute = int.parse(closingTime.split(':')[1]);
      if (today.hour > openHour &&
          today.hour < (closeHour == 0 ? 24 : closeHour)) {
        return true;
      } else if (openHour == today.hour) {
        if (today.minute >= openMinute && today.minute <= closeMinute) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            weekday,
            style: TextStyle(
                color: _isWorkingTime
                    ? Colors.black
                    : Colors.black.withOpacity(0.54),
                fontSize: 14,
                fontWeight: _isWorkingTime ? FontWeight.bold : FontWeight.w600),
          ),
          Text(
            openingTime.toString() + ' - ' + closingTime.toString(),
            style: TextStyle(
                color: _isWorkingTime
                    ? Colors.black
                    : Colors.black.withOpacity(0.54),
                fontSize: 14,
                fontWeight: _isWorkingTime ? FontWeight.bold : FontWeight.w600),
          )
        ],
      ),
    );
  }
}
