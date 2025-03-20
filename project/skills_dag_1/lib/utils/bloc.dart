import 'package:skills_dag_1/models/student.dart';

class Bloc {

  static final Bloc _singleton = Bloc._internal();

  late Student _valueToBeSet;
  late Student _valueAlreadyInSingleton;
  late Student _passedValueInContructor;
  late bool _hasSetDropdown = false;

  get getValueToBeSet => _valueToBeSet;
  get getHasSetDropdown => _hasSetDropdown;

  get getValueAlreadyInSingleton => _valueAlreadyInSingleton;

  get getPassedValueInConstructor => _passedValueInContructor;

  void setValue(newValue) {
    _valueToBeSet = newValue;
    print("value to be set $_valueToBeSet");
  }
  void setHasSetDropdown(bool value) {
    _hasSetDropdown = value;
  }

  factory Bloc() {
    _singleton._valueAlreadyInSingleton = Student("", "", 0, 0);
    _singleton._passedValueInContructor = Student("", "", 0, 0);
    return _singleton;
  }

  Bloc._internal();
}