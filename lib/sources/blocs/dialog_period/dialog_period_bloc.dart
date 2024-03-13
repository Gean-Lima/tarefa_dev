import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarefa_dev/sources/blocs/dialog_period/dialog_period_event.dart';
import 'package:tarefa_dev/sources/blocs/dialog_period/dialog_period_state.dart';

class DialogPeriodBloc extends Bloc<DialogPeriodEvent, DialogPeriodState> {
  DialogPeriodBloc(): super(DialogPeriodState.initial()) {
    on<DialogPeriodUpdate>((event, emit) => emit(state.copyWith(
      name: event.name,
      start: event.start,
      end: event.end,
      category: event.category,
      meta1: event.meta1,
      meta2: event.meta2,
      edition: event.edition
    )));
  }

}