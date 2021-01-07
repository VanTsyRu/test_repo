import 'package:pilgrim/src/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class AllPostsPage extends StatefulWidget {
  @override
  _AllPostsPageState createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  int currentSegment = 0;
  void onValueChanged(int newValue) {
    setState(() {
      currentSegment = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Post> posts = ModalRoute.of(context).settings.arguments;
    final children = <int, Widget>{
      0: Text('Предстоящие'),
      1: Text('История'),
    };

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    print(Hive.box('datetimes').toMap().keys);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Все посты',
          style: TextStyle(color: Colors.blueAccent),
        ),
        iconTheme: IconThemeData(color: Colors.blueAccent),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CupertinoSlidingSegmentedControl<int>(
                children: children,
                onValueChanged: onValueChanged,
                groupValue: currentSegment,
              ),
            ),
          ),
          if (currentSegment == 0)
            for (var post in posts)
              ListTile(
                onTap: () => Navigator.of(context)
                    .pushNamed('/all/post', arguments: post),
                title: Text(post.name),
                subtitle: Text(
                  post.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          if (currentSegment == 1)
            for (var post in posts)
              if (post.start.isBefore(
                    DateTime.now(),
                  ) &&
                  Hive.box('datetimes').toMap().keys.where((element) {
                        if (element != 'init') {
                          return (DateTime.parse(element).isBefore(post.end) &&
                                  DateTime.parse(element).isAfter(post.start) ||
                              DateTime.parse(element) == post.start);
                        }
                        return false;
                      }).length !=
                      0)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        post.name +
                            ' - ${Hive.box('datetimes')
                                      .toMap()
                                      .keys
                                      .where(
                                        (element){
                                          if(element != 'init'){return DateTime.parse(element)
                                                    .isBefore(post.end) &&
                                                DateTime.parse(element)
                                                    .isAfter(post.start) ||
                                            DateTime.parse(element) ==
                                                post.start ||
                                            DateTime.parse(element) ==   
                                                post.end;} else return false;} 
                                      )
                                      .length} из ${post.end.difference(post.start).inDays + 1} дней',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: LinearProgressIndicator(
                          value: (Hive.box('datetimes')
                                      .toMap()
                                      .keys
                                      .where(
                                        (element){
                                          if(element != 'init'){return DateTime.parse(element)
                                                    .isBefore(post.end) &&
                                                DateTime.parse(element)
                                                    .isAfter(post.start) ||
                                            DateTime.parse(element) ==
                                                post.start ||
                                            DateTime.parse(element) ==
                                                post.end;} else return false;} 
                                      )
                                      .length +
                                  1) /
                              (post.end.difference(post.start).inDays + 1)),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
