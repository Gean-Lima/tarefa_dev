import 'package:bloc/bloc.dart';
import 'package:tarefa_dev/sources/blocs/periods/periods_events.dart';
import 'package:tarefa_dev/sources/blocs/periods/periods_state.dart';
import 'package:tarefa_dev/sources/entities/period.dart';
import 'package:tarefa_dev/sources/services/storage_service.dart';

class PeriodsBloc extends Bloc<PeriodsEvent, PeriodsState> {
  StorageService storageService;

  PeriodsBloc({ required this.storageService }): super(PeriodsState.initial()) {
    on<PeriodsEventPeriods>(_getPeriods);

    on<PeriodsEventAdd>(_addPeriod);

    on<PeriodsEventUpdate>(_updatePeriod);

    on<PeriodsEventDelete>(_deletePeriod);
  }

  _getPeriods(PeriodsEventPeriods event, emit) async {
    try {
      emit(state.copyWith(loading: true));
      
      List<Period> periods = storageService.getPeriods();
      emit(state.copyWith(loading: false, periods: periods));
    }
    catch(e) {
      emit(state.copyWith(loading: false));
    }
  }

  _addPeriod(PeriodsEventAdd event, emit) async {
    try {
      List<Period> periods = await storageService.storePeriod(event.period);
      emit(state.copyWith(periods: periods));
    }
    catch(e) {}
  }

  _updatePeriod(PeriodsEventUpdate event, emit) async {
    try {
      List<Period> periods = await storageService.updatePeriod(event.period);
      emit(state.copyWith(periods: periods));
    }
    catch(e) {}
  }

  _deletePeriod(PeriodsEventDelete event, emit) async {
    try {
      List<Period> periods = await storageService.deletePeriod(event.periodId);
      emit(state.copyWith(periods: periods));
    }
    catch(e) {}
  }
}