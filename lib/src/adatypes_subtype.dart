/*
 * Package : adatypes
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 14/05/2023
 * Copyright :  S.Hamblett
 */

class Subtype {
  Subtype(this.start, this.end, {int initialValue = 0}) {
    value = initialValue;
  }

  final int end;

  final int start;

  int value = 0;
}
