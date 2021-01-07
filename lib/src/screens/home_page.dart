import 'dart:ui';

import 'package:pilgrim/src/bloc/firestore_bloc.dart';
import 'package:pilgrim/src/models/post.dart';
import 'package:pilgrim/src/repository/app_repository.dart';
import 'package:pilgrim/src/screens/donation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AppRepository _appRepository;
  Post _post = Post(days: {});
  List<Post> _posts;
  double textScaleFactor = 1;
  double positionedOffset = 2;
  double iconSize = 18;
  double circleSize = 20;
  bool _isVisible = false;
  String _content = '';
  double _eatPaddibg = 20;

  static const months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];
  ValueNotifier<String> _text = ValueNotifier('');

  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _text.value = months[DateTime.now().month - 1];
    _calendarController = CalendarController();
    _appRepository = AppRepository();
    InAppPurchaseConnection.enablePendingPurchases();
    _appRepository.initPlugin();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  Map<DateTime, List<dynamic>> _buildHolydays() {
    Map<DateTime, List<dynamic>> days = {};
    final posts = _posts;
    posts.forEach((element) {
      for (int i = 0; i <= element.end.difference(element.start).inDays; i++) {
        days.putIfAbsent(element.start.add(Duration(days: i)), () => [i + 1]);
      }
    });
    return days;
  }

  Widget _buildCircleAvatarcontent(BuildContext context) {
    Widget _widget;
    final now = _calendarController.selectedDay != null
        ? DateTime(
            _calendarController.selectedDay?.year,
            _calendarController.selectedDay?.month,
            _calendarController.selectedDay?.day)
        : DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 0);

    for (var post in _posts) {
      if (now.isBefore(post.end) && now.isAfter(post.start) ||
          now == post.start ||
          now == post.end) {
        _post = post;
        _isVisible = true;
        _content = post.days.keys.firstWhere(
            (element) =>
                post.days.values
                    .firstWhere(
                        (element) =>
                            element
                                .firstWhere((e) => e['date'] == now,
                                    orElse: () => {})
                                .length >
                            0,
                        orElse: () => [])
                    .length >
                0,
            orElse: () => '');
        print(_content);
        _widget = ValueListenableBuilder<Box>(
            valueListenable: Hive.box('datetimes').listenable(),
            builder: (context, val, child) => CircularPercentIndicator(
                  animateFromLastPercent: true,
                  restartAnimation: false,
                  lineWidth: 10,
                  animation: true,
                  progressColor: Color(0xffFFC01D),
                  startAngle: 270,
                  backgroundColor: Colors.transparent,
                  percent: val.keys.where((element) {
                        if (element != 'init') {
                          return (DateTime.parse(element).isAfter(post.start) &&
                                  DateTime.parse(element).isBefore(post.end)) ||
                              DateTime.parse(element) == post.start ||
                              DateTime.parse(element) == post.end;
                        } else
                          return false;
                      }).length /
                      (post.end.difference(post.start).inDays.toDouble() + 1),
                  radius: MediaQuery.of(context).size.width / 1.5,
                  center: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        post.name,
                        style: Theme.of(context).textTheme.subtitle1,
                        textScaleFactor: textScaleFactor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${now.difference(post.start).inDays + 1}-й день',
                          style: Theme.of(context).textTheme.headline3,
                          textScaleFactor: textScaleFactor),
                      SizedBox(
                        height: 5,
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: !val.containsKey(DateTime(
                                      _calendarController.selectedDay?.year,
                                      _calendarController.selectedDay?.month,
                                      _calendarController.selectedDay?.day)
                                  .toString())
                              ? FlatButton(
                                  onPressed: DateTime.now().isBefore(post.start)
                                      ? null
                                      : () {
                                          val.containsKey(DateTime(
                                                      _calendarController
                                                          .selectedDay?.year,
                                                      _calendarController
                                                          .selectedDay?.month,
                                                      _calendarController
                                                          .selectedDay?.day)
                                                  .toString())
                                              ? val.delete(DateTime(
                                                      _calendarController
                                                          .selectedDay?.year,
                                                      _calendarController
                                                          .selectedDay?.month,
                                                      _calendarController
                                                          .selectedDay?.day)
                                                  .toString())
                                              : val.put(
                                                  DateTime(_calendarController.selectedDay?.year, _calendarController.selectedDay?.month, _calendarController.selectedDay?.day)
                                                      .toString(),
                                                  true);
                                        },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Сегодня я соблюдал пост',
                                      textScaleFactor: textScaleFactor,
                                    ),
                                  ),
                                  color: Color(0xffFFC01D),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                )
                              : Icon(Icons.check_circle_outline,
                                  color: Colors.green),
                        ),
                      ),
                      FlatButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed('/all/post', arguments: post),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Подробнее о посте',
                              textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                color: Color(0xff007BEC),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.info_outline_rounded,
                              color: Color(0xff007BEC),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                    ],
                  ),
                ));
      }
    }
    if (_widget == null) {
      int _min = 1000;
      _posts.forEach(
        (post) {
          (post.start.difference(now).inDays < _min && now.isBefore(post.start))
              // ignore: unnecessary_statements
              ? {_min = post.start.difference(now).inDays, _post = post}
              // ignore: unnecessary_statements
              : null;
        },
      );
      _widget = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ближайший пост',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
              '$_min ${_min.toString().endsWith('1') && !_min.toString().endsWith('11') ? 'день' : (_min.toString().endsWith('2') && !_min.toString().endsWith('12') || _min.toString().endsWith('3') && !_min.toString().endsWith('13') || _min.toString().endsWith('4')) ? 'дня' : 'дней'}',
              style: Theme.of(context).textTheme.headline3),
          SizedBox(
            height: 5,
          ),
          FlatButton(
            onPressed: () =>
                Navigator.of(context).pushNamed('/all/post', arguments: _post),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_post.name),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.info_outline_rounded),
                ],
              ),
            ),
            color: Color(0xffFFC01D),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
          Builder(
            builder: (ctx) => FlatButton(
              onPressed: now.isBefore(_post.start)
                  ? () => _appRepository
                      .scheduleNotification(
                          _post.start.add(Duration(hours: 7)), _post.name)
                      .then((v) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Уведомление запланированно'))))
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Напомнить',
                      style: TextStyle(
                        color: Color(0xff007BEC),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.query_builder_rounded,
                      color: Color(0xff007BEC),
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
            ),
          ),
        ],
      );
    }

    return _widget;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heigth = size.height;
    final width = size.width;
    print(heigth.toInt() / width.toInt());
    print(16 / 9);

    if (heigth.toInt() / width.toInt() > 16 / 9) {
    } else {
      textScaleFactor = 0.9;
      positionedOffset = 0;
      iconSize = 14;
      circleSize = 18;
      _eatPaddibg = 10;
    }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    return BlocBuilder<FirestorePostBLoC, FirestorePostState>(
        builder: (context, state) {
      if (state is FirestorePostStateLoaded) _posts = state.posts;
      return Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff007BEC),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // FlatButton.icon(
                        //   onPressed: () {
                        //     Navigator.of(context)
                        //         .pushNamed('/calendar', arguments: _posts);
                        //   },
                        //   icon: Icon(
                        //     Icons.calendar_today_rounded,
                        //     color: Colors.white,
                        //   ),
                        //   label: ValueListenableBuilder(
                        //     valueListenable: _text,
                        //     builder: (ctx, val, child) => Text(
                        //       val,
                        //       style: TextStyle(color: Colors.white),
                        //     ),
                        //   ),
                        // ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => DonationScreen())),
                          child: Text(
                            'Пожертвовать',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ValueListenableBuilder<Box>(
                      valueListenable: Hive.box('datetimes').listenable(),
                      builder: (context, val, child) => TableCalendar(
                        onDaySelected: (t, l1, l2) {
                          setState(() {
                            t.subtract(Duration(hours: 12));
                          });
                        },
                        daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: TextStyle(color: Colors.white),
                            weekendStyle: TextStyle(color: Colors.white),
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
                        startDay: DateTime(2000),
                        holidays: _buildHolydays(),
                        locale: 'Ru',
                        calendarStyle: CalendarStyle(),
                        initialCalendarFormat: CalendarFormat.week,
                        headerVisible: false,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        calendarController: _calendarController,
                        builders: CalendarBuilders(
                          todayDayBuilder: (ctx, date, _) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white38,
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
                          dayBuilder: (ctx, date, _) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              child: Align(
                                child: Text(
                                  '${date.day}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                alignment: Alignment.center,
                              ),
                            );
                          },
                          holidayDayBuilder: (ctx, date, _) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              child: Align(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${date.day}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: 3),
                                  ],
                                ),
                                alignment: Alignment.center,
                              ),
                            );
                          },
                          selectedDayBuilder: (ctx, date, _) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white54,
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
                          markersBuilder: (ctx, date, events, holidays) {
                            final children = <Widget>[];
                            if (holidays.isNotEmpty) {
                              for (var l in holidays) {
                                children.add(
                                  Positioned(
                                    left: positionedOffset,
                                    top: positionedOffset,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      alignment: Alignment.center,
                                      height: circleSize ,
                                      padding: EdgeInsets.all(0),
                                      width: circleSize ,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: date.isBefore(
                                        DateTime.now(),
                                      )
                                          ? val.containsKey(date.toString())
                                              ? Icon(Icons.done, size: iconSize)
                                              : Icon(
                                                  Icons.clear,
                                                  size: iconSize,
                                                )
                                          : Text(
                                              l.toString(),
                                              textScaleFactor: textScaleFactor,
                                            ),
                                    ),
                                  ),
                                );
                              }
                            }
                            return children;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: MediaQuery.of(context).size.width / 2 / 1.3,
                    child: _buildCircleAvatarcontent(context)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/pure.png',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed('/all', arguments: _posts),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(_eatPaddibg),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.90),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Text(_content),
                      ),
                      visible: _isVisible,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffFFC01D).withOpacity(0.5),
                            offset: Offset(0, 2),
                            blurRadius: 10,
                            spreadRadius: 0.5,
                          )
                        ],
                        borderRadius: BorderRadius.circular(46),
                        color: Color(0xffFFC01D),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Все посты',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
