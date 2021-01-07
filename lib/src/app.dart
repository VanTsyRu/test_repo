import 'package:pilgrim/src/bloc/firestore_bloc.dart';
import 'package:pilgrim/src/repository/firestore_repository.dart';
import 'package:pilgrim/src/screens/export_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';

class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FirestoreRepository(),
      child: BlocProvider(
        create: (context) =>
            FirestorePostBLoC(context.read<FirestoreRepository>())
              ..add(ReadFirestorePostEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/calendar': (_) => FullCalendar(),
            '/': (_) {
              return BlocBuilder<FirestorePostBLoC, FirestorePostState>(
                  builder: (context, state) {
                if (state is FirestorePostStateError) {
                  return ErrorPage();
                }
                if (state is FirestorePostStateLoaded) {
                  if (Hive.box('datetimes').get('init') == 1) {
                    return HomePage();
                  } else
                    return MyApp();
                }
                return SplashScreen();
              });
            },
            '/all': (_) => AllPostsPage(),
            '/all/post': (_) => PostDescription(),
          },
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('ru'),
          ],
          theme: ThemeData(
            visualDensity: VisualDensity.compact,
          ),
        ),
      ),
    );
  }
}
