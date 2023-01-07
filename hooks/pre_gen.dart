import 'dart:convert';

import 'package:json_to_dart/json_to_dart.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;
  final model = Map<String, dynamic>.from(context.vars['model']);
  final modelGenerator = new ModelGenerator(featureName);
  final entityGenerator = new ModelGenerator(featureName,true);
  DartCode dartModelCode = modelGenerator.generateDartClasses(jsonEncode(model));
  DartCode dartEntityCode = entityGenerator.generateDartClasses(jsonEncode(model));
  context.vars = {
    ...context.vars,
    'model': dartModelCode.code,
    'entity': dartEntityCode.code,
  };
}
