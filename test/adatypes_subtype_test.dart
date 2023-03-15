// ignore_for_file: unrelated_type_equality_checks

import 'package:test/test.dart';
import 'package:adatypes/adatypes.dart';

class ADozen extends Subtype {
  ADozen() : super.set(0, 12);
}

class AScore extends Subtype {
  AScore() : super.set(0, 20);
}

typedef EggsInBox = ADozen;
typedef PeasInPod = AScore;

void main() {
  test('Type equivalence', () {
    final numEggs = EggsInBox();
    numEggs(4);
    final numPeas = PeasInPod();
    numPeas(15);
    Type peasType = PeasInPod;
    Type eggsType = EggsInBox;
    expect(peasType == eggsType, isFalse);
  });

  test('Range check on initialisation', () {
    final numEggs = EggsInBox();
    var exceptionRaised = false;
    try {
      numEggs(40);
    } on ArgumentError catch (e) {
      exceptionRaised = true;
      print(e);
    }
    expect(exceptionRaised, isTrue);
    expect(numEggs.value, 0);
  });

  test('Equality', () {
    final numEggs1 = EggsInBox();
    numEggs1(10);
    final numEggs2 = EggsInBox();
    numEggs2(10);
    expect(numEggs1 == numEggs2, isTrue);
    expect(numEggs1 == 10, isTrue);
    expect(numEggs2 == 40, isFalse);
  });

  test('Addition', () {
    var exceptionRaised = false;
    var numEggs1 = EggsInBox();
    numEggs1(3);
    var numEggs2 = EggsInBox();
    numEggs2(4);
    numEggs1 += numEggs2;
    numEggs2 += 5;
    expect(numEggs1 == 7, isTrue);
    expect(numEggs2 == 9, isTrue);
    try {
      numEggs2 += 10;
    } on ArgumentError catch (e) {
      exceptionRaised = true;
      print('Subtype + integer - $e');
    }
    try {
      numEggs2 += numEggs1;
    } on ArgumentError catch (e) {
      exceptionRaised = true;
      print('Subtype + Subtype - $e');
    }
    expect(exceptionRaised, isTrue);
    exceptionRaised = false;
    try {
      numEggs2 += 0.0;
    } on ArgumentError catch (e) {
      exceptionRaised = true;
      print('Subtype + non Subtype - $e');
    }
    expect(exceptionRaised, isTrue);
  });
}
