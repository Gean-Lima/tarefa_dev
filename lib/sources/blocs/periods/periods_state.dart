import 'package:tarefa_dev/sources/entities/period.dart';

class PeriodsState {
  PeriodsState({
    required this.loading,
    required this.periods
  });

  final bool loading;
  final List<Period> periods;

  static PeriodsState initial() {
    return PeriodsState(
      loading: false, 
      periods: []
    );
  }

  PeriodsState copyWith({
    bool? loading,
    List<Period>? periods
  }) {
    return PeriodsState(
      loading: loading ?? this.loading,
      periods: periods ?? this.periods
    );
  }
}