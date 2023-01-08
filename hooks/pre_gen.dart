import 'dart:convert';

import 'package:json_to_dart/json_to_dart.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;
  final useFreezed = context.vars['use_freezed'] as bool;
  final useRequest = context.vars['use_request'] as bool;

  final model = Map<String, dynamic>.from(context.vars['model']);
  final modelGenerator = new ModelGenerator(featureName, false, useFreezed);
  final entityGenerator = new ModelGenerator(featureName, true, useFreezed);
  DartCode dartModelCode =
      modelGenerator.generateDartClasses(jsonEncode(model));
  DartCode dartEntityCode =
      entityGenerator.generateDartClasses(jsonEncode(model));

  if (useRequest) {
    final reqModelGenerator = new ModelGenerator(
      featureName,
      false,
      useFreezed,
      useRequest,
    );

    DartCode dartReqModelCode =
        reqModelGenerator.generateDartClasses(jsonEncode(model));

    context.vars = {
      ...context.vars,
      'request': dartReqModelCode.code,
    };
  }
  context.vars = {
    ...context.vars,
    'model': dartModelCode.code,
    'entity': dartEntityCode.code,
  };
}
