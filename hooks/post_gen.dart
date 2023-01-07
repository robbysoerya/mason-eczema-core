import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final directory = Directory.current.path;
  List<String> folders;
  if (Platform.isWindows) {
    folders = directory.split(r'\').toList();
  } else {
    folders = directory.split('/').toList();
  }
  final libIndex = folders.indexWhere((folder) => folder == 'lib');
  final root = folders.sublist(0, libIndex).join('/').toString();
  final buildRunnerProcess = await Process.start(
    'flutter',
    ['pub', 'run', 'build_runner', 'build'],
    runInShell: true,
    workingDirectory: root,
  );
  final reformatProcess = await Process.start(
    'dart',
    ['format', '.'],
    runInShell: true,
    workingDirectory: root,
  );
  await stdout.addStream(buildRunnerProcess.stdout);
  await stderr.addStream(buildRunnerProcess.stderr);
  await stdout.addStream(reformatProcess.stdout);
  await stderr.addStream(reformatProcess.stderr);
}
