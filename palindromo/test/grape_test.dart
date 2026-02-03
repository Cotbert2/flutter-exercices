import 'package:flutter_test/flutter_test.dart';
import 'package:palindromo/controller/grape_controller.dart';
import 'package:palindromo/model/grape_model.dart';

void main() {
  test('tipo A tamaño 1', () {
    GrapeModel grape = GrapeModel(kind: true, size: true);
    expect(GrapeController.getInitialPrice(grape), 20);
  });

  test('tipo A tamaño 2', () {
    GrapeModel grape = GrapeModel(kind: true, size: false);
    expect(GrapeController.getInitialPrice(grape), 30);
  });

  test('tipo B tamaño 1', () {
    GrapeModel grape = GrapeModel(kind: false, size: true);
    expect(GrapeController.getInitialPrice(grape), -30);
  });

  test('tipo B tamaño 2', () {
    GrapeModel grape = GrapeModel(kind: false, size: false);
    expect(GrapeController.getInitialPrice(grape), -50);
  });

  test('verificar que tipo A siempre suma', () {
    GrapeModel grape1 = GrapeModel(kind: true, size: true);
    GrapeModel grape2 = GrapeModel(kind: true, size: false);
    expect(GrapeController.getInitialPrice(grape1) > 0, true);
    expect(GrapeController.getInitialPrice(grape2) > 0, true);
  });
}
