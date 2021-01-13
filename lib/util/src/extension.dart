import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Ex<T> on T {
  R let<R>(R Function(T) block) {
    return block(this);
  }

  T run(final T Function(T) block) {
    return block(this);
  }

  T apply(Function(T) block) {
    block(this);
    return this;
  }

  T also<R>(R Function(T) block) {
    block(this);
    return this;
  }
}

extension BoolEx on bool? {
  bool get elvis => this ?? false;
}

extension DoubleEx on double? {
  double get elvis => this ?? 0.0;
}

extension IntEx on int? {
  int get elvis => this ?? 0;
}

extension StringEx on String? {
  String get elvis => this ?? '';

  bool get isNullOrEmpty => (this?.isEmpty).elvis;
}

extension IterableEx<T> on Iterable<T?>? {
  T? get firstOrNull => (this?.isNotEmpty).elvis ? this?.first : null;

  T? get secondOrNull => this?.iterator.let((x) => Iterable.generate(2).every((_) => x.moveNext()) ? x.current : null);

  T? get thirdOrNull => this?.iterator.let((x) => Iterable.generate(3).every((_) => x.moveNext()) ? x.current : null);

  T? get lastOrNull => (this?.isNotEmpty).elvis ? this?.last : null;

  bool get isNullOrEmpty => (this?.isEmpty).elvis;
}

extension ListEx<T> on List<T>? {
  int? indexOfOrNull(T element, [int start = 0]) => (this?.contains(element)).elvis ? this?.indexOf(element, start) : null;

  T? find(String value) => this?.where((x) => x.toString() == value).firstOrNull;
}

extension WidgetEx on Widget {
  List<Widget> operator *(int n) => List.generate(n, (_) => this);
}
