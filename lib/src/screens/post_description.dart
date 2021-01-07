import 'package:pilgrim/src/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PostDescription extends StatefulWidget {
  final Post post;
  PostDescription({this.post});
  @override
  _PostDescriptionState createState() => _PostDescriptionState(post: post);
}

class EatDescriptionWidget extends StatelessWidget {
  const EatDescriptionWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: ListTile(
            title: Text('Рекомендуется воздержание от пищи'),
            leading: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.blueAccent,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            title: Text('Разрешена горячая растительная пища без масла'),
            leading: CircleAvatar(
              radius: 14,
              backgroundColor: Color(0xffECB800),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            title: Text('Сухоядение'),
            leading: CircleAvatar(
              radius: 14,
              backgroundColor: Color(0xff11E2BD),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            title: Text(
                'Разрешена горячая растительная пища с растительным маслом'),
            leading: CircleAvatar(
              radius: 14,
              backgroundColor: Color(0xffEC7100),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            title: Text(
                'Разрешена рыба и горячая растительная пища с растительным маслом'),
            leading: CircleAvatar(
              radius: 14,
              backgroundColor: Color(0xff71BBFF),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            title: Text(
                'Разрешена горячая растительная пища с растительным маслом, немного красного виноградного вина'),
            leading: CircleAvatar(
              radius: 14,
              backgroundColor: Color(0xffDB3939),
            ),
          ),
        ),
      ],
    );
  }
}

class _PostDescriptionState extends State<PostDescription> {
  final Post post;
  CalendarController _controller;
  Color _color = Colors.white;
  Map<DateTime, List<dynamic>> result = {};

  _buildDays(Map<String, List<Map<String, dynamic>>> map) {
    map.forEach((key, value) {
      value.forEach((element) {
        result.putIfAbsent(
            element['date'], () => [key, element['description']]);
      });
    });
    return result;
  }

  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  _PostDescriptionState({this.post});
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
    final Post args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: IconThemeData(color: Colors.blue),
                elevation: 0,
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height / 10,
                floating: true,
                pinned: false,
                title: Text(
                  args.name,
                  style: Theme.of(context).textTheme.headline6.copyWith(),
                  textScaleFactor: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ExpansionTile(
                          title: Text('Описание'),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                args.description ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(),
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('Когда проходит пост',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Начало'),
                              SizedBox(
                                height: 5,
                              ),
                              Text(DateFormat.yMMMd('ru').format(args.start))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Конец'),
                              SizedBox(),
                              Text(DateFormat.yMMMd('ru').format(args.end))
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    TableCalendar(
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarStyle: CalendarStyle(),
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: Colors.black),
                          weekendStyle: TextStyle(color: Colors.black),
                          dowTextBuilder: (date, data) {
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
                      availableGestures: AvailableGestures.horizontalSwipe,
                      locale: 'Ru',
                      calendarController: _controller,
                      holidays: _buildDays(args.days),
                      headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonVisible: false,
                      ),
                      endDay: args.end,
                      headerVisible: true,
                      initialSelectedDay: args.start,
                      initialCalendarFormat: CalendarFormat.month,
                      startDay: args.start,
                      onDaySelected: (day, events, holidays) {
                        Scaffold.of(context).showBottomSheet(
                          (context) => ValueListenableBuilder<Box>(
                            valueListenable: Hive.box('datetimes').listenable(),
                            builder: (ctx, val, w) => Container(
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
                                        DateFormat.MMMMd('ru-RU').format(day),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Я соблюдал пост в этот день',
                                          maxLines: 2,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        IgnorePointer(
                                          ignoring: args.start
                                              .isAfter(DateTime.now()),
                                          child: Switch(
                                            value: val.get(
                                                  DateTime(day.year, day.month,
                                                          day.day, 0)
                                                      .toString(),
                                                ) ??
                                                false,
                                            onChanged: (v) {
                                              val.containsKey(
                                                DateTime(
                                                  day.year,
                                                  day.month,
                                                  day.day,
                                                  0,
                                                ).toString(),
                                              )
                                                  ? val.delete(
                                                      (DateTime(
                                                              day.year,
                                                              day.month,
                                                              day.day,
                                                              0)
                                                          .toString()),
                                                    )
                                                  : val.put(
                                                      DateTime(
                                                              day.year,
                                                              day.month,
                                                              day.day,
                                                              0)
                                                          .toString(),
                                                      v);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        holidays[1],
                                        maxLines: 4,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      builders: CalendarBuilders(
                        holidayDayBuilder: (context, date, events) {
                          var d = DateTime(date.year, date.month, date.day, 0);
                          var event = result[d];
                          if (event[0] ==
                              'Разрешена горячая растительная пища с растительным маслом') {
                            _color = Color(0xffEC7100);
                          } else if (event[0] ==
                              'Разрешена горячая растительная пища без масла') {
                            _color = Color(0xffECB800);
                          } else if (event[0] ==
                              'Сухоядение (постный хлеб, фрукты, овощи, компоты)') {
                            _color = Color(0xff11E2BD);
                          } else if (event[0] ==
                              'Рекомендуется воздержание от пищи') {
                            _color = Colors.blueAccent;
                          } else if (event[0] ==
                              'Разрешена горячая растительная пища с растительным маслом, немного красного виноградного вина') {
                            _color = Color(0xffDB3939);
                          } else if (event[0] ==
                              'Разрешена рыба и горячая растительная пища с растительным маслом') {
                            _color = Color(0xff71BBFF);
                          }
                          return Container(
                            margin: EdgeInsets.all(_margin),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _color,
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
                    const EatDescriptionWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
