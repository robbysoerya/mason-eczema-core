{{#use_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/use_freezed}}
{{^use_freezed}}import 'package:equatable/equatable.dart';{{/use_freezed}}
{{^use_freezed}}import 'package:json_annotation/json_annotation.dart';{{/use_freezed}}
{{#use_freezed}}part 'request_{{feature_name.snakeCase()}}_model.freezed.dart';{{/use_freezed}}

{{{request}}}