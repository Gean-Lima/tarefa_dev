import 'package:tarefa_dev/sources/entities/period.dart';

abstract class StorageInterface {
  getPeriods();

  storePeriod(Period period);

  updatePeriod(Period period);

  deletePeriod(String periodId);
}