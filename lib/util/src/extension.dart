import 'dart:math';

import 'package:flutter/material.dart';

import '../util.dart';

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

extension BoolNullableEx on bool? {
  bool get elvis => this ?? false;
}

extension DoubleNullableEx on double? {
  double get elvis => this ?? 0.0;
}

extension DoubleEx on double {
  double getScrollOffset({double height = UI.expandedAppBarHeight}) {
    final offset = (this - UI.collapsedAppBarHeight) / (height - UI.collapsedAppBarHeight);
    return 1 - max(0.0, min(1.0, offset));
  }
}

extension IntNullableEx on int? {
  int get elvis => this ?? 0;
}

extension StringNullableEx on String? {
  String get elvis => this ?? '';

  bool get isset => (this?.isNotEmpty).elvis;

  bool get isNullOrEmpty => !isset;
}

extension IterableNullableEx<T> on Iterable<T?>? {
  T? get firstOrNull => (this?.isNotEmpty).elvis ? this?.first : null;

  T? get secondOrNull => this?.iterator.let((x) => Iterable.generate(2).every((_) => x.moveNext()) ? x.current : null);

  T? get thirdOrNull => this?.iterator.let((x) => Iterable.generate(3).every((_) => x.moveNext()) ? x.current : null);

  T? get lastOrNull => (this?.isNotEmpty).elvis ? this?.last : null;

  bool get isset => !(this?.isNotEmpty).elvis;

  bool get isNullOrEmpty => !isset;
}

extension WidgetNullableEx on Widget? {
  Widget get elvis => this ?? UI.empty;
}

extension WidgetEx on Widget {
  List<Widget> operator *(int n) => List.generate(n, (_) => this);
}

extension ColorNullableEx on Color? {
  Color get elvis => this ?? Colors.transparent;
}

extension ColorEx on Color {
  Color withHalfOpacity() => withOpacity(opacity / 2);
}

extension TextStyleNullableEx on TextStyle? {
  TextStyle get elvis => this ?? UI.textStyle;
}
