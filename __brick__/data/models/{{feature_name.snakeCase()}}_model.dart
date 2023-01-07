import 'package:{{package_name}}/core/domain/entities/{{feature_name.snakeCase()}}_entity.dart';
{{^use_freezed}}import 'package:equatable/equatable.dart';{{/use_freezed}}
{{^use_freezed}}import 'package:json_annotation/json_annotation.dart';{{/use_freezed}}
{{#use_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/use_freezed}}

{{#use_freezed}}part '{{feature_name.snakeCase()}}_model.freezed.dart';{{/use_freezed}}
part '{{feature_name.snakeCase()}}_model.g.dart';

{{{model}}}