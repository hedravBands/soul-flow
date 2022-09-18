import 'dart:io';

String fileReader({required String folder, required String name}) =>
    File('lib/constant/$folder/$name').readAsStringSync();
