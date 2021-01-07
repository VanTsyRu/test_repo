import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget{
  ErrorPage({this.e});
  final Exception e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Произошла ошибка при загрузке'),
      ),
    );
  }

}