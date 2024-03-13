import 'package:tarefa_dev/sources/entities/period.dart';

abstract class PeriodsEvent {}

class PeriodsEventLoading extends PeriodsEvent {}

class PeriodsEventPeriods extends PeriodsEvent {}

class PeriodsEventAdd extends PeriodsEvent {
  Period period;

  PeriodsEventAdd({required this.period});
}

class PeriodsEventUpdate extends PeriodsEvent {
  Period period;

  PeriodsEventUpdate({required this.period});
}

class PeriodsEventDelete extends PeriodsEvent {
  String periodId;

  PeriodsEventDelete({required this.periodId});
}