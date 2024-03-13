import 'package:validators/validators.dart';

mixin ValidationsAppMixin {
  String? isNotEmpty(String? value, { String? message}) {
    if (value == null || value.isEmpty) return message ?? 'Preencha o campo nome!';

    return null;
  }

  String? isNotNumber(String? value, { String? message}) {
    if (value == null || !isNumeric(value) ) return message ?? 'Digite um número valido!';

    return null;
  }

  String? combine(List<String? Function()> funcs) {
    for (final func in funcs) {
      String? result = func();
      if (result != null) return result;
    }

    return null;
  }
}