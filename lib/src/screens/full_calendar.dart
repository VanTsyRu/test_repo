import 'package:pilgrim/src/models/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class FullCalendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FullCalendarState();
  }
}

class FullCalendarState extends State<FullCalendar> {
  List<Post> posts;
  final CalendarController _controller = CalendarController();
  Map<DateTime, List<dynamic>> result = {};
  @override
  Widget build(BuildContext context) {
    double _margin = 0;
    if (MediaQuery.of(context).size.height / MediaQuery.of(context).size.width <
            (16 / 9).round() &&
        MediaQuery.of(context).size.height / MediaQuery.of(context).size.width >
            (16 / 9)) {
      _margin = 16;
    } else {
      _margin = 6;
    }
    posts = ModalRoute.of(context).settings.arguments;

    _buildDays(List<Post> map) {
      map.forEach((element) {
        element.days.forEach((key, value) {
          value.forEach((el) {
            result.putIfAbsent(
                el['date'], () => [element.name, el['description'], key]);
          });
        });
      });
      return result;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueAccent),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Церковный календарь',
          style: TextStyle().copyWith(color: Colors.blueAccent),
        ),
      ),
      body: Center(
          child: Builder(
        builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
          TableCalendar(
            daysOfWeekStyle: DaysOfWeekStyle(dowTextBuilder: (date, data) {
              switch (date.weekday) {
                case 1:
                  return 'Пн';
                  break;
                case 2:
                  return 'Вт';
                  break;
                case 3:
                  return 'Ср';
                  break;
                case 4:
                  return 'Чт';
                  break;
                case 5:
                  return 'Пт';
                  break;
                case 6:
                  return 'Сб';
                  break;
                case 7:
                  return 'Вс';
                  break;
                default:
                  return 'Uff';
                  break;
              }
            }),
            initialCalendarFormat: CalendarFormat.month,
            calendarController: _controller,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
            ),
            onDaySelected: (day, events, holidays) {
              if (result
                  .containsKey(DateTime(day.year, day.month, day.day, 0))) {
                Scaffold.of(context).showBottomSheet(
                  (context) => Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 5,
                              blurRadius: 20)
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        )),
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(18),
                            child: Text(
                              DateFormat.MMMMd('ru-RU').format(day) +
                                  ', ${holidays[0]}',
                              style: Theme.of(context).textTheme.subtitle1,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            holidays[2],
                            maxLines: 3,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${holidays[1]}',
                                maxLines: 2,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
            availableGestures: AvailableGestures.horizontalSwipe,
            locale: 'Ru',
            startingDayOfWeek: StartingDayOfWeek.monday,
            holidays: _buildDays(posts),
            initialSelectedDay: DateTime.now(),
            builders: CalendarBuilders(
              holidayDayBuilder: (ctx, date, _) {
                return Container(
                  margin: EdgeInsets.all(_margin),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  child: Align(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: ListTile(
                  title: Text('Дни постов'),
                  leading: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ]),
      )),
    );
  }
}
