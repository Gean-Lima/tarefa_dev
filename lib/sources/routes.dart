import 'package:flutter/material.dart';
import 'package:tarefa_dev/sources/pages/configurations/configurations_page.dart';


class RoutesApp {
  static String configurations = '/configurations';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/configurations': (BuildContext context) => const ConfigurationsPage()
  };
}