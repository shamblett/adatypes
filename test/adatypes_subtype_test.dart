import 'dart:io';
import 'dart:developer';
import 'package:test/test.dart';
import 'package:adatypes/adatypes.dart';

typedef EggsInBox = Subtype;
typedef PeasInPod = Subtype;

void main() {
  var numPeas = PeasInPod(0, 20, initialValue: 0);
  test('Type equivalence', () {
  var numEggs = EggsInBox(0, 10, initialValue: 5);
  var numPeas = PeasInPod(0, 20, initialValue: 0);
  Type myType = PeasInPod;
  print(numPeas.runtimeType);
});

  test('VM details', () async
  {
    final serviceInfo = await Service.getInfo();
    print(serviceInfo);
  });

}
