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
  int get value => _value;

  void call(int val) => _value = _boundsCheck(val);

  @override
  String toString() => _value.toString();

  @override
  bool operator ==(Object other) {
    if (other is int) {
      if (_value == other) {
        return true;
      }
    }
    if (other is Subtype) {
      if (_value == other.value) {
        return true;
      }
    }
    return false;
  }

  dynamic operator +(Object other) {
    if (other is int) {
      _boundsCheck(_value += other);
    } else {
      try {
        _boundsCheck(_value += (other as Subtype).value);
      } on ArgumentError {
        rethrow;
      } catch (e) {
        throw ArgumentError(
            'AdaTypes:Subtype - the type supplied is not derived from Subtype - $e',
            'other');
      }
    }
    return this;
  }

  @override
  int get hashCode => _value.hashCode;

  int _boundsCheck(int val) {
    if (val < start || val > end) {
      throw ArgumentError(
          'AdaTypes:Subtype - the value supplied is not in the range of the subtype',
          'value');
    }
    return val;
  }
}
