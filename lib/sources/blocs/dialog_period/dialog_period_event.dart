import 'package:tarefa_dev/sources/entities/period.dart';

abstract class DialogPeriodEvent {}

class DialogPeriodUpdate extends DialogPeriodEvent {
  bool? edition;
  String? name;
  DateTime? start;
  DateTime? end;
  PeriodCategory? category;
  int? meta1;
  int? meta2;

  DialogPeriodUpdate({
    this.edition,
    this.name,
    this.start,
    this.end,
    this.category,
    this.meta1,
    this.meta2
  });
}