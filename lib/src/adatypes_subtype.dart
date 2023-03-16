/*
 * Package : adatypes
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 14/05/2023
 * Copyright :  S.Hamblett
 */

abstract class Subtype {
  Subtype.set(this.start, this.end,
      {int initialValue = 0, strictTyping = false}) {
    _value = initialValue;
    _strictTyping = strictTyping;
  }

  final int end;

  final int start;

  int _value = 0;
  int get value => _value;

  bool _strictTyping = false;

  bool _initialised = false;

  void call(int val) {
    _value = _boundsCheck(val);
    _initialised = true;
  }

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
      _operationValid(_value += other);
    } else if (_strictTyping) {
      final tThis = runtimeType;
      final tOther = other.runtimeType;
      if (tThis != tOther) {
        throw ArgumentError(
            'AdaTypes:Subtype - strict typing - the type supplied is different from the subject type',
            'other');
      } else {
        _operationValid(_value += (other as Subtype).value);
      }
    } else {
      _tryAssignment(other);
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

  int _operationValid(int val) {
    if (!_initialised) {
      _value = 0;
      throw StateError(
          'AdaTypes:Subtype - the subtype has not been assigned an initial value');
    }
    _boundsCheck(val);
    return val;
  }

  void _tryAssignment(Object other) {
    try {
      _operationValid(_value += (other as Subtype).value);
    } on ArgumentError {
      rethrow;
    } catch (e) {
      throw ArgumentError(
          'AdaTypes:Subtype - the type supplied is not derived from Subtype - $e',
          'other');
    }
  }
}
