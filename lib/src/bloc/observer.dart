import 'package:bloc/bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:pilgrim/src/bloc/firestore_bloc.dart';

class CrashlyticsBlocObverser extends BlocObserver {
  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(error.toString(), stackTrace);
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (transition.nextState is FirestorePostStateError) {
      FirebaseCrashlytics.instance.recordError(
          (transition.nextState as FirestorePostStateError).exception,
          (transition.nextState as FirestorePostStateError).st);
    }
    super.onTransition(bloc, transition);
  }
}
