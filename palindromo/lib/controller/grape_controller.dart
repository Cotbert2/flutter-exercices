import './../model/grape_model.dart';

class GrapeController {
  static int getInitialPrice(GrapeModel grape){
    if (grape.kind) return grape.size ? 20 : 30;

    return grape.size ? -30 : -50;
  }
}