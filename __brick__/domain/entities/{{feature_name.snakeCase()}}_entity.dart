{{^use_freezed}}import 'package:equatable/equatable.dart';{{/use_freezed}}
{{#use_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/use_freezed}}
{{#use_freezed}}part '{{feature_name.snakeCase()}}_entity.freezed.dart';{{/use_freezed}}
{{{entity}}}