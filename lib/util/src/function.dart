import '../util.dart';

String get now => DateTime.now().toString().split(' ').lastOrNull.elvis;
