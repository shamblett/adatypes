/*
 * Package : adatypes
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 14/05/2023
 * Copyright :  S.Hamblett
 */

abstract class Subtype {
  Subtype.set(this.start, this.end, {int initialValue = 0}) {
    _value = initialValue;
  }

  final int end;

  final int start;

  int _value = 0;

  void call(int val) => _value = val;

  @override
  String toString() => _value.toString();
}
