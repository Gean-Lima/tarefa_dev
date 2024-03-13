import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarefa_dev/sources/entities/period.dart';
import 'package:tarefa_dev/sources/interfaces/storage_interface.dart';

class StorageService implements StorageInterface {
  late SharedPreferences _storage;

  StorageService() {
    _initStorage();
  }

  _initStorage() async {
    _storage = await SharedPreferences.getInstance();
  }

  @override
  List<Period> getPeriods() {
    String? periodsJson = _storage.getString('periods') ?? '[]';
    List<dynamic> periodsConverted = jsonDecode(periodsJson);
    List<Period> periods = periodsConverted.map((period) => Period.fromMap(period)).toList();

    return periods;
  }

  @override
  Future<List<Period>> storePeriod(Period period) async {
    String? periodsJson = _storage.getString('periods') ?? '[]';
    List<dynamic> periodsConverted = jsonDecode(periodsJson);
    
    periodsConverted.add(period.toMap());
    
    periodsJson = jsonEncode(periodsConverted);

    await _storage.setString('periods', periodsJson);

    List<Period> periods = periodsConverted.map((period) => Period.fromMap(period)).toList();

    return periods;
  }

  @override
  Future<List<Period>> updatePeriod(Period period) async {
    String? periodsJson = _storage.getString('periods') ?? '[]';
    List<dynamic> periodsConverted = jsonDecode(periodsJson);
    List<Period> periods = periodsConverted.map((periodItem) => Period.fromMap(periodItem)).toList();

    periods.forEach((periodItem) {
      if (periodItem.id == period.id) {
        periodItem.name = period.name;
        periodItem.start = period.start;
        periodItem.end = period.end;
        periodItem.category = period.category;
        periodItem.meta1 = period.meta1;
        periodItem.meta2 = period.meta2;
      }
    });

    periodsConverted = periods.map((periodItem) => periodItem.toMap()).toList();
    periodsJson = jsonEncode(periodsConverted);
    await _storage.setString('periods', periodsJson);

    return periods;
  }
  
  @override
  Future<List<Period>> deletePeriod(String periodId) async {
    String? periodsJson = _storage.getString('periods') ?? '[]';
    List<dynamic> periodsConverted = jsonDecode(periodsJson);
    List<Period> periods = periodsConverted.map((period) => Period.fromMap(period)).toList();

    Period period = periods.firstWhere((period) => period.id == periodId);
    periods.remove(period);

    periodsConverted = periods.map((period) => period.toMap()).toList();
    periodsJson = jsonEncode(periodsConverted);
    await _storage.setString('periods', periodsJson);

    return periods;
  }
}