
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
    var numEggs = EggsInBox();
    numEggs(4);
    var numPeas = PeasInPod();
    numPeas(15);
    Type peasType = PeasInPod;
    Type eggsType = EggsInBox;
    expect(peasType == eggsType, isFalse);
    print('Number of peas is $numPeas');
  });
}
