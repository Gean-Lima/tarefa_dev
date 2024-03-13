import 'package:tarefa_dev/sources/entities/period.dart';

class DialogPeriodState {
  DialogPeriodState({
    required this.edition,
    required this.name,
    required this.start,
    required this.end,
    required this.category,
    required this.meta1,
    required this.meta2
  });

  final bool edition;
  final String name;
  final DateTime start;
  final DateTime end;
  final PeriodCategory category;
  final int meta1;
  final int meta2;

  static DialogPeriodState initial() {
    return DialogPeriodState(
      edition: false,
      name: '',
      start: DateTime.now(),
      end: DateTime.now(),
      category: PeriodCategory.category1,
      meta1: 0,
      meta2: 0
    );
  }

  DialogPeriodState copyWith({
    bool? edition,
    String? name,
    DateTime? start,
    DateTime? end,
    PeriodCategory? category,
    int? meta1,
    int? meta2
  }) {
    return DialogPeriodState(
      edition: edition ?? this.edition,
      name: name ?? this.name,
      start: start ?? this.start,
      end: end ?? this.end,
      category: category ?? this.category,
      meta1: meta1 ?? this.meta1,
      meta2: meta2 ?? this.meta2,
    );
  }
}